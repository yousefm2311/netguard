import 'package:get/get.dart';
import '../../data/models/log_entry.dart';
import '../../../../core/network/mock_data_source.dart';

class AnalyticsController extends GetxController {
  final RxList<LogEntry> logs = <LogEntry>[].obs;
  final RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchLogs();
  }

  Future<void> fetchLogs() async {
    isLoading.value = true;
    try {
      await Future.delayed(const Duration(milliseconds: 600));
      logs.assignAll(MockDataSource.activityLogs);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> refreshData() async {
    await fetchLogs();
  }
}
