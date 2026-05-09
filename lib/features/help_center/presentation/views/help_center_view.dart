import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/widgets/smartnet_ui.dart';
import '../controllers/help_center_controller.dart';

class HelpCenterView extends GetView<HelpCenterController> {
  const HelpCenterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('help_center'.tr)),
      body: GetBuilder<HelpCenterController>(
        builder: (_) {
          if (controller.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return SmartNetPage(
            child: ListView(
              children: [
                SmartNetHeroCard(
                  title: 'help_center'.tr,
                  subtitle: 'Troubleshooting, operational guidance, and support tips for every major network task.',
                ),
                const SizedBox(height: 16),
                ...controller.articles.map(
                  (article) => Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: SmartNetSettingTile(
                      icon: Icons.support_agent_rounded,
                      title: article.title,
                      subtitle: '${article.category} • ${article.summary}',
                      trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
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
