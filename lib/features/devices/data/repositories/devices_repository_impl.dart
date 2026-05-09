import 'package:dio/dio.dart';

import '../../../../core/mock/mock_backend.dart';
import '../../../../core/network/api_client.dart';
import '../../domain/entities/network_device.dart';
import '../../domain/repositories/devices_repository.dart';

class DevicesRepositoryImpl implements DevicesRepository {
  DevicesRepositoryImpl({
    required this.apiClient,
  });

  final ApiClient apiClient;

  @override
  Future<void> blockDevice(String deviceId) async {
    try {
      await apiClient.dio.post('/device/block', data: {'deviceId': deviceId});
    } on DioException {
      return;
    }
  }

  @override
  Future<List<NetworkDevice>> fetchDevices() async {
    try {
      final response = await apiClient.dio.get<List<dynamic>>('/devices');
      final data = response.data ?? [];
      return data
          .map(
            (item) => NetworkDevice(
              id: item['id'].toString(),
              name: item['name'].toString(),
              ip: item['ip'].toString(),
              mac: item['mac'].toString(),
              usageGb: (item['usage'] as num).toDouble(),
              isBlocked: item['isBlocked'] == true,
              speedLimitMbps: (item['speedLimit'] as num?)?.toInt() ?? 0,
              quotaGb: (item['quota'] as num?)?.toInt() ?? 0,
              status: item['status']?.toString() ?? 'online',
            ),
          )
          .toList();
    } on DioException {
      return MockBackend.devices();
    }
  }

  @override
  Future<void> limitSpeed(String deviceId, int speedMbps) async {
    try {
      await apiClient.dio.post(
        '/device/speed-limit',
        data: {'deviceId': deviceId, 'speed': speedMbps},
      );
    } on DioException {
      return;
    }
  }

  @override
  Future<void> setQuota(String deviceId, int quotaGb) async {
    try {
      await apiClient.dio.post(
        '/device/quota',
        data: {'deviceId': deviceId, 'gb': quotaGb},
      );
    } on DioException {
      return;
    }
  }
}
