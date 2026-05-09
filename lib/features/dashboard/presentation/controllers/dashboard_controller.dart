import 'package:get/get.dart';
import '../../data/models/dashboard_stats.dart';
import '../../../../core/network/mock_data_source.dart';

class DashboardController extends GetxController {
  final Rx<DashboardStats?> stats = Rx<DashboardStats?>(null);
  final RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchDashboardData();
  }

  Future<void> fetchDashboardData() async {
    isLoading.value = true;
    try {
      // Simulate network delay
      await Future.delayed(const Duration(seconds: 1));
      stats.value = MockDataSource.dashboardStats;
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> refreshData() async {
    await fetchDashboardData();
  }
}
