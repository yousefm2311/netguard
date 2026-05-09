import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app/routes/app_routes.dart';
import '../../../../core/widgets/smartnet_ui.dart';
import '../controllers/settings_controller.dart';

class SettingsView extends GetView<SettingsController> {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingsController>(
      builder: (_) {
        return SmartNetPage(
          child: ListView(
            children: [
              SmartNetHeroCard(
                title: 'network_preferences'.tr,
                subtitle:
                    'Adjust theme, localization, security, support, and backend preferences from one place.',
              ),
              const SizedBox(height: 16),
              SmartNetPanel(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SmartNetSectionTitle(
                      title: 'Preferences',
                      subtitle:
                          'Appearance, language, and backend configuration.',
                    ),
                    const SizedBox(height: 16),
                    SmartNetSettingTile(
                      icon: Icons.dark_mode_rounded,
                      title: 'dark_mode'.tr,
                      subtitle: 'theme_mode'.tr,
                      trailing: Switch.adaptive(
                        value: controller.themeMode == ThemeMode.dark,
                        onChanged: (value) {
                          controller.setThemeMode(
                            value ? ThemeMode.dark : ThemeMode.light,
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 12),
                    SmartNetPanel(
                      padding: const EdgeInsets.all(18),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'choose_language'.tr,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(height: 14),
                          SegmentedButton<String>(
                            segments: [
                              ButtonSegment(
                                value: 'en',
                                label: Text('english'.tr),
                              ),
                              ButtonSegment(
                                value: 'ar',
                                label: Text('arabic'.tr),
                              ),
                            ],
                            selected: {controller.locale.languageCode},
                            onSelectionChanged: (selection) {
                              controller.setLocale(Locale(selection.first));
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    SmartNetPanel(
                      padding: const EdgeInsets.all(18),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'base_url'.tr,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(height: 14),
                          TextField(
                            controller: controller.baseUrlController,
                            decoration: InputDecoration(
                              labelText: 'base_url'.tr,
                              prefixIcon: const Icon(Icons.link_rounded),
                            ),
                          ),
                          const SizedBox(height: 12),
                          FilledButton.tonal(
                            onPressed: controller.saveBaseUrl,
                            child: Text('save_api_settings'.tr),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              SmartNetPanel(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SmartNetSectionTitle(
                      title: 'More screens',
                      subtitle: 'Open the remaining management sections from the design pack.',
                    ),
                    const SizedBox(height: 16),
                    SmartNetSettingTile(
                      icon: Icons.shield_rounded,
                      title: 'security_settings'.tr,
                      subtitle: 'Firewall, filtering, and intrusion controls',
                      trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
                      onTap: () => Get.toNamed(AppRoutes.securitySettings),
                    ),
                    const SizedBox(height: 12),
                    SmartNetSettingTile(
                      icon: Icons.people_alt_rounded,
                      title: 'guest_access'.tr,
                      subtitle: 'Isolated guest network and visitor controls',
                      trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
                      onTap: () => Get.toNamed(AppRoutes.guestAccess),
                    ),
                    const SizedBox(height: 12),
                    SmartNetSettingTile(
                      icon: Icons.history_rounded,
                      title: 'activity_history'.tr,
                      subtitle: 'Recent network and admin events',
                      trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
                      onTap: () => Get.toNamed(AppRoutes.activityHistory),
                    ),
                    const SizedBox(height: 12),
                    SmartNetSettingTile(
                      icon: Icons.support_agent_rounded,
                      title: 'help_center'.tr,
                      subtitle: 'FAQs, troubleshooting, and support guidance',
                      trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
                      onTap: () => Get.toNamed(AppRoutes.helpCenter),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
