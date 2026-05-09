import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app/routes/app_routes.dart';
import '../../../../core/widgets/smartnet_ui.dart';
import '../../../analytics/domain/entities/network_stats.dart';
import '../../../analytics/presentation/controllers/analytics_controller.dart';
import '../../../analytics/presentation/views/analytics_view.dart';
import '../../../auth/presentation/controllers/auth_controller.dart';
import '../../../devices/presentation/controllers/devices_controller.dart';
import '../../../devices/presentation/views/devices_view.dart';
import '../../../router_profile/presentation/views/router_profile_view.dart';
import '../../../settings/presentation/views/settings_view.dart';
import '../controllers/shell_controller.dart';

class ShellView extends GetView<ShellController> {
  const ShellView({super.key});

  @override
  Widget build(BuildContext context) {
    final pages = [
      const _DashboardTab(),
      const DevicesView(),
      const AnalyticsView(),
      const RouterProfileView(),
      const SettingsView(),
    ];

    return GetBuilder<ShellController>(
      builder: (_) {
        return LayoutBuilder(
          builder: (context, constraints) {
            final useRail = constraints.maxWidth >= 1024;
            final body = pages[controller.currentIndex];
            return Scaffold(
              appBar: AppBar(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(_titleForIndex(controller.currentIndex)),
                    Text(
                      Get.find<AuthController>().session?.userName ?? 'Admin',
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ],
                ),
                actions: [
                  PopupMenuButton<String>(
                    onSelected: (value) {
                      switch (value) {
                        case 'activity':
                          Get.toNamed(AppRoutes.activityHistory);
                          break;
                        case 'guest':
                          Get.toNamed(AppRoutes.guestAccess);
                          break;
                        case 'security':
                          Get.toNamed(AppRoutes.securitySettings);
                          break;
                        case 'help':
                          Get.toNamed(AppRoutes.helpCenter);
                          break;
                      }
                    },
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        value: 'activity',
                        child: Text('activity_history'.tr),
                      ),
                      PopupMenuItem(
                        value: 'guest',
                        child: Text('guest_access'.tr),
                      ),
                      PopupMenuItem(
                        value: 'security',
                        child: Text('security_settings'.tr),
                      ),
                      PopupMenuItem(
                        value: 'help',
                        child: Text('help_center'.tr),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: Get.find<AuthController>().logout,
                    icon: const Icon(Icons.logout_rounded),
                    tooltip: 'logout'.tr,
                  ),
                  const SizedBox(width: 8),
                ],
              ),
              body: Row(
                children: [
                  if (useRail)
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 8, 0, 16),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(28),
                        child: NavigationRail(
                          selectedIndex: controller.currentIndex,
                          onDestinationSelected: controller.setIndex,
                          labelType: NavigationRailLabelType.all,
                          backgroundColor: Theme.of(context).cardColor,
                          destinations: _destinations
                              .map(
                                (item) => NavigationRailDestination(
                                  icon: Icon(item.icon),
                                  selectedIcon: Icon(item.selectedIcon),
                                  label: Text(item.label),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    ),
                  Expanded(child: body),
                ],
              ),
              bottomNavigationBar: useRail
                  ? null
                  : NavigationBar(
                      selectedIndex: controller.currentIndex,
                      onDestinationSelected: controller.setIndex,
                      destinations: _destinations
                          .map(
                            (item) => NavigationDestination(
                              icon: Icon(item.icon),
                              selectedIcon: Icon(item.selectedIcon),
                              label: item.label,
                            ),
                          )
                          .toList(),
                    ),
            );
          },
        );
      },
    );
  }

  String _titleForIndex(int index) {
    switch (index) {
      case 0:
        return 'dashboard'.tr;
      case 1:
        return 'devices'.tr;
      case 2:
        return 'analytics'.tr;
      case 3:
        return 'router'.tr;
      default:
        return 'settings'.tr;
    }
  }
}

const _destinations = <_ShellDestination>[
  _ShellDestination(
    icon: Icons.dashboard_outlined,
    selectedIcon: Icons.dashboard_rounded,
    label: 'Dashboard',
  ),
  _ShellDestination(
    icon: Icons.devices_outlined,
    selectedIcon: Icons.devices_rounded,
    label: 'Devices',
  ),
  _ShellDestination(
    icon: Icons.bar_chart_outlined,
    selectedIcon: Icons.bar_chart_rounded,
    label: 'Analytics',
  ),
  _ShellDestination(
    icon: Icons.router_outlined,
    selectedIcon: Icons.router_rounded,
    label: 'Router',
  ),
  _ShellDestination(
    icon: Icons.settings_outlined,
    selectedIcon: Icons.settings_rounded,
    label: 'Settings',
  ),
];

