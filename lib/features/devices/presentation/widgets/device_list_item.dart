import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/entities/network_device.dart';

class DeviceListItem extends StatelessWidget {
  const DeviceListItem({
    super.key,
    required this.device,
    required this.onProfileTap,
    required this.onManageTap,
  });

  final NetworkDevice device;
  final VoidCallback onProfileTap;
  final VoidCallback onManageTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final statusLabel = device.isBlocked
        ? 'blocked'.tr
        : switch (device.status) {
            'online' => 'online'.tr,
            'idle' => 'idle'.tr,
            _ => device.status,
          };

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            InkWell(
              borderRadius: BorderRadius.circular(22),
              onTap: onProfileTap,
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 26,
                    backgroundColor: device.isBlocked
                        ? theme.colorScheme.errorContainer
                        : theme.colorScheme.primaryContainer,
                    child: Icon(
                      device.isBlocked
                          ? Icons.block_rounded
                          : Icons.devices_rounded,
                      color: device.isBlocked
                          ? theme.colorScheme.error
                          : theme.colorScheme.primary,
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          device.name,
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '${device.ip} • ${device.mac}',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: theme.colorScheme.onSurface
                                .withValues(alpha: 0.66),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Chip(label: Text(statusLabel)),
                ],
              ),
            ),
            const SizedBox(height: 14),
            Row(
              children: [
                Expanded(
                  child: _miniStat(
                    context,
                    icon: Icons.data_usage_rounded,
                    label: '${device.usageGb.toStringAsFixed(1)} GB',
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _miniStat(
                    context,
                    icon: Icons.speed_rounded,
                    label: '${device.speedLimitMbps} Mbps',
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _miniStat(
                    context,
                    icon: Icons.pie_chart_rounded,
                    label: '${device.quotaGb} GB',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: onProfileTap,
                    child: Text('device_profile'.tr),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: FilledButton.tonal(
                    onPressed: onManageTap,
                    child: Text('device_actions'.tr),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _miniStat(BuildContext context,
      {required IconData icon, required String label}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: Theme.of(context)
            .colorScheme
            .surfaceContainerHighest
            .withValues(alpha: 0.35),
      ),
      child: Row(
        children: [
          Icon(icon, size: 18),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              label,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
