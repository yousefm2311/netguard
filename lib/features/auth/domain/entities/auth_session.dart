import 'package:equatable/equatable.dart';

class AuthSession extends Equatable {
  const AuthSession({
    required this.token,
    required this.userId,
    required this.userName,
    required this.role,
  });

  final String token;
  final String userId;
  final String userName;
  final String role;

  @override
  List<Object?> get props => [token, userId, userName, role];
}
