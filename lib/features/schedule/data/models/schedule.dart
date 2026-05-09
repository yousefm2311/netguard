import 'package:freezed_annotation/freezed_annotation.dart';

part 'schedule.freezed.dart';
part 'schedule.g.dart';

@freezed
class Schedule with _$Schedule {
  const factory Schedule({
    required String id,
    required String deviceId,
    required String deviceName,
    required String startTime, // "HH:mm"
    required String endTime, // "HH:mm"
    required List<int> days, // 1=Mon, 7=Sun
    required String type, // 'block', 'limit'
    int? speedValue,
    required bool isActive,
  }) = _Schedule;

  factory Schedule.fromJson(Map<String, dynamic> json) => _$ScheduleFromJson(json);
}
