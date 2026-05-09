import 'package:get/get.dart';
import '../../../devices/data/models/device_model.dart';
import '../../../../core/network/mock_data_source.dart';

class DeviceProfileController extends GetxController {
  final Rx<DeviceModel?> device = Rx<DeviceModel?>(null);
  final RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    final deviceId = Get.arguments as String?;
    if (deviceId != null) {
      fetchDeviceDetails(deviceId);
    }
  }

  Future<void> fetchDeviceDetails(String id) async {
    isLoading.value = true;
    try {
      await Future.delayed(const Duration(milliseconds: 500));
      device.value = MockDataSource.devices.firstWhere(
        (d) => d.id == id,
        orElse: () => MockDataSource.devices.first,
      );
    } finally {
      isLoading.value = false;
    }
  }

  void blockDevice() {
    Get.snackbar('Action Triggered', '${device.value?.name} has been blocked.', snackPosition: SnackPosition.BOTTOM);
  }

  void limitSpeed() {
    Get.snackbar('Action Triggered', 'Speed limits applied to ${device.value?.name}.', snackPosition: SnackPosition.BOTTOM);
  }
}
