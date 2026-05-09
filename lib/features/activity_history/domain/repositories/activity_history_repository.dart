import '../entities/activity_event.dart';

abstract class ActivityHistoryRepository {
  Future<List<ActivityEvent>> fetchEvents();

  Future<List<ActivityEvent>> fetchEventsForDevice(String deviceId);
}
