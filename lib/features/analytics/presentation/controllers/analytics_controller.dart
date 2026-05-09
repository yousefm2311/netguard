import 'package:get/get.dart';

import '../../domain/entities/network_stats.dart';
import '../../domain/repositories/analytics_repository.dart';

class AnalyticsController extends GetxController {
  AnalyticsController({
    required this.repository,
  });

  final AnalyticsRepository repository;

  bool isLoading = false;
  NetworkStats? stats;

  @override
  void onInit() {
    super.onInit();
    fetchStats();
  }

  Future<void> fetchStats() async {
    isLoading = true;
    update();
    stats = await repository.fetchStats();
    isLoading = false;
    update();
  }
}
