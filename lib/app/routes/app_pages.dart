import 'package:get/get.dart';

class AppRoutes {
  static const login = '/login';
  static const dashboard = '/dashboard';
  static const devices = '/devices';
  static const deviceProfile = '/device-profile';
  static const routerProfile = '/router-profile';
  static const analytics = '/analytics';
  static const activityLog = '/activity-log';
  static const schedule = '/schedule';
  static const guestAccess = '/guest-access';
  static const securitySettings = '/security-settings';
  static const networkLog = '/network-log';
  static const helpCenter = '/help';
  static const supportCenter = '/support';
  static const settings = '/settings';
}

class AppPages {
  static final pages = [
    // We will populate this as we build features in subsequent phases
    // GetPage(name: AppRoutes.login, page: () => const LoginScreen(), binding: AuthBinding()),
  ];
}
