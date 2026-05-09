import '../../../../core/mock/mock_backend.dart';
import '../../domain/entities/activity_event.dart';
import '../../domain/repositories/activity_history_repository.dart';

class ActivityHistoryRepositoryImpl implements ActivityHistoryRepository {
  @override
  Future<List<ActivityEvent>> fetchEvents() async => MockBackend.activityEvents();

  @override
  Future<List<ActivityEvent>> fetchEventsForDevice(String deviceId) async {
    final events = MockBackend.activityEvents();
    return events.where((event) => event.deviceId == deviceId).toList();
  }
}
