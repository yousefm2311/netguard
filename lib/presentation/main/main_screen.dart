import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'main_controller.dart';
import '../dashboard/dashboard_screen.dart';
import '../devices/devices_screen.dart';
import '../analytics/analytics_screen.dart';
import '../settings/settings_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MainController());

    final List<Widget> pages = [
      const DashboardScreen(),
      const DevicesScreen(),
      const AnalyticsScreen(),
      const SettingsScreen(),
    ];

    return Scaffold(
      body: Obx(() => pages[controller.currentIndex.value]),
      bottomNavigationBar: Obx(() => NavigationBar(
        selectedIndex: controller.currentIndex.value,
        onDestinationSelected: controller.changePage,
        destinations: [
          NavigationDestination(icon: const Icon(Icons.dashboard_outlined), selectedIcon: const Icon(Icons.dashboard), label: 'dashboard'.tr),
          NavigationDestination(icon: const Icon(Icons.devices_outlined), selectedIcon: const Icon(Icons.devices), label: 'devices'.tr),
          NavigationDestination(icon: const Icon(Icons.analytics_outlined), selectedIcon: const Icon(Icons.analytics), label: 'analytics'.tr),
          NavigationDestination(icon: const Icon(Icons.settings_outlined), selectedIcon: const Icon(Icons.settings), label: 'settings'.tr),
        ],
      )),
    );
  }
}
