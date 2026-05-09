import 'package:get/get.dart';
import '../../domain/use_cases/device_use_cases.dart';
import '../../data/models/device.dart';

class DevicesController extends GetxController {
  final GetDevicesUseCase _getDevicesUseCase;
  final BlockDeviceUseCase _blockDeviceUseCase;
  final LimitSpeedUseCase _limitSpeedUseCase;

  var isLoading = true.obs;
  var allDevices = <Device>[].obs;
  var filteredDevices = <Device>[].obs;
  var selectedCategory = 'All'.obs;

  DevicesController(this._getDevicesUseCase, this._blockDeviceUseCase, this._limitSpeedUseCase);

  @override
  void onInit() {
    super.onInit();
    fetchDevices();
  }

  Future<void> fetchDevices() async {
    isLoading.value = true;
    try {
      allDevices.value = await _getDevicesUseCase.execute();
      filterDevices(selectedCategory.value);
    } catch (e) {
      Get.snackbar('Error', 'Failed to load devices');
    } finally {
      isLoading.value = false;
    }
  }

  void filterDevices(String category) {
    selectedCategory.value = category;
    if (category == 'All') {
      filteredDevices.value = allDevices;
    } else {
      filteredDevices.value = allDevices.where((d) => d.type.toLowerCase() == category.toLowerCase()).toList();
    }
  }

  Future<void> toggleBlockDevice(Device device) async {
    try {
      final newStatus = !device.isBlocked;
      await _blockDeviceUseCase.execute(device.id); 
      
      final indexAll = allDevices.indexWhere((d) => d.id == device.id);
      if (indexAll != -1) {
        allDevices[indexAll] = device.copyWith(isBlocked: newStatus);
      }
      filterDevices(selectedCategory.value); // Re-apply filter to update filtered list

      Get.snackbar('Success', 'Device ${device.name} ${newStatus ? 'blocked' : 'unblocked'}');
    } catch (e) {
      Get.snackbar('Error', 'Failed to change block status');
    }
  }
}
