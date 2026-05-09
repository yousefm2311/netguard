import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app/routes/app_routes.dart';
import '../../domain/entities/auth_session.dart';
import '../../domain/repositories/auth_repository.dart';

class AuthController extends GetxController {
  AuthController({
    required this.repository,
  });

  final AuthRepository repository;

  final formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController(text: 'admin');
  final passwordController = TextEditingController(text: 'admin123');

  bool isLoading = false;
  bool isCheckingSession = true;
  AuthSession? session;

  bool get isLoggedIn => session != null;

  @override
  void onInit() {
    super.onInit();
    bootstrap();
  }

  Future<void> bootstrap() async {
    final token = await repository.getSavedToken();
    isCheckingSession = false;
    if (token != null && token.isNotEmpty) {
      session = AuthSession(
        token: token,
        userId: 'admin',
        userName: 'Network Admin',
        role: 'admin',
      );
    }
    update();
  }

  Future<void> login() async {
    if (!(formKey.currentState?.validate() ?? false)) {
      return;
    }
    isLoading = true;
    update();

    try {
      session = await repository.login(
        username: usernameController.text.trim(),
        password: passwordController.text.trim(),
      );
      Get.offAllNamed(AppRoutes.shell);
    } catch (error) {
      Get.snackbar('Login failed', error.toString());
    } finally {
      isLoading = false;
      update();
    }
  }

  Future<void> logout() async {
    await repository.logout();
    session = null;
    update();
    Get.offAllNamed(AppRoutes.login);
  }
}
