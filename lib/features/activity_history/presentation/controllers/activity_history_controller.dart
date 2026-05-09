import 'package:get/get.dart';

import '../../domain/entities/activity_event.dart';
import '../../domain/repositories/activity_history_repository.dart';

class ActivityHistoryController extends GetxController {
  ActivityHistoryController({
    required this.repository,
  });

  final ActivityHistoryRepository repository;

  bool isLoading = false;
  String selectedCategory = 'all';
  List<ActivityEvent> allEvents = [];

  List<ActivityEvent> get visibleEvents {
    if (selectedCategory == 'all') {
      return allEvents;
    }
    return allEvents
        .where((event) => event.category.toLowerCase() == selectedCategory)
        .toList();
  }

  @override
  void onInit() {
    super.onInit();
    fetchEvents();
  }

  Future<void> fetchEvents() async {
    isLoading = true;
    update();
    allEvents = await repository.fetchEvents();
    isLoading = false;
    update();
  }

  void changeCategory(String category) {
    selectedCategory = category;
    update();
  }
}
