import 'package:get/get.dart';
import '../../domain/use_cases/stats_use_cases.dart';
import '../../data/models/stats.dart';

class AnalyticsController extends GetxController {
  final GetStatsUseCase _getStatsUseCase;

  var isLoading = true.obs;
  var stats = Rxn<Stats>();

  AnalyticsController(this._getStatsUseCase);

  @override
  void onInit() {
    super.onInit();
    fetchAnalytics();
  }

  Future<void> fetchAnalytics() async {
    isLoading.value = true;
    try {
      stats.value = await _getStatsUseCase.execute();
    } catch (e) {
      Get.snackbar('Error', 'Failed to load analytics');
    } finally {
      isLoading.value = false;
    }
  }
}
