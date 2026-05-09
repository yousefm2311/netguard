import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controllers/router_profile_controller.dart';
import '../../../../core/widgets/smartnet_ui.dart';

class RouterProfileScreen extends GetView<RouterProfileController> {
  const RouterProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(RouterProfileController());
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Router Profile'),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        final router = controller.routerInfo.value;
        if (router == null) return const Center(child: Text('Error loading router data'));

        return SmartNetPage(
          child: ListView(
            children: [
              SmartNetHeroCard(
                title: router.model,
                subtitle: 'Active Gateway • ${router.brand}',
                trailing: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.2),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.router_rounded, color: Colors.white, size: 32),
                ),
                children: [
                  Row(
                    children: [
                      const SmartNetGlassChip(icon: Icons.wifi_tethering_rounded, label: 'Online'),
                      const SizedBox(width: 8),
                      Text(
                        'Last detected: ${DateFormat('hh:mm a').format(router.lastDetected)}',
                        style: TextStyle(color: Colors.white.withValues(alpha: 0.8), fontSize: 12),
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(height: 24),
              SmartNetPanel(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SmartNetSectionTitle(title: 'Network Configuration'),
                    const SizedBox(height: 16),
                    _InfoRow(label: 'IP Address', value: router.ip),
                    const Divider(),
                    _InfoRow(label: 'MAC Address', value: router.mac),
                    const Divider(),
                    _InfoRow(label: 'Firmware', value: router.firmware),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              SmartNetPanel(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SmartNetSectionTitle(title: 'Administration'),
                    const SizedBox(height: 16),
                    SmartNetSettingTile(
                      icon: Icons.restart_alt_rounded,
                      title: 'Restart Router',
                      subtitle: 'Reboot hardware to fix minor issues',
                      trailing: const Icon(Icons.power_settings_new_rounded, color: Colors.red),
                      onTap: controller.restartRouter,
                    ),
                    const SizedBox(height: 12),
                    SmartNetSettingTile(
                      icon: Icons.update_rounded,
                      title: 'Firmware Update',
                      subtitle: 'Check for latest software versions',
                      trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
                      onTap: () => Get.snackbar('Checking', 'Your router is up to date.'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const _InfoRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6))),
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
