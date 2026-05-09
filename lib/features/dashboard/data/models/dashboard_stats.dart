import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../features/devices/data/models/device_model.dart';

part 'dashboard_stats.freezed.dart';
part 'dashboard_stats.g.dart';

@freezed
class DashboardStats with _$DashboardStats {
  const factory DashboardStats({
    required int connectedCount,
    required double totalUsageToday,
    required int activeAlerts,
    required DeviceModel topDevice,
    required List<DailyUsage> usageChart,
  }) = _DashboardStats;

  factory DashboardStats.fromJson(Map<String, dynamic> json) => _$DashboardStatsFromJson(json);
}

@freezed
class DailyUsage with _$DailyUsage {
  const factory DailyUsage({
    required DateTime date,
    required double usage,
  }) = _DailyUsage;

  factory DailyUsage.fromJson(Map<String, dynamic> json) => _$DailyUsageFromJson(json);
}
