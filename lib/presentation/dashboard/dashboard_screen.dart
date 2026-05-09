import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fl_chart/fl_chart.dart';
import 'dashboard_controller.dart';
import '../main/main_controller.dart' as import_main;
import '../../data/models/event_log.dart';

class DashboardScreen extends GetView<DashboardController> {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get.putIfAbsent(() => DashboardController(Get.find()));

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
          onRefresh: controller.fetchStats,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildHeader(context),
                  const SizedBox(height: 20),
                  _buildTopCards(context, stats),
                  const SizedBox(height: 24),
                  _buildTopConsumerCard(context, stats),
                  const SizedBox(height: 30),
                  _buildGlobalOperations(context),
                  const SizedBox(height: 30),
                  _buildNetworkActivity(context, stats),
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
          },
        ),
      ],
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'NETWORK STATUS',
          style: TextStyle(color: Theme.of(context).colorScheme.primary, fontWeight: FontWeight.bold, fontSize: 12, letterSpacing: 1.2),
        ),
        const SizedBox(height: 4),
        const Text(
          'Welcome back, Expert',
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildTopCards(BuildContext context, stats) {
    return Row(
      children: [
        Expanded(
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.devices, color: Theme.of(context).colorScheme.primary, size: 20),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Text('Live', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Text('Today\'s Usage', style: Theme.of(context).textTheme.bodyMedium),
                  const SizedBox(height: 4),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text('${stats.totalUsage}', style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                      const SizedBox(width: 4),
                      const Text('GB', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                    ],
                  ),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.orange.withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.speed, color: Colors.orange, size: 20),
                      ),
                      const Icon(Icons.info_outline, color: Colors.grey, size: 16),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Text('Download Speed', style: Theme.of(context).textTheme.bodyMedium),
                  const SizedBox(height: 4),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text('${stats.downloadSpeed.toInt()}', style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                      const SizedBox(width: 4),
                      const Text('Mbps', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTopConsumerCard(BuildContext context, stats) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF2A2E3B), // Dark blue-grey
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.trending_up, color: Colors.white, size: 14),
                SizedBox(width: 4),
                Text('TOP DATA CONSUMING DEVICE', style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Text(stats.topDeviceName, style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text(stats.topDeviceSubtitle, style: TextStyle(color: Colors.grey[400], fontSize: 12)),
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {
                    Get.defaultDialog(
                      title: 'Block Device',
                      middleText: 'Are you sure you want to block ${stats.topDeviceName} from accessing the network?',
                      textConfirm: 'Block',
                      textCancel: 'Cancel',
                      confirmTextColor: Colors.white,
                      onConfirm: () {
                        Get.back();
                        Get.snackbar('Success', '${stats.topDeviceName} has been blocked.', snackPosition: SnackPosition.BOTTOM);
                      },
                    );
                  },
                  icon: const Icon(Icons.block, size: 18),
                  label: const Text('Block device'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {
                    Get.bottomSheet(
                      Container(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('Set Speed Limit for ${stats.topDeviceName}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                            const SizedBox(height: 20),
                            Slider(value: 50, min: 0, max: 100, divisions: 10, label: '50 Mbps', onChanged: (v) {}),
                            const SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: () {
                                Get.back();
                                Get.snackbar('Success', 'Speed limit updated.', snackPosition: SnackPosition.BOTTOM);
                              },
                              child: const Text('Apply'),
                            )
                          ],
                        ),
                      )
                    );
                  },
                  icon: const Icon(Icons.speed, size: 18),
                  label: const Text('Limit speed'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF3F4354),
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),
          Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 200,
                  height: 200,
                  child: CircularProgressIndicator(
                    value: 0.75, // mock progress
                    strokeWidth: 12,
                    color: Theme.of(context).colorScheme.primary,
                    backgroundColor: Colors.white.withOpacity(0.05),
                  ),
                ),
                Column(
                  children: [
                    const Icon(Icons.tv, color: Colors.white, size: 32),
                    const SizedBox(height: 8),
                    Text('${stats.topDeviceUsage} GB', style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGlobalOperations(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Global Operations', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFFF1F3F5),
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              _buildOperationItem(context, Icons.remove_red_eye_outlined, 'View devices', 'See all 12 active units', Colors.blue, onTap: () {
                if (Get.isRegistered<import_main.MainController>()) {
                  Get.find<import_main.MainController>().changePage(1);
                }
              }),
              const Divider(height: 1, indent: 60, endIndent: 16),
              _buildOperationItem(context, Icons.share_outlined, 'Share Guest Access', 'Temporary QR Code', Colors.purple, onTap: () {
                Get.defaultDialog(
                  title: 'Guest Wi-Fi',
                  content: Column(
                    children: [
                      const Icon(Icons.qr_code_2, size: 150),
                      const SizedBox(height: 10),
                      const Text('Scan to connect', style: TextStyle(fontWeight: FontWeight.bold)),
                      Text('Password: guest_secure_123', style: TextStyle(color: Colors.grey[600], fontSize: 12)),
                    ],
                  ),
                  textConfirm: 'Close',
                  confirmTextColor: Colors.white,
                  onConfirm: () => Get.back(),
                );
              }),
              const Divider(height: 1, indent: 60, endIndent: 16),
              _buildOperationItem(context, Icons.shield_outlined, 'Network Security', 'Scan for threats', Colors.orange, onTap: () {
                Get.snackbar('Security Scan', 'No threats detected. Your network is secure.', snackPosition: SnackPosition.BOTTOM);
              }),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildOperationItem(BuildContext context, IconData icon, String title, String subtitle, Color color, {VoidCallback? onTap}) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: color),
      ),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(subtitle, style: const TextStyle(fontSize: 12)),
      trailing: const Icon(Icons.chevron_right, color: Colors.grey),
      onTap: onTap,
    );
  }

  Widget _buildNetworkActivity(BuildContext context, stats) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Network Activity', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            TextButton(
              onPressed: () {
                if (Get.isRegistered<import_main.MainController>()) {
                  Get.find<import_main.MainController>().changePage(2);
                }
              },
              child: const Text('View History'),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              ...stats.recentActivity.map((log) => _buildActivityItem(context, log)).toList(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildActivityItem(BuildContext context, EventLog log) {
    IconData icon;
    Color color;
    if (log.title.contains('MacBook')) {
      icon = Icons.laptop_mac; color = Colors.blue;
    } else if (log.title.contains('iPhone')) {
      icon = Icons.phone_iphone; color = Colors.purple;
    } else {
      icon = Icons.lightbulb_outline; color = Colors.orange;
    }

    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: color),
      ),
      title: Text(log.title, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text('${log.subtitle} • ${log.timeAgo}', style: const TextStyle(fontSize: 12)),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (log.tag.isNotEmpty)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: log.type == 'alert' ? Colors.orange.withOpacity(0.1) : Colors.grey[200],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(log.tag, style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: log.type == 'alert' ? Colors.orange : Colors.grey[700])),
            ),
          const SizedBox(width: 8),
          const Icon(Icons.more_vert, color: Colors.grey),
        ],
      ),
    );
  }
}
