import 'package:get/get.dart';

import '../../domain/entities/network_device.dart';
import '../../domain/repositories/devices_repository.dart';

class DevicesController extends GetxController {
  DevicesController({
    required this.repository,
  });

  final DevicesRepository repository;

  bool isLoading = false;
  List<NetworkDevice> devices = [];

  @override
  void onInit() {
    super.onInit();
    fetchDevices();
  }

  Future<void> fetchDevices() async {
    isLoading = true;
    update();
    devices = await repository.fetchDevices();
    isLoading = false;
    update();
  }

  Future<void> blockDevice(NetworkDevice device) async {
    await repository.blockDevice(device.id);
    devices = devices
        .map((item) => item.id == device.id ? item.copyWith(isBlocked: true) : item)
        .toList();
    update();
  }

  Future<void> limitSpeed(NetworkDevice device, int speed) async {
    await repository.limitSpeed(device.id, speed);
    devices = devices
        .map(
          (item) => item.id == device.id
              ? item.copyWith(speedLimitMbps: speed)
              : item,
        )
        .toList();
    update();
  }

  Future<void> setQuota(NetworkDevice device, int quota) async {
    await repository.setQuota(device.id, quota);
    devices = devices
        .map((item) => item.id == device.id ? item.copyWith(quotaGb: quota) : item)
        .toList();
    update();
  }
}
