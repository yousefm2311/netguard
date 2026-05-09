import 'package:get/get.dart';

import '../../domain/repositories/auth_repository.dart';
import '../controllers/auth_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    if (Get.isRegistered<AuthController>()) {
      return;
    }

    Get.put(
      AuthController(
        repository: Get.find<AuthRepository>(),
      ),
      permanent: true,
    );
  }
}
