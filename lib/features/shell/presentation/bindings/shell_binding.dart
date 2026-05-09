import 'package:get/get.dart';

import '../../../activity_history/domain/repositories/activity_history_repository.dart';
import '../../../activity_history/presentation/controllers/activity_history_controller.dart';
import '../../../analytics/domain/repositories/analytics_repository.dart';
import '../../../analytics/presentation/controllers/analytics_controller.dart';
import '../../../device_profile/presentation/controllers/device_profile_controller.dart';
import '../../../devices/presentation/bindings/devices_binding.dart';
import '../../../guest_access/domain/repositories/guest_access_repository.dart';
import '../../../guest_access/presentation/controllers/guest_access_controller.dart';
import '../../../help_center/domain/repositories/help_center_repository.dart';
import '../../../help_center/presentation/controllers/help_center_controller.dart';
import '../../../router_profile/domain/repositories/router_profile_repository.dart';
import '../../../router_profile/presentation/controllers/router_profile_controller.dart';
import '../../../security_settings/domain/repositories/security_settings_repository.dart';
import '../../../security_settings/presentation/controllers/security_settings_controller.dart';
import '../../../settings/presentation/controllers/settings_controller.dart';
import '../../../devices/domain/repositories/devices_repository.dart';
import '../controllers/shell_controller.dart';

class ShellBinding extends Bindings {
  @override
  void dependencies() {
    DevicesBinding().dependencies();
    Get.lazyPut(
      () => AnalyticsController(
        repository: Get.find<AnalyticsRepository>(),
      ),
      fenix: true,
    );
    Get.lazyPut(
      () => RouterProfileController(
        repository: Get.find<RouterProfileRepository>(),
      ),
      fenix: true,
    );
    Get.lazyPut(
      () => ActivityHistoryController(
        repository: Get.find<ActivityHistoryRepository>(),
      ),
      fenix: true,
    );
    Get.lazyPut(
      () => GuestAccessController(
        repository: Get.find<GuestAccessRepository>(),
      ),
      fenix: true,
    );
    Get.lazyPut(
      () => SecuritySettingsController(
        repository: Get.find<SecuritySettingsRepository>(),
      ),
      fenix: true,
    );
    Get.lazyPut(
      () => HelpCenterController(
        repository: Get.find<HelpCenterRepository>(),
      ),
      fenix: true,
    );
    Get.lazyPut(
      () => DeviceProfileController(
        devicesRepository: Get.find<DevicesRepository>(),
        activityRepository: Get.find<ActivityHistoryRepository>(),
      ),
      fenix: true,
    );
    Get.lazyPut(
      () => ShellController(),
      fenix: true,
    );
    Get.find<SettingsController>();
  }
}
