import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app_routes.dart';
import '../../features/main/presentation/views/main_view.dart';
import '../../features/main/bindings/main_binding.dart';
import '../../features/device_profile/presentation/views/device_profile_screen.dart';
import '../../features/router_profile/presentation/views/router_profile_screen.dart';

class AppPages {
  // Boot into the shell (Main Wrapper) so the Bottom Navigation Bar appears!
  static const root = AppRoutes.shell;

  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.shell, 
      page: () => const MainView(),
      binding: MainBinding(),
    ),
    GetPage(
      name: AppRoutes.deviceProfile,
      page: () => const DeviceProfileScreen(),
    ),
    GetPage(
      name: AppRoutes.routerProfile,
      page: () => const RouterProfileScreen(),
    ),
    GetPage(
      name: AppRoutes.securitySettings, 
      page: () => Scaffold(appBar: AppBar(), body: const Center(child: Text('Security Settings')))
    ),
    GetPage(
      name: AppRoutes.guestAccess, 
      page: () => Scaffold(appBar: AppBar(), body: const Center(child: Text('Guest Access')))
    ),
    GetPage(
      name: AppRoutes.activityHistory, 
      page: () => Scaffold(appBar: AppBar(), body: const Center(child: Text('Activity History')))
    ),
    GetPage(
      name: AppRoutes.helpCenter, 
      page: () => Scaffold(appBar: AppBar(), body: const Center(child: Text('Help Center')))
    ),
  ];
}