class _ShellDestination {
  const _ShellDestination({
    required this.icon,
    required this.selectedIcon,
    required this.label,
  });

  final IconData icon;
  final IconData selectedIcon;
  final String label;
}

class _DashboardTab extends StatelessWidget {
  const _DashboardTab();

  @override
  Widget build(BuildContext context) {
    final analyticsController = Get.find<AnalyticsController>();
    final devicesController = Get.find<DevicesController>();

    return GetBuilder<AnalyticsController>(
      builder: (_) {
        final stats = analyticsController.stats;
        if (analyticsController.isLoading || stats == null) {
          return const Center(child: CircularProgressIndicator());
        }

        return SmartNetPage(
          child: RefreshIndicator(
            onRefresh: () async {
              await analyticsController.fetchStats();
              await devicesController.fetchDevices();
            },
            child: ListView(
              children: [
                SmartNetHeroCard(
                  title: 'network_overview'.tr,
                  subtitle: 'manage_connected_devices'.tr,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: _heroMetric(
                            context,
                            label: 'live_status'.tr,
                            value: stats.isMocked ? 'Mock API' : 'Connected',
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _heroMetric(
                            context,
                            label: 'top_device'.tr,
                            value: stats.topDevice.name,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 18),
                LayoutBuilder(
                  builder: (context, constraints) {
                    final columns = constraints.maxWidth > 1040
                        ? 4
                        : constraints.maxWidth > 640
                            ? 2
                            : 1;
                    return GridView.count(
                      crossAxisCount: columns,
                      childAspectRatio: 1.45,
                      mainAxisSpacing: 14,
                      crossAxisSpacing: 14,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: [
                        SmartNetMetricCard(
                          title: 'connected_devices'.tr,
                          value: '${stats.connectedDevicesCount}',
                          subtitle: 'active_now'.tr,
                          icon: Icons.wifi_tethering_rounded,
                        ),
                        SmartNetMetricCard(
                          title: 'total_usage'.tr,
                          value: '${stats.totalUsageGb.toStringAsFixed(1)} GB',
                          subtitle: 'usage_this_week'.tr,
                          icon: Icons.data_usage_rounded,
                        ),
                        SmartNetMetricCard(
                          title: 'top_device'.tr,
                          value: stats.topDevice.name,
                          subtitle: '${stats.topDevice.usageGb.toStringAsFixed(1)} GB',
                          icon: Icons.bolt_rounded,
                        ),
                        SmartNetMetricCard(
                          title: 'router_health'.tr,
                          value: stats.isMocked ? 'Fallback' : 'Healthy',
                          subtitle: stats.isMocked
                              ? 'mock_mode'.tr
                              : 'trusted_network'.tr,
                          icon: Icons.router_rounded,
                        ),
                      ],
                    );
                  },
                ),
                const SizedBox(height: 18),
                Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  children: [
                    _alertsCard(context, stats),
                    _quickActionsCard(context),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _heroMetric(BuildContext context,
      {required String label, required String value}) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        color: Colors.white.withValues(alpha: 0.12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: theme.textTheme.labelLarge?.copyWith(
              color: Colors.white.withValues(alpha: 0.80),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            value,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.titleLarge?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  Widget _alertsCard(BuildContext context, NetworkStats stats) {
    return SizedBox(
      width: 520,
      child: SmartNetPanel(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SmartNetSectionTitle(
              title: 'alerts'.tr,
              subtitle: 'Immediate highlights from the network activity feed.',
            ),
            const SizedBox(height: 12),
            ...stats.alerts.map(
              (alert) => Container(
                margin: const EdgeInsets.only(bottom: 10),
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: Theme.of(context)
                      .colorScheme
                      .surfaceContainerHighest
                      .withValues(alpha: 0.35),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.notifications_active_rounded,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    const SizedBox(width: 12),
                    Expanded(child: Text(alert)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _quickActionsCard(BuildContext context) {
    final actions = [
      ('activity_history'.tr, Icons.history_rounded, AppRoutes.activityHistory),
      ('guest_access'.tr, Icons.people_alt_rounded, AppRoutes.guestAccess),
      ('security_settings'.tr, Icons.shield_rounded, AppRoutes.securitySettings),
      ('help_center'.tr, Icons.support_agent_rounded, AppRoutes.helpCenter),
    ];

    return SizedBox(
      width: 340,
      child: SmartNetPanel(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SmartNetSectionTitle(
              title: 'quick_actions'.tr,
              subtitle: 'Open the remaining admin sections directly.',
            ),
            const SizedBox(height: 14),
            ...actions.map(
              (item) => Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: SmartNetSettingTile(
                  icon: item.$2,
                  title: item.$1,
                  subtitle: item.$1,
                  trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
                  onTap: () => Get.toNamed(item.$3),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
