import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/analytics_controller.dart';

class AnalyticsView extends GetView<AnalyticsController> {
  const AnalyticsView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AnalyticsController>(
      builder: (_) {
        if (controller.isLoading || controller.stats == null) {
          return const Center(child: CircularProgressIndicator());
        }

        final stats = controller.stats!;
        return RefreshIndicator(
          onRefresh: controller.fetchStats,
          child: ListView(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 120),
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Daily usage trend',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 220,
                        child: LineChart(
                          LineChartData(
                            gridData: const FlGridData(show: false),
                            titlesData: const FlTitlesData(),
                            borderData: FlBorderData(show: false),
                            lineBarsData: [
                              LineChartBarData(
                                spots: List.generate(
                                  stats.dailyUsageGb.length,
                                  (index) => FlSpot(
                                    index.toDouble(),
                                    stats.dailyUsageGb[index],
                                  ),
                                ),
                                isCurved: true,
                                barWidth: 4,
                                color: Theme.of(context).colorScheme.primary,
                                belowBarData: BarAreaData(
                                  show: true,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .primary
                                      .withValues(alpha: 0.18),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Device comparison',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 260,
                        child: BarChart(
                          BarChartData(
                            gridData: const FlGridData(show: false),
                            titlesData: const FlTitlesData(
                              leftTitles: AxisTitles(
                                sideTitles: SideTitles(showTitles: true),
                              ),
                              rightTitles: AxisTitles(
                                sideTitles: SideTitles(showTitles: false),
                              ),
                              topTitles: AxisTitles(
                                sideTitles: SideTitles(showTitles: false),
                              ),
                            ),
                            borderData: FlBorderData(show: false),
                            barGroups: List.generate(
                              stats.deviceComparisonGb.length,
                              (index) {
                                final item = stats.deviceComparisonGb[index];
                                return BarChartGroupData(
                                  x: index,
                                  barRods: [
                                    BarChartRodData(
                                      toY: item.value,
                                      width: 18,
                                      borderRadius: BorderRadius.circular(10),
                                      color:
                                          Theme.of(context).colorScheme.tertiary,
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
