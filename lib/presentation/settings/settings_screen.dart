import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'settings_controller.dart';
import '../../core/routes/app_routes.dart';

class SettingsScreen extends GetView<SettingsController> {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SettingsController(Get.find()));

    return Scaffold(
      appBar: AppBar(
        title: Text('settings'.tr),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildSectionHeader(context, 'Appearance'),
          Obx(() => SwitchListTile(
            title: Text('dark_mode'.tr),
            secondary: const Icon(Icons.dark_mode),
            value: controller.isDarkMode.value,
            onChanged: controller.toggleTheme,
          )),
          const Divider(),
          _buildSectionHeader(context, 'Language'),
          Obx(() => ListTile(
            leading: const Icon(Icons.language),
            title: Text('language'.tr),
            trailing: DropdownButton<String>(
              value: controller.currentLanguage.value,
              onChanged: (String? newValue) {
                if (newValue != null) controller.changeLanguage(newValue);
              },
              items: const [
                DropdownMenuItem(value: 'en', child: Text('English')),
                DropdownMenuItem(value: 'ar', child: Text('العربية')),
              ],
            ),
          )),
          const Divider(),
          _buildSectionHeader(context, 'Network'),
          ListTile(
            leading: const Icon(Icons.router),
            title: Text('router_profile'.tr),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () => Get.toNamed(AppRoutes.routerProfile),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Theme.of(context).colorScheme.primary),
      ),
    );
  }
}
