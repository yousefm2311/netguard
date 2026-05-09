import 'package:get/get.dart';

class RouterProfileController extends GetxController {
  var isDetecting = false.obs;
  var routerModel = ''.obs;

  void detectRouter() async {
    isDetecting.value = true;
    routerModel.value = '';

    // Mock detection delay
    await Future.delayed(const Duration(seconds: 2));

    routerModel.value = 'TP-Link Archer AX50 (Mock)';
    isDetecting.value = false;
  }

  void downloadProfile() async {
    if (routerModel.value.isEmpty) {
      Get.snackbar('Error', 'Please detect router first');
      return;
    }

    Get.snackbar('Downloading', 'Downloading profile for ${routerModel.value}...');
    await Future.delayed(const Duration(seconds: 2));
    Get.snackbar('Success', 'Profile downloaded and applied successfully');
  }
}
