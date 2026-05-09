import 'package:get/get.dart';

import '../../features/activity_history/presentation/views/activity_history_view.dart';
import '../../features/auth/presentation/bindings/auth_binding.dart';
import '../../features/auth/presentation/views/login_view.dart';
import '../../features/device_profile/presentation/views/device_profile_view.dart';
import '../../features/guest_access/presentation/views/guest_access_view.dart';
import '../../features/help_center/presentation/views/help_center_view.dart';
import '../../features/root/presentation/views/root_view.dart';
import '../../features/security_settings/presentation/views/security_settings_view.dart';
import '../../features/shell/presentation/bindings/shell_binding.dart';
import '../../features/shell/presentation/views/shell_view.dart';
import 'app_routes.dart';

class AppPages {
  static const root = AppRoutes.root;

  static final pages = <GetPage<dynamic>>[
    GetPage(
      name: AppRoutes.root,
      page: () => const RootView(),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoutes.shell,
      page: () => const ShellView(),
      binding: ShellBinding(),
    ),
    GetPage(
      name: AppRoutes.deviceProfile,
      page: () => const DeviceProfileView(),
      binding: ShellBinding(),
    ),
    GetPage(
      name: AppRoutes.securitySettings,
      page: () => const SecuritySettingsView(),
      binding: ShellBinding(),
    ),
    GetPage(
      name: AppRoutes.activityHistory,
      page: () => const ActivityHistoryView(),
      binding: ShellBinding(),
    ),
    GetPage(
      name: AppRoutes.guestAccess,
      page: () => const GuestAccessView(),
      binding: ShellBinding(),
    ),
    GetPage(
      name: AppRoutes.helpCenter,
      page: () => const HelpCenterView(),
      binding: ShellBinding(),
    ),
  ];
}
