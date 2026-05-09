import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/widgets/smartnet_ui.dart';
import '../controllers/guest_access_controller.dart';

class GuestAccessView extends GetView<GuestAccessController> {
  const GuestAccessView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('guest_access'.tr)),
      body: GetBuilder<GuestAccessController>(
        builder: (_) {
          if (controller.isLoading || controller.settings == null) {
            return const Center(child: CircularProgressIndicator());
          }

          final settings = controller.settings!;
          return SmartNetPage(
            child: ListView(
              children: [
                SmartNetHeroCard(
                  title: 'guest_access'.tr,
                  subtitle: 'Create a separate temporary network for visitors with quota and speed control.',
                  trailing: Switch.adaptive(
                    value: settings.enabled,
                    onChanged: controller.toggleEnabled,
                  ),
                ),
                const SizedBox(height: 16),
                SmartNetPanel(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SmartNetSectionTitle(
                        title: 'guest_access'.tr,
                        subtitle: 'Network name, password, quota, and guest limits.',
                      ),
                      const SizedBox(height: 16),
                      TextField(
                        controller: controller.ssidController,
                        decoration: const InputDecoration(labelText: 'SSID'),
                      ),
                      const SizedBox(height: 12),
                      TextField(
                        controller: controller.passwordController,
                        decoration: const InputDecoration(labelText: 'Password'),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: controller.quotaController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(labelText: 'quota'.tr),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: TextField(
                              controller: controller.speedController,
                              keyboardType: TextInputType.number,
                              decoration:
                                  InputDecoration(labelText: 'speed_limit'.tr),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      TextField(
                        controller: controller.scheduleController,
                        decoration: const InputDecoration(labelText: 'Schedule'),
                      ),
                      const SizedBox(height: 16),
                      FilledButton(
                        onPressed: controller.save,
                        child: Text('save_api_settings'.tr),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
