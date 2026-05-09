import 'package:get/get.dart';
import '../../data/models/device_model.dart';
import '../../../../core/network/mock_data_source.dart';

class DevicesController extends GetxController {
  final RxList<DeviceModel> allDevices = <DeviceModel>[].obs;
  final RxList<DeviceModel> filteredDevices = <DeviceModel>[].obs;
  
  final RxBool isLoading = true.obs;
  final RxString currentFilter = 'All'.obs;

  final List<String> filterOptions = ['All', 'Online', 'Limited', 'Blocked'];

  @override
  void onInit() {
    super.onInit();
    fetchDevices();
  }

  Future<void> fetchDevices() async {
    isLoading.value = true;
    try {
      await Future.delayed(const Duration(milliseconds: 800));
      allDevices.assignAll(MockDataSource.devices);
      applyFilter(currentFilter.value);
    } finally {
      isLoading.value = false;
    }
  }

  void applyFilter(String filter) {
    currentFilter.value = filter;
    if (filter == 'All') {
      filteredDevices.assignAll(allDevices);
    } else {
      filteredDevices.assignAll(
        allDevices.where((d) => d.status.toLowerCase() == filter.toLowerCase()).toList(),
      );
    }
  }

  Future<void> toggleDeviceStatus(String deviceId, bool isBlocked) async {
    // Optimistic update
    final index = allDevices.indexWhere((d) => d.id == deviceId);
    if (index != -1) {
      final device = allDevices[index];
      allDevices[index] = device.copyWith(
        status: isBlocked ? 'blocked' : 'online',
        speedLimit: null, // Reset limit when unblocked
      );
      applyFilter(currentFilter.value);
      
      Get.snackbar(
        'Success', 
        isBlocked ? '${device.name} blocked.' : '${device.name} unblocked.',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> refreshData() async {
    await fetchDevices();
  }
}
