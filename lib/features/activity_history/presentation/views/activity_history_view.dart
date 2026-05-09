import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/widgets/smartnet_ui.dart';
import '../controllers/activity_history_controller.dart';

class ActivityHistoryView extends GetView<ActivityHistoryController> {
  const ActivityHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('activity_history'.tr)),
      body: GetBuilder<ActivityHistoryController>(
        builder: (_) {
          if (controller.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          const categories = ['all', 'usage', 'security', 'system', 'admin'];

          return SmartNetPage(
            child: ListView(
              children: [
                SmartNetHeroCard(
                  title: 'activity_history'.tr,
                  subtitle:
                      'Track usage changes, system updates, and security events across the network.',
                ),
                const SizedBox(height: 16),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: categories.map((category) {
                    final selected = controller.selectedCategory == category;
                    return ChoiceChip(
                      label: Text(category == 'all' ? 'All' : category),
                      selected: selected,
                      onSelected: (_) => controller.changeCategory(category),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 16),
                ...controller.visibleEvents.map(
                  (event) => Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: SmartNetPanel(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  event.title,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(fontWeight: FontWeight.w700),
                                ),
                              ),
                              Chip(label: Text(event.timestampLabel)),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(event.description),
                          const SizedBox(height: 12),
                          Text('${event.deviceName} • ${event.category}'),
                        ],
                      ),
                    ),
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
