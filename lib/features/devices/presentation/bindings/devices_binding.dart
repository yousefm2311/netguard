import 'package:get/get.dart';

import '../../domain/repositories/devices_repository.dart';
import '../controllers/devices_controller.dart';

class DevicesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => DevicesController(
        repository: Get.find<DevicesRepository>(),
      ),
      fenix: true,
    );
  }
}
