import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controllers/analytics_controller.dart';
import '../../../../core/widgets/smartnet_ui.dart';

class AnalyticsScreen extends GetView<AnalyticsController> {
  const AnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AnalyticsController());

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
                    title: 'Network Analytics',
                    subtitle: 'Monitor recent connection events, alerts, and system activities.',
                    trailing: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.2),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.analytics_rounded, color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 24),
                  const SmartNetSectionTitle(
                    title: 'Recent Activity',
                    subtitle: 'Latest events detected on your network',
                  ),
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

              if (controller.logs.isEmpty) {
                return SliverFillRemaining(
                  child: Center(
                    child: Text('No recent activity', style: Theme.of(context).textTheme.titleLarge),
                  ),
                );
              }

              return SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final log = controller.logs[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: _LogTile(log: log),
                    );
                  },
                  childCount: controller.logs.length,
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}

class _LogTile extends StatelessWidget {
  final dynamic log;

  const _LogTile({required this.log});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    IconData icon;
    Color color;

    switch (log.type) {
      case 'block':
        icon = Icons.block_rounded;
        color = theme.colorScheme.error;
        break;
      case 'limit':
        icon = Icons.speed_rounded;
        color = Colors.orange;
        break;
      case 'quota':
        icon = Icons.warning_rounded;
        color = Colors.amber;
        break;
      default:
        icon = Icons.login_rounded;
        color = Colors.green;
    }

    return SmartNetPanel(
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: color.withValues(alpha: 0.15),
            child: Icon(icon, color: color, size: 20),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      log.action,
                      style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      DateFormat('HH:mm').format(log.timestamp),
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  '${log.deviceName} • ${log.description}',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
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
