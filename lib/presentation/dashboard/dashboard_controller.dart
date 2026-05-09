import 'package:get/get.dart';
import '../../domain/use_cases/stats_use_cases.dart';
import '../../data/models/stats.dart';

class DashboardController extends GetxController {
  final GetStatsUseCase _getStatsUseCase;

  var isLoading = true.obs;
  var stats = Rxn<Stats>();

  DashboardController(this._getStatsUseCase);

  @override
  void onInit() {
    super.onInit();
    fetchStats();
  }

  Future<void> fetchStats() async {
    isLoading.value = true;
    try {
      stats.value = await _getStatsUseCase.execute();
    } catch (e) {
      Get.snackbar('Error', 'Failed to load dashboard stats');
    } finally {
      isLoading.value = false;
    }
  }
}
