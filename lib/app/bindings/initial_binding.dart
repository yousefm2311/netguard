import 'package:get/get.dart';

import '../../features/activity_history/data/repositories/activity_history_repository_impl.dart';
import '../../features/activity_history/domain/repositories/activity_history_repository.dart';
import '../../core/network/api_client.dart';
import '../../core/storage/secure_storage_service.dart';
import '../../features/analytics/data/repositories/analytics_repository_impl.dart';
import '../../features/analytics/domain/repositories/analytics_repository.dart';
import '../../features/auth/data/repositories/auth_repository_impl.dart';
import '../../features/auth/domain/repositories/auth_repository.dart';
import '../../features/auth/presentation/controllers/auth_controller.dart';
import '../../features/devices/data/repositories/devices_repository_impl.dart';
import '../../features/devices/domain/repositories/devices_repository.dart';
import '../../features/guest_access/data/repositories/guest_access_repository_impl.dart';
import '../../features/guest_access/domain/repositories/guest_access_repository.dart';
import '../../features/help_center/data/repositories/help_center_repository_impl.dart';
import '../../features/help_center/domain/repositories/help_center_repository.dart';
import '../../features/router_profile/data/repositories/router_profile_repository_impl.dart';
import '../../features/router_profile/domain/repositories/router_profile_repository.dart';
import '../../features/security_settings/data/repositories/security_settings_repository_impl.dart';
import '../../features/security_settings/domain/repositories/security_settings_repository.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SecureStorageService(), permanent: true);
    Get.put(ApiClient(), permanent: true);

    Get.lazyPut<AuthRepository>(
      () => AuthRepositoryImpl(
        apiClient: Get.find<ApiClient>(),
        secureStorageService: Get.find<SecureStorageService>(),
      ),
      fenix: true,
    );

    Get.lazyPut<DevicesRepository>(
      () => DevicesRepositoryImpl(apiClient: Get.find<ApiClient>()),
      fenix: true,
    );

    Get.lazyPut<AnalyticsRepository>(
      () => AnalyticsRepositoryImpl(apiClient: Get.find<ApiClient>()),
      fenix: true,
    );

    Get.lazyPut<ActivityHistoryRepository>(
      ActivityHistoryRepositoryImpl.new,
      fenix: true,
    );

    Get.lazyPut<RouterProfileRepository>(
      () => RouterProfileRepositoryImpl(apiClient: Get.find<ApiClient>()),
      fenix: true,
    );

    Get.lazyPut<GuestAccessRepository>(
      GuestAccessRepositoryImpl.new,
      fenix: true,
    );

    Get.lazyPut<SecuritySettingsRepository>(
      SecuritySettingsRepositoryImpl.new,
      fenix: true,
    );

    Get.lazyPut<HelpCenterRepository>(
      HelpCenterRepositoryImpl.new,
      fenix: true,
    );

    Get.put(
      AuthController(
        repository: Get.find<AuthRepository>(),
      ),
      permanent: true,
    );
  }
}
