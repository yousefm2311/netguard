import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app/routes/app_routes.dart';
import '../../../auth/presentation/controllers/auth_controller.dart';

class RootView extends GetView<AuthController> {
  const RootView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (_) {
        if (controller.isCheckingSession) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (controller.isLoggedIn) {
            Get.offAllNamed(AppRoutes.shell);
          } else {
            Get.offAllNamed(AppRoutes.login);
          }
        });

        return const Scaffold(
          body: SizedBox.shrink(),
        );
      },
    );
  }
}
