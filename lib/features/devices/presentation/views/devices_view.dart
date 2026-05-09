import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app/routes/app_routes.dart';
import '../../domain/entities/network_device.dart';
import '../controllers/devices_controller.dart';
import '../widgets/device_list_item.dart';

class DevicesView extends GetView<DevicesController> {
  const DevicesView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DevicesController>(
      builder: (_) {
        if (controller.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        return RefreshIndicator(
          onRefresh: controller.fetchDevices,
          child: ListView(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 120),
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(22),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'devices'.tr,
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                              fontWeight: FontWeight.w800,
                            ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'manage_connected_devices'.tr,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(height: 1.5),
                      ),
                      const SizedBox(height: 18),
                      Row(
                        children: [
                          Expanded(
                            child: _summaryBox(
                              context,
                              '${controller.devices.length}',
                              'connected_devices'.tr,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: _summaryBox(
                              context,
                              '${controller.devices.where((e) => e.isBlocked).length}',
                              'blocked'.tr,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 14),
              ...controller.devices.map(
                (device) => Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: DeviceListItem(
                    device: device,
                    onProfileTap: () =>
                        Get.toNamed(AppRoutes.deviceProfile, arguments: device),
                    onManageTap: () => _showDeviceActions(context, device),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _summaryBox(BuildContext context, String value, String label) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: Theme.of(context)
            .colorScheme
            .surfaceContainerHighest
            .withValues(alpha: 0.35),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            value,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w800,
                ),
          ),
          const SizedBox(height: 4),
          Text(label),
        ],
      ),
    );
  }

  Future<void> _showDeviceActions(BuildContext context, NetworkDevice device) {
    final speedController =
        TextEditingController(text: device.speedLimitMbps.toString());
    final quotaController =
        TextEditingController(text: device.quotaGb.toString());
    return showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 28),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(device.name, style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 16),
              TextField(
                controller: speedController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'speed_limit'.tr,
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: quotaController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'quota'.tr,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: FilledButton.tonal(
                      onPressed: () async {
                        await controller.limitSpeed(
                          device,
                          int.tryParse(speedController.text) ?? device.speedLimitMbps,
                        );
                        if (context.mounted) Navigator.pop(context);
                      },
                      child: Text('speed_limit'.tr),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: FilledButton.tonal(
                      onPressed: () async {
                        await controller.setQuota(
                          device,
                          int.tryParse(quotaController.text) ?? device.quotaGb,
                        );
                        if (context.mounted) Navigator.pop(context);
                      },
                      child: Text('quota'.tr),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              FilledButton(
                style: FilledButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.error,
                ),
                onPressed: () async {
                  await controller.blockDevice(device);
                  if (context.mounted) Navigator.pop(context);
                },
                child: Text('block_device'.tr),
              ),
            ],
          ),
        );
      },
    );
  }
}
