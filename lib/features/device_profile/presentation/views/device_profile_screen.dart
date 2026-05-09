import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/device_profile_controller.dart';
import '../../../../core/widgets/smartnet_ui.dart';
import '../../../../core/utils/app_utils.dart';

class DeviceProfileScreen extends GetView<DeviceProfileController> {
  const DeviceProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(DeviceProfileController());
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Device Details'),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        final dev = controller.device.value;
        if (dev == null) return const Center(child: Text('Device not found'));

        final isOnline = dev.status == 'online';

        return SmartNetPage(
          child: ListView(
            children: [
              SmartNetHeroCard(
                title: dev.name,
                subtitle: dev.status.toUpperCase(),
                trailing: CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white.withValues(alpha: 0.2),
                  child: Icon(
                    dev.name.toLowerCase().contains('phone') ? Icons.smartphone : Icons.laptop,
                    color: Colors.white,
                    size: 28,
                  ),
                ),
                children: [
                  Row(
                    children: [
                      SmartNetGlassChip(icon: Icons.wifi, label: dev.ip),
                      const SizedBox(width: 8),
                      SmartNetGlassChip(icon: Icons.fingerprint, label: dev.mac),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 24),
              SmartNetPanel(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SmartNetSectionTitle(title: 'Usage Statistics'),
                    const SizedBox(height: 16),
                    _StatRow(label: 'Today', value: FormatUtils.formatBytes(dev.usageToday, 2)),
                    const Divider(),
                    _StatRow(label: 'This Week', value: FormatUtils.formatBytes(dev.usageWeekly, 2)),
                    const Divider(),
                    _StatRow(label: 'This Month', value: FormatUtils.formatBytes(dev.usageMonthly, 2)),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              SmartNetPanel(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SmartNetSectionTitle(title: 'Access Controls'),
                    const SizedBox(height: 16),
                    SmartNetSettingTile(
                      icon: Icons.block_rounded,
                      title: isOnline ? 'Block Internet Access' : 'Unblock Internet Access',
                      subtitle: 'Instantly cut off connection',
                      trailing: Switch.adaptive(
                        value: !isOnline,
                        activeColor: theme.colorScheme.error,
                        onChanged: (val) => controller.blockDevice(),
                      ),
                    ),
                    const SizedBox(height: 12),
                    SmartNetSettingTile(
                      icon: Icons.speed_rounded,
                      title: 'Limit Bandwidth',
                      subtitle: 'Restrict download/upload speeds',
                      trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
                      onTap: controller.limitSpeed,
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

class _StatRow extends StatelessWidget {
  final String label;
  final String value;

  const _StatRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6))),
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        ],
      ),
    );
  }
}
