import '../entities/network_stats.dart';

abstract class AnalyticsRepository {
  Future<NetworkStats> fetchStats();
}
