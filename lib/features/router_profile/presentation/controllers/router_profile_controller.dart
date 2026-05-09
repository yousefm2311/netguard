import 'package:get/get.dart';
import '../../data/models/router_info.dart';
import '../../../../core/network/mock_data_source.dart';

class RouterProfileController extends GetxController {
  final Rx<RouterInfo?> routerInfo = Rx<RouterInfo?>(null);
  final RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchRouterData();
  }

  Future<void> fetchRouterData() async {
    isLoading.value = true;
    try {
      await Future.delayed(const Duration(milliseconds: 600));
      routerInfo.value = MockDataSource.routerInfo;
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> restartRouter() async {
    Get.defaultDialog(
      title: 'Restart Router',
      middleText: 'Are you sure you want to restart your router? Network will be down for 2 minutes.',
      textConfirm: 'Restart',
      textCancel: 'Cancel',
      confirmTextColor: Get.theme.colorScheme.onPrimary,
      buttonColor: Get.theme.colorScheme.error,
      onConfirm: () {
        Get.back();
        Get.snackbar('Restarting', 'Router is rebooting...', snackPosition: SnackPosition.BOTTOM);
      },
    );
  }
}
