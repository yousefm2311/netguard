import 'package:dio/dio.dart';

import '../../../../core/mock/mock_backend.dart';
import '../../../../core/network/api_client.dart';
import '../../../../core/storage/secure_storage_service.dart';
import '../../domain/entities/auth_session.dart';
import '../../domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({
    required this.apiClient,
    required this.secureStorageService,
  });

  final ApiClient apiClient;
  final SecureStorageService secureStorageService;

  @override
  Future<String?> getSavedToken() => secureStorageService.getToken();

  @override
  Future<AuthSession> login({
    required String username,
    required String password,
  }) async {
    try {
      final response = await apiClient.dio.post<Map<String, dynamic>>(
        '/login',
        data: {
          'username': username,
          'password': password,
        },
      );

      final data = response.data ?? <String, dynamic>{};
      final user = (data['user'] as Map<String, dynamic>? ?? <String, dynamic>{});
      final session = AuthSession(
        token: data['token']?.toString() ?? '',
        userId: user['id']?.toString() ?? 'admin',
        userName: user['name']?.toString() ?? username,
        role: user['role']?.toString() ?? 'admin',
      );
      await secureStorageService.saveToken(session.token);
      return session;
    } on DioException {
      final session = MockBackend.login(username, password);
      await secureStorageService.saveToken(session.token);
      return session;
    }
  }

  @override
  Future<void> logout() => secureStorageService.clearToken();
}
