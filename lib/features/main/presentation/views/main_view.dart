import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/main_controller.dart';
import '../../../../app/themes/app_colors.dart';
// Placeholders for screens
import '../../../settings/presentation/views/settings_view.dart';
import '../../../dashboard/presentation/views/dashboard_screen.dart';
import '../../../devices/presentation/views/devices_screen.dart';
import '../../../activity_log/presentation/views/analytics_screen.dart';

class MainView extends GetView<MainController> {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Obx(() {
        return IndexedStack(
          index: controller.currentIndex,
          children: [
            const DashboardScreen(),
            const DevicesScreen(),
            const AnalyticsScreen(),
            const SettingsView(), // The Settings screen you already saw
          ],
        );
      }),
      bottomNavigationBar: Obx(() {
        return Container(
          decoration: BoxDecoration(
            color: theme.colorScheme.surface,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 20,
                offset: const Offset(0, -5),
              ),
            ],
            border: Border(
              top: BorderSide(
                color: theme.brightness == Brightness.dark 
                    ? AppColors.borderDark 
                    : AppColors.borderLight,
              ),
            ),
          ),
          child: NavigationBar(
            selectedIndex: controller.currentIndex,
            onDestinationSelected: controller.changePage,
            backgroundColor: Colors.transparent,
            elevation: 0,
            indicatorColor: theme.colorScheme.primaryContainer,
            destinations: [
              NavigationDestination(
                icon: const Icon(Icons.dashboard_outlined),
                selectedIcon: Icon(Icons.dashboard_rounded, color: theme.colorScheme.primary),
                label: 'dashboard'.tr,
              ),
              NavigationDestination(
                icon: const Icon(Icons.devices_outlined),
                selectedIcon: Icon(Icons.devices_rounded, color: theme.colorScheme.primary),
                label: 'devices'.tr,
              ),
              NavigationDestination(
                icon: const Icon(Icons.analytics_outlined),
                selectedIcon: Icon(Icons.analytics_rounded, color: theme.colorScheme.primary),
                label: 'analytics'.tr,
              ),
              NavigationDestination(
                icon: const Icon(Icons.settings_outlined),
                selectedIcon: Icon(Icons.settings_rounded, color: theme.colorScheme.primary),
                label: 'settings'.tr,
              ),
            ],
          ),
        );
      }),
    );
  }
}
