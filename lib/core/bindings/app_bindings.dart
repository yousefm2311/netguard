import 'package:get/get.dart';
import '../../data/providers/api_client.dart';
import '../../data/providers/storage_service.dart';
import '../../data/repositories/auth_repository.dart';
import '../../data/repositories/device_repository.dart';
import '../../data/repositories/stats_repository.dart';
import '../../domain/use_cases/auth_use_cases.dart';
import '../../domain/use_cases/device_use_cases.dart';
import '../../domain/use_cases/stats_use_cases.dart';
import '../../presentation/auth/login_controller.dart';
import '../../presentation/dashboard/dashboard_controller.dart';
import '../../presentation/devices/devices_controller.dart';
import '../../presentation/analytics/analytics_controller.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    // Providers
    Get.lazyPut(() => ApiClient(), fenix: true);
    Get.lazyPut(() => StorageService(), fenix: true);

    // Repositories
    Get.lazyPut(() => AuthRepository(Get.find(), Get.find()), fenix: true);
    Get.lazyPut(() => DeviceRepository(Get.find()), fenix: true);
    Get.lazyPut(() => StatsRepository(Get.find()), fenix: true);

    // Use Cases
    Get.lazyPut(() => LoginUseCase(Get.find()), fenix: true);
    Get.lazyPut(() => LogoutUseCase(Get.find()), fenix: true);
    Get.lazyPut(() => GetDevicesUseCase(Get.find()), fenix: true);
    Get.lazyPut(() => BlockDeviceUseCase(Get.find()), fenix: true);
    Get.lazyPut(() => LimitSpeedUseCase(Get.find()), fenix: true);
    Get.lazyPut(() => GetStatsUseCase(Get.find()), fenix: true);

    // Controllers (Inject those that are global or needed early, otherwise use bindings in GetPage)
    Get.lazyPut(() => LoginController(Get.find(), Get.find()), fenix: true);
    Get.lazyPut(() => DashboardController(Get.find()), fenix: true);
    Get.lazyPut(() => DevicesController(Get.find(), Get.find(), Get.find()), fenix: true);
    Get.lazyPut(() => AnalyticsController(Get.find()), fenix: true); // Add deps as needed
  }
}
