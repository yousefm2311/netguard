import 'package:dio/dio.dart';

import '../../../../core/mock/mock_backend.dart';
import '../../../../core/network/api_client.dart';
import '../../../devices/domain/entities/network_device.dart';
import '../../domain/entities/network_stats.dart';
import '../../domain/repositories/analytics_repository.dart';

class AnalyticsRepositoryImpl implements AnalyticsRepository {
  AnalyticsRepositoryImpl({
    required this.apiClient,
  });

  final ApiClient apiClient;

  @override
  Future<NetworkStats> fetchStats() async {
    try {
      final response = await apiClient.dio.get<Map<String, dynamic>>('/stats');
      final data = response.data ?? <String, dynamic>{};
      final top = data['topDevice'] as Map<String, dynamic>? ?? <String, dynamic>{};
      return NetworkStats(
        connectedDevicesCount:
            (data['connectedDevicesCount'] as num?)?.toInt() ?? 0,
        totalUsageGb: (data['totalUsage'] as num?)?.toDouble() ?? 0,
        topDevice: NetworkDevice(
          id: top['id']?.toString() ?? '0',
          name: top['name']?.toString() ?? 'N/A',
          ip: top['ip']?.toString() ?? '-',
          mac: top['mac']?.toString() ?? '-',
          usageGb: (top['usage'] as num?)?.toDouble() ?? 0,
          isBlocked: top['isBlocked'] == true,
          speedLimitMbps: (top['speedLimit'] as num?)?.toInt() ?? 0,
          quotaGb: (top['quota'] as num?)?.toInt() ?? 0,
          status: top['status']?.toString() ?? 'online',
        ),
        dailyUsageGb: ((data['dailyUsage'] as List<dynamic>? ?? [])
            .map((e) => (e as num).toDouble())
            .toList()),
        deviceComparisonGb: ((data['deviceComparison'] as List<dynamic>? ?? [])
            .map(
              (item) => DeviceUsageSlice(
                label: item['label'].toString(),
                value: (item['value'] as num).toDouble(),
              ),
            )
            .toList()),
        alerts:
            (data['alerts'] as List<dynamic>? ?? []).map((e) => '$e').toList(),
        isMocked: false,
      );
    } on DioException {
      return MockBackend.stats();
    }
  }
}
