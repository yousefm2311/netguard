import 'package:freezed_annotation/freezed_annotation.dart';

part 'network_log_entry.freezed.dart';
part 'network_log_entry.g.dart';

@freezed
class NetworkLogEntry with _$NetworkLogEntry {
  const factory NetworkLogEntry({
    required String id,
    required String deviceId,
    required String domain,
    required String protocol,
    required String action, // 'allow', 'block'
    required DateTime timestamp,
    required int bytes,
  }) = _NetworkLogEntry;

  factory NetworkLogEntry.fromJson(Map<String, dynamic> json) => _$NetworkLogEntryFromJson(json);
}
