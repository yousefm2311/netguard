import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'analytics_controller.dart';
import '../../data/models/event_log.dart';

class AnalyticsScreen extends GetView<AnalyticsController> {
  const AnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AnalyticsController(Get.find()));

    return Scaffold(
      appBar: _buildAppBar(context),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        final stats = controller.stats.value;
        if (stats == null) {
          return const Center(child: Text('No Data'));
        }

        return RefreshIndicator(
          onRefresh: controller.fetchAnalytics,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildHeader(context),
                  const SizedBox(height: 24),
                  _buildSummaryCards(context, stats),
                  const SizedBox(height: 32),
                  ...stats.activityHistory.map((log) => _buildTimelineCard(context, log)),
                  const SizedBox(height: 30),
                  _buildViewOlderButton(context),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          Icon(Icons.router_outlined, color: Theme.of(context).colorScheme.primary),
          const SizedBox(width: 8),
          const Text('SmartNet Control'),
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.sensors), 
          onPressed: () {
            Get.snackbar('Network Scan', 'Scanning for new devices...', 
              snackPosition: SnackPosition.BOTTOM, 
              backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.1));
          }
        ),
        Container(
          margin: const EdgeInsets.only(right: 16),
          child: CircleAvatar(
            radius: 16,
            backgroundColor: Theme.of(context).colorScheme.primary,
            child: const Text('JD', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
          ),
        ),
      ],
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Activity History', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Text('Monitoring all network events and security blocks in real-time.', style: TextStyle(fontSize: 14, color: Colors.grey[600], height: 1.5)),
      ],
    );
  }

  Widget _buildSummaryCards(BuildContext context, stats) {
    return Row(
      children: [
        Expanded(
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.security, color: Colors.blue, size: 24),
                  const SizedBox(height: 16),
                  const Text('SECURED', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 1.2)),
                  const SizedBox(height: 4),
                  Text('${stats.blocksToday} Blocks', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  const Text('Today', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.speed, color: Colors.deepPurple, size: 24),
                  const SizedBox(height: 16),
                  const Text('HEALTH', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 1.2)),
                  const SizedBox(height: 4),
                  Text(stats.networkHealth, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  const Text('', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)), // placeholder to match height
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTimelineCard(BuildContext context, EventLog log) {
    if (log.id == '103') { // Inject the banner before the 3rd item for demo purposes
      return Column(
        children: [
          _buildInsightBanner(context),
          const SizedBox(height: 16),
          _buildStandardEventCard(context, log),
        ],
      );
    }
    return _buildStandardEventCard(context, log);
  }

  Widget _buildStandardEventCard(BuildContext context, EventLog log) {
    Color typeColor;
    IconData icon;
    Color iconBgColor;

    switch (log.type) {
      case 'security':
        typeColor = Colors.red;
        icon = Icons.block;
        iconBgColor = Colors.red.withOpacity(0.1);
        break;
      case 'system':
        typeColor = Colors.blue;
        icon = Icons.system_update_alt;
        iconBgColor = Colors.blue.withOpacity(0.1);
        break;
      case 'traffic':
        typeColor = Colors.orange;
        icon = Icons.warning_amber_rounded;
        iconBgColor = Colors.orange.withOpacity(0.1);
        break;
      case 'devices':
      default:
        typeColor = Colors.deepPurple;
        icon = Icons.smartphone;
        iconBgColor = Colors.deepPurple.withOpacity(0.1);
        break;
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey[200]!),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: 4,
              decoration: BoxDecoration(
                color: typeColor,
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(16), bottomLeft: Radius.circular(16)),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: iconBgColor,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(icon, color: typeColor, size: 20),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: RichText(
                                  text: TextSpan(
                                    style: const TextStyle(color: Colors.black87, fontSize: 16),
                                    children: [
                                      TextSpan(text: '${log.title} ', style: const TextStyle(fontWeight: FontWeight.bold)),
                                      if (log.subtitle.isNotEmpty)
                                        TextSpan(text: log.subtitle, style: const TextStyle(fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(log.timeAgo, style: TextStyle(fontSize: 12, color: Colors.grey[500], fontWeight: FontWeight.w500)),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(log.description, style: TextStyle(fontSize: 14, color: Colors.grey[600], height: 1.4)),
                          const SizedBox(height: 12),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: typeColor.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(log.tag, style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: typeColor)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInsightBanner(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B), // Dark slate
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: NetworkImage('https://images.unsplash.com/photo-1558494949-ef010cbdcc31?auto=format&fit=crop&q=80&w=800'), // Placeholder server rack image
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.darken),
        ),
      ),
      padding: const EdgeInsets.all(24),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('WEEKLY INSIGHT', style: TextStyle(color: Colors.white70, fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 1.2)),
          SizedBox(height: 8),
          Text('99.9% Uptime Achieved', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 24), // Space to show the background image
        ],
      ),
    );
  }

  Widget _buildViewOlderButton(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: () {
        Get.snackbar('Loading', 'Fetching older activity logs...', snackPosition: SnackPosition.BOTTOM);
      },
      icon: const Icon(Icons.history),
      label: const Text('View Older Activity'),
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 16),
        foregroundColor: Theme.of(context).colorScheme.primary,
        side: BorderSide(color: Theme.of(context).colorScheme.primary),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      ),
    );
  }
}
