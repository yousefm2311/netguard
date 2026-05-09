import '../providers/api_client.dart';
import '../models/stats.dart';

class StatsRepository {
  final ApiClient _apiClient;

  StatsRepository(this._apiClient);

  Future<Stats> getStats() async {
    try {
      final response = await _apiClient.client.get('/stats');
      return Stats.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to fetch stats: $e');
    }
  }
}
