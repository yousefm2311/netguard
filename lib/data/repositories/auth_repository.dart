import '../providers/api_client.dart';
import '../providers/storage_service.dart';
import '../models/user.dart';

class AuthRepository {
  final ApiClient _apiClient;
  final StorageService _storageService;

  AuthRepository(this._apiClient, this._storageService);

  Future<User> login(String email, String password) async {
    try {
      final response = await _apiClient.client.post('/login', data: {
        'email': email,
        'password': password,
      });

      final token = response.data['token'];
      final userData = response.data['user'];

      await _storageService.saveToken(token);

      return User.fromJson(userData);
    } catch (e) {
      throw Exception('Login failed: $e');
    }
  }

  Future<void> logout() async {
    await _storageService.deleteToken();
  }
}
