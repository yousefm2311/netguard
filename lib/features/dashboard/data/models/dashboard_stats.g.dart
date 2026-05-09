// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_stats.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DashboardStatsImpl _$$DashboardStatsImplFromJson(Map<String, dynamic> json) =>
    _$DashboardStatsImpl(
      connectedCount: (json['connectedCount'] as num).toInt(),
      totalUsageToday: (json['totalUsageToday'] as num).toDouble(),
      activeAlerts: (json['activeAlerts'] as num).toInt(),
      topDevice:
          DeviceModel.fromJson(json['topDevice'] as Map<String, dynamic>),
      usageChart: (json['usageChart'] as List<dynamic>)
          .map((e) => DailyUsage.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$DashboardStatsImplToJson(
        _$DashboardStatsImpl instance) =>
    <String, dynamic>{
      'connectedCount': instance.connectedCount,
      'totalUsageToday': instance.totalUsageToday,
      'activeAlerts': instance.activeAlerts,
      'topDevice': instance.topDevice,
      'usageChart': instance.usageChart,
    };

_$DailyUsageImpl _$$DailyUsageImplFromJson(Map<String, dynamic> json) =>
    _$DailyUsageImpl(
      date: DateTime.parse(json['date'] as String),
      usage: (json['usage'] as num).toDouble(),
    );

Map<String, dynamic> _$$DailyUsageImplToJson(_$DailyUsageImpl instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'usage': instance.usage,
    };
