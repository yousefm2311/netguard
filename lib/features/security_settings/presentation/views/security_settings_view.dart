import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/widgets/smartnet_ui.dart';
import '../controllers/security_settings_controller.dart';

class SecuritySettingsView extends GetView<SecuritySettingsController> {
  const SecuritySettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('security_settings'.tr)),
      body: GetBuilder<SecuritySettingsController>(
        builder: (_) {
          if (controller.isLoading || controller.state == null) {
            return const Center(child: CircularProgressIndicator());
          }

          final state = controller.state!;
          return SmartNetPage(
            child: ListView(
              children: [
                SmartNetHeroCard(
                  title: 'security_settings'.tr,
                  subtitle: 'Control firewall behavior, intrusion alerts, and automatic suspicious device blocking.',
                ),
                const SizedBox(height: 16),
                SmartNetPanel(
                  child: Column(
                    children: [
                      SwitchListTile.adaptive(
                        value: state.firewallEnabled,
                        title: const Text('Firewall'),
                        subtitle: const Text('Protect the network perimeter'),
                        onChanged: (value) => controller.patch(
                          state.copyWith(firewallEnabled: value),
                        ),
                      ),
                      SwitchListTile.adaptive(
                        value: state.macFilteringEnabled,
                        title: const Text('MAC Filtering'),
                        subtitle: const Text('Allow only approved devices'),
                        onChanged: (value) => controller.patch(
                          state.copyWith(macFilteringEnabled: value),
                        ),
                      ),
                      SwitchListTile.adaptive(
                        value: state.intrusionAlertsEnabled,
                        title: const Text('Intrusion Alerts'),
                        subtitle: const Text('Notify admin on suspicious events'),
                        onChanged: (value) => controller.patch(
                          state.copyWith(intrusionAlertsEnabled: value),
                        ),
                      ),
                      SwitchListTile.adaptive(
                        value: state.autoBlockSuspiciousDevices,
                        title: const Text('Auto-block Devices'),
                        subtitle: const Text('Block suspicious activity automatically'),
                        onChanged: (value) => controller.patch(
                          state.copyWith(autoBlockSuspiciousDevices: value),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          color: Theme.of(context)
                              .colorScheme
                              .surfaceContainerHighest
                              .withValues(alpha: 0.30),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('Password Rotation'),
                                  const SizedBox(height: 4),
                                  Text('${state.passwordRotationDays} days'),
                                ],
                              ),
                            ),
                            const SizedBox(width: 12),
                            FilledButton.tonal(
                              onPressed: () => controller.patch(
                                state.copyWith(
                                  passwordRotationDays:
                                      state.passwordRotationDays == 45 ? 30 : 45,
                                ),
                              ),
                              child: const Text('Rotate'),
                            ),
                          ],
                        ),
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
