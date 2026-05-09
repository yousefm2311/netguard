import '../../data/repositories/auth_repository.dart';
import '../../data/models/user.dart';

class LoginUseCase {
  final AuthRepository _repository;

  LoginUseCase(this._repository);

  Future<User> execute(String email, String password) {
    if (email.isEmpty || password.isEmpty) {
      throw Exception('Email and password cannot be empty');
    }
    return _repository.login(email, password);
  }
}

class LogoutUseCase {
  final AuthRepository _repository;

  LogoutUseCase(this._repository);

  Future<void> execute() {
    return _repository.logout();
  }
}
