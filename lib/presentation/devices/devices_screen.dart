import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'devices_controller.dart';
import '../../data/models/device.dart';

class DevicesScreen extends GetView<DevicesController> {
  const DevicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(DevicesController(Get.find(), Get.find(), Get.find()));

    return Scaffold(
      appBar: _buildAppBar(context),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        return RefreshIndicator(
          onRefresh: controller.fetchDevices,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildHeader(context),
                  const SizedBox(height: 16),
                  _buildFilterChips(context),
                  const SizedBox(height: 24),
                  if (controller.filteredDevices.isEmpty)
                    const Center(child: Text('No devices found'))
                  else
                    ...controller.filteredDevices.map((device) => _buildDeviceCard(context, device)),
                  const SizedBox(height: 24),
                  _buildPromoBanner(context),
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
      ],
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Connected Devices', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        Text('${controller.allDevices.length} devices active on your network', style: TextStyle(fontSize: 14, color: Colors.grey[600])),
      ],
    );
  }

  Widget _buildFilterChips(BuildContext context) {
    final categories = ['All', 'Mobile', 'Laptop', 'TV', 'Console', 'Camera'];
    
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: categories.map((cat) {
          int count = 0;
          if (cat == 'All') {
            count = controller.allDevices.length;
          } else {
            count = controller.allDevices.where((d) => d.type.toLowerCase() == cat.toLowerCase()).length;
          }
          
          if (count == 0 && cat != 'All') return const SizedBox.shrink();

          final isSelected = controller.selectedCategory.value == cat;
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: FilterChip(
              label: Text('$cat ($count)'),
              selected: isSelected,
              onSelected: (_) => controller.filterDevices(cat),
              backgroundColor: Colors.grey[200],
              selectedColor: Theme.of(context).colorScheme.primary,
              labelStyle: TextStyle(color: isSelected ? Colors.white : Colors.black87, fontWeight: FontWeight.bold),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20), side: BorderSide.none),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildDeviceCard(BuildContext context, Device device) {
    IconData icon;
    if (device.type == 'mobile') icon = Icons.phone_iphone;
    else if (device.type == 'laptop') icon = Icons.laptop_mac;
    else if (device.type == 'tv') icon = Icons.tv;
    else if (device.type == 'console') icon = Icons.videogame_asset;
    else icon = Icons.videocam;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey[200]!),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: Colors.blue),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(device.name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    Text('IP: ${device.ip}', style: TextStyle(fontSize: 12, color: Colors.grey[600])),
                  ],
                ),
              ),
              CupertinoSwitch(
                value: !device.isBlocked,
                activeColor: Theme.of(context).colorScheme.primary,
                onChanged: (val) => controller.toggleBlockDevice(device),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('CURRENT SPEED', style: TextStyle(fontSize: 10, color: Colors.grey[600], fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(device.currentSpeed == 0 ? Icons.pause_circle_outline : Icons.arrow_downward, 
                             size: 14, color: device.currentSpeed == 0 ? Colors.red : Colors.blue),
                        const SizedBox(width: 4),
                        Text('${device.currentSpeed} Mbps', style: TextStyle(fontSize: 14, color: device.currentSpeed == 0 ? Colors.red : Colors.blue, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('TOTAL USAGE', style: TextStyle(fontSize: 10, color: Colors.grey[600], fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(Icons.data_usage, size: 14, color: Colors.black),
                        const SizedBox(width: 4),
                        Text('${device.totalUsage} GB', style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Speed Limit', style: TextStyle(fontSize: 12, color: Colors.grey[600])),
              Text(device.limitUnlimited ? 'Unlimited' : '${device.speedLimit} Mbps', 
                   style: TextStyle(fontSize: 12, color: Theme.of(context).colorScheme.primary, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 8),
          LinearProgressIndicator(
            value: device.limitUnlimited ? 1.0 : (device.speedLimit > 0 ? (device.currentSpeed / device.speedLimit).clamp(0.0, 1.0) : 0),
            backgroundColor: Colors.grey[200],
            color: Theme.of(context).colorScheme.primary,
            minHeight: 6,
            borderRadius: BorderRadius.circular(10),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () {
                    Get.defaultDialog(
                      title: 'Schedule for ${device.name}',
                      content: Column(
                        children: [
                          const Text('Select time range to allow internet access.'),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(onPressed: (){}, child: const Text('08:00 AM')),
                              const Text('to'),
                              ElevatedButton(onPressed: (){}, child: const Text('10:00 PM')),
                            ],
                          )
                        ],
                      ),
                      textConfirm: 'Save',
                      textCancel: 'Cancel',
                      confirmTextColor: Colors.white,
                      onConfirm: () {
                        Get.back();
                        Get.snackbar('Success', 'Schedule updated for ${device.name}', snackPosition: SnackPosition.BOTTOM);
                      }
                    );
                  },
                  icon: const Icon(Icons.calendar_today, size: 16, color: Colors.black87),
                  label: const Text('Schedule', style: TextStyle(color: Colors.black87)),
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    side: BorderSide(color: Colors.grey[300]!),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () {
                    Get.bottomSheet(
                      Container(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('Set Data Limit for ${device.name}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                            const SizedBox(height: 16),
                            const TextField(
                              decoration: InputDecoration(
                                labelText: 'Limit in GB',
                                border: OutlineInputBorder(),
                                suffixText: 'GB'
                              ),
                              keyboardType: TextInputType.number,
                            ),
                            const SizedBox(height: 24),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  Get.back();
                                  Get.snackbar('Success', 'Data limit set.', snackPosition: SnackPosition.BOTTOM);
                                },
                                child: const Text('Apply'),
                              ),
                            )
                          ],
                        ),
                      )
                    );
                  },
                  icon: const Icon(Icons.block, size: 16, color: Colors.black87),
                  label: const Text('Limit Data', style: TextStyle(color: Colors.black87)),
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    side: BorderSide(color: Colors.grey[300]!),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPromoBanner(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Theme.of(context).colorScheme.primary, const Color(0xFF8B5CF6)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.auto_awesome, color: Colors.white),
          ),
          const SizedBox(height: 16),
          const Text('Advanced Traffic Control', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Text('Get AI-driven network optimization and automatic device categorization.', 
                     style: TextStyle(color: Colors.white, fontSize: 14)),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Get.snackbar('Pro Upgrade', 'Redirecting to checkout page...', 
                  snackPosition: SnackPosition.BOTTOM, 
                  backgroundColor: Theme.of(context).colorScheme.secondary.withOpacity(0.1));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Theme.of(context).colorScheme.primary,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: const Text('Go Pro', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }
}
