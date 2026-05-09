import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/widgets/smartnet_ui.dart';
import '../controllers/device_profile_controller.dart';

class DeviceProfileView extends GetView<DeviceProfileController> {
  const DeviceProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('device_profile'.tr)),
      body: GetBuilder<DeviceProfileController>(
        builder: (_) {
          final device = controller.device;
          if (controller.isLoading || device == null) {
            return const Center(child: CircularProgressIndicator());
          }

          return SmartNetPage(
            child: ListView(
              children: [
                SmartNetHeroCard(
                  title: device.name,
                  subtitle: '${device.ip} • ${device.mac}',
                  trailing: Chip(
                    label: Text(device.isBlocked ? 'blocked'.tr : 'online'.tr),
                  ),
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: SmartNetGlassChip(
                            icon: Icons.data_usage_rounded,
                            label: '${device.usageGb.toStringAsFixed(1)} GB',
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: SmartNetGlassChip(
                            icon: Icons.speed_rounded,
                            label: '${device.speedLimitMbps} Mbps',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                SmartNetPanel(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SmartNetSectionTitle(
                        title: 'device_actions'.tr,
                        subtitle: 'Current quota and recent events for this device.',
                      ),
                      const SizedBox(height: 16),
                      Text('${'quota'.tr}: ${device.quotaGb} GB'),
                      const SizedBox(height: 16),
                      ...controller.recentEvents.map(
                        (event) => Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: const Icon(Icons.history_rounded),
                            title: Text(event.title),
                            subtitle: Text(event.description),
                            trailing: Text(event.timestampLabel),
                          ),
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
