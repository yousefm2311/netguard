import 'package:get/get.dart';

import '../../../activity_history/domain/entities/activity_event.dart';
import '../../../activity_history/domain/repositories/activity_history_repository.dart';
import '../../../devices/domain/entities/network_device.dart';
import '../../../devices/domain/repositories/devices_repository.dart';

class DeviceProfileController extends GetxController {
  DeviceProfileController({
    required this.devicesRepository,
    required this.activityRepository,
  });

  final DevicesRepository devicesRepository;
  final ActivityHistoryRepository activityRepository;

  NetworkDevice? device;
  List<ActivityEvent> recentEvents = [];
  bool isLoading = false;

  @override
  void onInit() {
    super.onInit();
    final arg = Get.arguments;
    if (arg is NetworkDevice) {
      device = arg;
      load();
    }
  }

  Future<void> load() async {
    if (device == null) return;
    isLoading = true;
    update();
    recentEvents = await activityRepository.fetchEventsForDevice(device!.id);
    isLoading = false;
    update();
  }
}
