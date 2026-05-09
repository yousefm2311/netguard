import 'package:freezed_annotation/freezed_annotation.dart';

part 'log_entry.freezed.dart';
part 'log_entry.g.dart';

@freezed
class LogEntry with _$LogEntry {
  const factory LogEntry({
    required String id,
    required String deviceId,
    required String deviceName,
    required String action,
    required String description,
    required DateTime timestamp,
    required String type, // 'connect', 'block', 'limit', 'quota'
  }) = _LogEntry;

  factory LogEntry.fromJson(Map<String, dynamic> json) => _$LogEntryFromJson(json);
}
