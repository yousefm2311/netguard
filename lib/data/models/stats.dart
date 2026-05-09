import 'event_log.dart';

class Stats {
  final int connectedCount;
  final double totalUsage;
  final double downloadSpeed;
  final String topDeviceName;
  final double topDeviceUsage;
  final String topDeviceSubtitle;
  final List<EventLog> recentActivity;
  final List<EventLog> activityHistory;
  final int blocksToday;
  final String networkHealth;

  Stats({
    required this.connectedCount,
    required this.totalUsage,
    required this.downloadSpeed,
    required this.topDeviceName,
    required this.topDeviceUsage,
    required this.topDeviceSubtitle,
    required this.recentActivity,
    required this.activityHistory,
    required this.blocksToday,
    required this.networkHealth,
  });

  factory Stats.fromJson(Map<String, dynamic> json) {
    return Stats(
      connectedCount: json['connectedCount'] ?? 0,
      totalUsage: (json['totalUsage'] ?? 0).toDouble(),
      downloadSpeed: (json['downloadSpeed'] ?? 0).toDouble(),
      topDeviceName: json['topDeviceName'] ?? '',
      topDeviceUsage: (json['topDeviceUsage'] ?? 0).toDouble(),
      topDeviceSubtitle: json['topDeviceSubtitle'] ?? '',
      recentActivity: (json['recentActivity'] as List?)?.map((e) => EventLog.fromJson(e)).toList() ?? [],
      activityHistory: (json['activityHistory'] as List?)?.map((e) => EventLog.fromJson(e)).toList() ?? [],
      blocksToday: json['blocksToday'] ?? 0,
      networkHealth: json['networkHealth'] ?? 'Stable',
    );
  }
}
