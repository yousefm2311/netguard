import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/router_profile_controller.dart';

class RouterProfileView extends GetView<RouterProfileController> {
  const RouterProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RouterProfileController>(
      builder: (_) {
        final profile = controller.detectedProfile ?? controller.cachedProfile;
        final theme = Theme.of(context);
        return ListView(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 120),
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
                gradient: LinearGradient(
                  colors: [
                    theme.colorScheme.secondary.withValues(alpha: 0.95),
                    theme.colorScheme.primary.withValues(alpha: 0.95),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'router_health'.tr,
                    style: theme.textTheme.headlineSmall?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    profile?.model ?? 'no_router_detected'.tr,
                    style: theme.textTheme.titleLarge?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 18),
                  Row(
                    children: [
                      Expanded(
                        child: _glowMetric(
                          context,
                          label: 'firmware'.tr,
                          value: profile?.firmwareVersion ?? '--',
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _glowMetric(
                          context,
                          label: 'last_sync'.tr,
                          value: profile?.downloadedAt.split('T').first ?? '--',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'router_profile'.tr,
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(profile?.model ?? 'no_router_detected'.tr),
                    const SizedBox(height: 18),
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: [
                        _featureChip(
                          context,
                          'supports_quota'.tr,
                          profile?.supportsQuota == true,
                        ),
                        _featureChip(
                          context,
                          'supports_speed_limit'.tr,
                          profile?.supportsSpeedLimit == true,
                        ),
                        if (controller.cachedProfile != null)
                          _featureChip(context, 'cached_profile'.tr, true),
                      ],
                    ),
                    const SizedBox(height: 22),
                    Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: [
                        FilledButton.tonalIcon(
                          onPressed:
                              controller.isLoading ? null : controller.detectRouter,
                          icon: const Icon(Icons.router_rounded),
                          label: Text('detect_router'.tr),
                        ),
                        FilledButton.icon(
                          onPressed:
                              controller.isLoading ? null : controller.downloadProfile,
                          icon: const Icon(Icons.download_rounded),
                          label: Text('download_profile'.tr),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            if (profile != null) ...[
              const SizedBox(height: 16),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'downloaded_profile_ready'.tr,
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 12),
                      SelectableText(
                        profile.rawProfileJson,
                        style: theme.textTheme.bodySmall?.copyWith(height: 1.6),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ],
        );
      },
    );
  }

  Widget _glowMetric(BuildContext context,
      {required String label, required String value}) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        color: Colors.white.withValues(alpha: 0.14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: theme.textTheme.labelLarge?.copyWith(
              color: Colors.white.withValues(alpha: 0.82),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            value,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.titleMedium?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  Widget _featureChip(BuildContext context, String label, bool enabled) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: enabled
            ? Theme.of(context).colorScheme.primaryContainer
            : Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            enabled ? Icons.check_circle_rounded : Icons.remove_circle_outline_rounded,
            size: 18,
          ),
          const SizedBox(width: 8),
          Text(label),
        ],
      ),
    );
  }
}
