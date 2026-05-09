import 'dart:async';

import 'package:get/get.dart';

import '../../../analytics/presentation/controllers/analytics_controller.dart';
import '../../../devices/presentation/controllers/devices_controller.dart';

class ShellController extends GetxController {
  int currentIndex = 0;
  Timer? _refreshTimer;

  @override
  void onInit() {
    super.onInit();
    _refreshTimer = Timer.periodic(const Duration(seconds: 20), (_) {
      if (Get.isRegistered<AnalyticsController>()) {
        Get.find<AnalyticsController>().fetchStats();
      }
      if (Get.isRegistered<DevicesController>()) {
        Get.find<DevicesController>().fetchDevices();
      }
    });
  }

  void setIndex(int index) {
    currentIndex = index;
    update();
  }

  @override
  void onClose() {
    _refreshTimer?.cancel();
    super.onClose();
  }
}
