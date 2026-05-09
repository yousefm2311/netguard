import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';

import '../controllers/dashboard_controller.dart';
import '../../../../core/widgets/smartnet_ui.dart';
import '../../../../core/utils/app_utils.dart';

class DashboardScreen extends GetView<DashboardController> {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(DashboardController()); // Ensure it's initialized for the tab

    return SmartNetPage(
      child: RefreshIndicator(
        onRefresh: controller.refreshData,
        child: ListView(
          children: [
            const _HeaderSection(),
            const SizedBox(height: 24),
            Obx(() {
              if (controller.isLoading.value) {
                return const Center(
                  child: Padding(
                    padding: EdgeInsets.all(32.0),
                    child: CircularProgressIndicator(),
                  ),
                );
              }
              final stats = controller.stats.value;
              if (stats == null) return const SizedBox();

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _MetricsGrid(stats: stats),
                  const SizedBox(height: 24),
                  const SmartNetSectionTitle(
                    title: 'Network Traffic',
                    subtitle: 'Data consumption over the last 7 days',
                  ),
                  const SizedBox(height: 16),
                  _UsageChart(chartData: stats.usageChart),
                  const SizedBox(height: 24),
                  const SmartNetSectionTitle(
                    title: 'Top Consumer',
                    subtitle: 'Device utilizing the most bandwidth today',
                  ),
                  const SizedBox(height: 16),
                  SmartNetSettingTile(
                    icon: Icons.smartphone_rounded,
                    title: stats.topDevice.name,
                    subtitle: 'Used ${FormatUtils.formatBytes(stats.topDevice.usageToday, 2)}',
                    trailing: FilledButton.tonal(
                      onPressed: () {
                        // Quick action: Limit speed
                        Get.snackbar('Action', 'Speed limit dialogue will open');
                      },
                      child: const Text('Limit'),
                    ),
                  ),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}

class _HeaderSection extends StatelessWidget {
  const _HeaderSection();

  @override
  Widget build(BuildContext context) {
    return SmartNetHeroCard(
      title: 'Active Network',
      subtitle: 'Your router is online and protecting all connected devices.',
      trailing: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.2),
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.check_circle_rounded, color: Colors.greenAccent, size: 16),
            SizedBox(width: 6),
            Text('Secure', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}

class _MetricsGrid extends StatelessWidget {
  final dynamic stats;

  const _MetricsGrid({required this.stats});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SmartNetMetricCard(
            title: 'Devices',
            value: '${stats.connectedCount}',
            subtitle: 'Online now',
            icon: Icons.devices_rounded,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: SmartNetMetricCard(
            title: 'Today\'s Data',
            value: FormatUtils.formatBytes(stats.totalUsageToday, 1),
            subtitle: 'Total consumed',
            icon: Icons.data_usage_rounded,
          ),
        ),
      ],
    );
  }
}

class _UsageChart extends StatelessWidget {
  final List<dynamic> chartData;

  const _UsageChart({required this.chartData});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    // Process data for FlChart
    List<FlSpot> spots = [];
    double maxY = 0;
    
    for (int i = 0; i < chartData.length; i++) {
      // Convert bytes to GB for charting
      double gb = chartData[i].usage / (1024 * 1024 * 1024);
      if (gb > maxY) maxY = gb;
      spots.add(FlSpot(i.toDouble(), gb));
    }

    // Add some padding to maxY
    maxY = maxY * 1.2;

    return SmartNetPanel(
      padding: const EdgeInsets.all(16),
      child: SizedBox(
        height: 220,
        child: LineChart(
          LineChartData(
            gridData: FlGridData(
              show: true,
              drawVerticalLine: false,
              horizontalInterval: maxY > 0 ? maxY / 4 : 1,
              getDrawingHorizontalLine: (value) {
                return FlLine(
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.1),
                  strokeWidth: 1,
                  dashArray: [5, 5],
                );
              },
            ),
            titlesData: FlTitlesData(
              show: true,
              rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
              topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 30,
                  interval: 1,
                  getTitlesWidget: (value, meta) {
                    if (value < 0 || value >= chartData.length) return const SizedBox.shrink();
                    final date = chartData[value.toInt()].date as DateTime;
                    return SideTitleWidget(
                      axisSide: meta.axisSide,
                      child: Text(
                        DateFormat('E').format(date),
                        style: TextStyle(
                          color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
                          fontSize: 12,
                        ),
                      ),
                    );
                  },
                ),
              ),
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  interval: maxY > 0 ? maxY / 4 : 1,
                  reservedSize: 42,
                  getTitlesWidget: (value, meta) {
                    if (value == maxY) return const SizedBox.shrink();
                    return Text(
                      '${value.toStringAsFixed(0)}G',
                      style: TextStyle(
                        color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
                        fontSize: 12,
                      ),
                    );
                  },
                ),
              ),
            ),
            borderData: FlBorderData(show: false),
            minX: 0,
            maxX: (chartData.length - 1).toDouble(),
            minY: 0,
            maxY: maxY,
            lineBarsData: [
              LineChartBarData(
                spots: spots,
                isCurved: true,
                color: theme.colorScheme.primary,
                barWidth: 3,
                isStrokeCapRound: true,
                dotData: const FlDotData(show: false),
                belowBarData: BarAreaData(
                  show: true,
                  gradient: LinearGradient(
                    colors: [
                      theme.colorScheme.primary.withValues(alpha: 0.3),
                      theme.colorScheme.primary.withValues(alpha: 0.0),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
