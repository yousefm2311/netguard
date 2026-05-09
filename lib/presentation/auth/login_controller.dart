import 'package:get/get.dart';
import '../../domain/use_cases/auth_use_cases.dart';
import '../../core/routes/app_routes.dart';

class LoginController extends GetxController {
  final LoginUseCase _loginUseCase;
  final LogoutUseCase _logoutUseCase;

  var isLoading = false.obs;
  var obscurePassword = true.obs;
  var emailError = ''.obs;

  LoginController(this._loginUseCase, this._logoutUseCase);

  void togglePasswordVisibility() {
    obscurePassword.value = !obscurePassword.value;
  }

  Future<void> login(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      Get.snackbar('Error', 'Please enter email and password');
      return;
    }

    isLoading.value = true;
    try {
      await _loginUseCase.execute(email, password);
      Get.offAllNamed(AppRoutes.dashboard);
    } catch (e) {
      Get.snackbar('Login Failed', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> logout() async {
    await _logoutUseCase.execute();
    Get.offAllNamed(AppRoutes.login);
  }
}
