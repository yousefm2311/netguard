import '../entities/auth_session.dart';

abstract class AuthRepository {
  Future<AuthSession> login({
    required String username,
    required String password,
  });

  Future<String?> getSavedToken();

  Future<void> logout();
}
