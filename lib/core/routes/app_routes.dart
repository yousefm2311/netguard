import 'package:get/get.dart';

import '../../presentation/auth/login_screen.dart';
import '../../presentation/main/main_screen.dart';
import '../../presentation/devices/devices_screen.dart';
import '../../presentation/analytics/analytics_screen.dart';
import '../../presentation/settings/settings_screen.dart';
import '../../presentation/router_profile/router_profile_screen.dart';

class AppRoutes {
  static const String login = '/login';
  static const String dashboard = '/dashboard';
  static const String devices = '/devices';
  static const String analytics = '/analytics';
  static const String settings = '/settings';
  static const String routerProfile = '/router_profile';

  static final List<GetPage> pages = [
    GetPage(name: login, page: () => const LoginScreen()),
    GetPage(name: dashboard, page: () => const MainScreen()),
    GetPage(name: devices, page: () => const DevicesScreen()),
    GetPage(name: analytics, page: () => const AnalyticsScreen()),
    GetPage(name: settings, page: () => const SettingsScreen()),
    GetPage(name: routerProfile, page: () => const RouterProfileScreen()),
  ];
}
