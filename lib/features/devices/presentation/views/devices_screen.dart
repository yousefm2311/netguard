import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/utils/app_utils.dart';
import '../../../../core/widgets/smartnet_ui.dart';
import '../../data/models/device_model.dart';
import '../controllers/devices_controller.dart';

class DevicesScreen extends GetView<DevicesController> {
  const DevicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(DevicesController());

    return SmartNetPage(
      child: RefreshIndicator(
        onRefresh: controller.refreshData,
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SmartNetHeroCard(
                    title: 'Device Management',
                    subtitle:
                        'Monitor, limit, or block devices connected to your network.',
                    trailing: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.2),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.devices_other_rounded,
                          color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 24),
                  _buildFilterChips(context),
                  const SizedBox(height: 16),
                ],
              ),
            ),
            Obx(() {
              if (controller.isLoading.value) {
                return const SliverFillRemaining(
                  child: Center(child: CircularProgressIndicator()),
                );
              }

              if (controller.filteredDevices.isEmpty) {
                return SliverFillRemaining(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.device_hub,
                            size: 64, color: Colors.grey[400]),
                        const SizedBox(height: 16),
                        Text('No devices found',
                            style: Theme.of(context).textTheme.titleLarge),
                      ],
                    ),
                  ),
                );
              }

              return SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final device = controller.filteredDevices[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child:
                          _DeviceCard(device: device, controller: controller),
                    );
                  },
                  childCount: controller.filteredDevices.length,
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterChips(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Obx(
        () => Row(
          children: controller.filterOptions.map((filter) {
            final isSelected = controller.currentFilter.value == filter;
            return Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: FilterChip(
                label: Text(filter.tr),
                selected: isSelected,
                onSelected: (selected) {
                  if (selected) controller.applyFilter(filter);
                },
                backgroundColor: Theme.of(context).colorScheme.surface,
                selectedColor: Theme.of(context).colorScheme.primaryContainer,
                checkmarkColor: Theme.of(context).colorScheme.primary,
                labelStyle: TextStyle(
                  color: isSelected
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.onSurface,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: BorderSide(
                    color: isSelected
                        ? Theme.of(context).colorScheme.primary
                        : Colors.grey.withValues(alpha: 0.3),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class _DeviceCard extends StatelessWidget {
  final DeviceModel device;
  final DevicesController controller;

  const _DeviceCard({required this.device, required this.controller});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isOnline = device.status == 'online';
    final isBlocked = device.status == 'blocked';
    final isLimited = device.status == 'limited';

    IconData statusIcon;
    Color statusColor;

    if (isBlocked) {
      statusIcon = Icons.block_rounded;
      statusColor = theme.colorScheme.error;
    } else if (isLimited) {
      statusIcon = Icons.speed_rounded;
      statusColor = Colors.orange;
    } else {
      statusIcon = Icons.wifi_rounded;
      statusColor = Colors.green;
    }

    return SmartNetPanel(
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundColor: statusColor.withValues(alpha: 0.1),
                  child: Icon(
                    device.name.toLowerCase().contains('phone') ||
                            device.name.toLowerCase().contains('iphone')
                        ? Icons.smartphone_rounded
                        : device.name.toLowerCase().contains('tv')
                            ? Icons.tv_rounded
                            : Icons.laptop_mac_rounded,
                    color: statusColor,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        device.name,
                        style: theme.textTheme.titleMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(statusIcon, size: 12, color: statusColor),
                          const SizedBox(width: 4),
                          Text(
                            device.status.toUpperCase(),
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: statusColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            '•  ${device.ip}',
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: theme.colorScheme.onSurface
                                  .withValues(alpha: 0.6),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Switch.adaptive(
                  value: !isBlocked,
                  activeColor: theme.colorScheme.primary,
                  onChanged: (val) {
                    controller.toggleDeviceStatus(device.id, !val);
                  },
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Today\'s Usage',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color:
                            theme.colorScheme.onSurface.withValues(alpha: 0.6),
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      FormatUtils.formatBytes(device.usageToday, 2),
                      style: theme.textTheme.titleSmall
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                if (isLimited)
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.orange.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                          color: Colors.orange.withValues(alpha: 0.3)),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.speed_rounded,
                            size: 14, color: Colors.orange),
                        const SizedBox(width: 4),
                        Text(
                          '${device.speedLimit} Mbps limit',
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: Colors.orange,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  )
                else
                  TextButton.icon(
                    onPressed: () =>
                        Get.toNamed('/device-profile', arguments: device.id),
                    icon: const Icon(Icons.settings_suggest_rounded, size: 16),
                    label: const Text('Manage'),
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      minimumSize: Size.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
