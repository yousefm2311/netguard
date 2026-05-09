import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'router_profile_controller.dart';

class RouterProfileScreen extends GetView<RouterProfileController> {
  const RouterProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(RouterProfileController());

    return Scaffold(
      appBar: AppBar(
        title: Text('router_profile'.tr),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(Icons.router, size: 100, color: Colors.grey),
            const SizedBox(height: 32),
            Text(
              'Manage your Router Profile to unlock advanced management features like speed limiting and quota setting.',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 48),
            Obx(() => ElevatedButton.icon(
              onPressed: controller.isDetecting.value ? null : controller.detectRouter,
              icon: controller.isDetecting.value 
                  ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2)) 
                  : const Icon(Icons.search),
              label: Text('detect_router'.tr),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                textStyle: const TextStyle(fontSize: 16),
              ),
            )),
            const SizedBox(height: 24),
            Obx(() {
              if (controller.routerModel.value.isNotEmpty) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Card(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          'Detected: ${controller.routerModel.value}',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onPrimaryContainer,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton.icon(
                      onPressed: controller.downloadProfile,
                      icon: const Icon(Icons.download),
                      label: Text('download_profile'.tr),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        backgroundColor: Theme.of(context).colorScheme.secondary,
                        foregroundColor: Theme.of(context).colorScheme.onSecondary,
                        textStyle: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                );
              }
              return const SizedBox.shrink();
            }),
          ],
        ),
      ),
    );
  }
}
