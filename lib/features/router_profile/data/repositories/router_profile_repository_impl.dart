import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../../core/mock/mock_backend.dart';
import '../../../../core/network/api_client.dart';
import '../../../../core/storage/app_prefs.dart';
import '../../domain/entities/router_profile.dart';
import '../../domain/repositories/router_profile_repository.dart';

class RouterProfileRepositoryImpl implements RouterProfileRepository {
  RouterProfileRepositoryImpl({
    required this.apiClient,
  });

  final ApiClient apiClient;

  @override
  Future<RouterProfile> detectRouter() async {
    try {
      final response = await apiClient.dio.get<Map<String, dynamic>>('/router/detect');
      final data = response.data ?? <String, dynamic>{};
      return RouterProfile(
        model: data['model']?.toString() ?? 'Unknown',
        firmwareVersion: data['firmwareVersion']?.toString() ?? 'Unknown',
        supportsQuota: data['supportsQuota'] == true,
        supportsSpeedLimit: data['supportsSpeedLimit'] == true,
        downloadedAt: DateTime.now().toIso8601String(),
        rawProfileJson: jsonEncode(data),
      );
    } on DioException {
      return MockBackend.routerProfile();
    }
  }

  @override
  Future<RouterProfile> downloadProfile(String routerModel) async {
    try {
      final response = await apiClient.dio.get<Map<String, dynamic>>(
        '/router/profile',
        queryParameters: {'model': routerModel},
      );
      final data = response.data ?? <String, dynamic>{};
      final profile = RouterProfile(
        model: data['model']?.toString() ?? routerModel,
        firmwareVersion: data['firmwareVersion']?.toString() ?? 'Unknown',
        supportsQuota: data['supportsQuota'] == true,
        supportsSpeedLimit: data['supportsSpeedLimit'] == true,
        downloadedAt: DateTime.now().toIso8601String(),
        rawProfileJson: jsonEncode(data),
      );
      await AppPrefs.setRouterProfileCache(jsonEncode({
        'model': profile.model,
        'firmwareVersion': profile.firmwareVersion,
        'supportsQuota': profile.supportsQuota,
        'supportsSpeedLimit': profile.supportsSpeedLimit,
        'downloadedAt': profile.downloadedAt,
        'rawProfileJson': profile.rawProfileJson,
      }));
      return profile;
    } on DioException {
      final profile = MockBackend.routerProfile();
      await AppPrefs.setRouterProfileCache(jsonEncode({
        'model': profile.model,
        'firmwareVersion': profile.firmwareVersion,
        'supportsQuota': profile.supportsQuota,
        'supportsSpeedLimit': profile.supportsSpeedLimit,
        'downloadedAt': profile.downloadedAt,
        'rawProfileJson': profile.rawProfileJson,
      }));
      return profile;
    }
  }

  @override
  Future<RouterProfile?> getCachedProfile() async {
    final raw = AppPrefs.getRouterProfileCache();
    if (raw == null || raw.isEmpty) {
      return null;
    }
    final data = jsonDecode(raw) as Map<String, dynamic>;
    return RouterProfile(
      model: data['model'].toString(),
      firmwareVersion: data['firmwareVersion'].toString(),
      supportsQuota: data['supportsQuota'] == true,
      supportsSpeedLimit: data['supportsSpeedLimit'] == true,
      downloadedAt: data['downloadedAt'].toString(),
      rawProfileJson: data['rawProfileJson'].toString(),
    );
  }
}
