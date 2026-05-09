import 'package:freezed_annotation/freezed_annotation.dart';

part 'device_model.freezed.dart';
part 'device_model.g.dart';

@freezed
class DeviceModel with _$DeviceModel {
  const factory DeviceModel({
    required String id,
    required String name,
    required String ip,
    required String mac,
    required String status, // 'online', 'blocked', 'limited'
    required double usageToday,
    required double usageWeekly,
    required double usageMonthly,
    int? speedLimit, // Mbps
    int? quota, // GB
    String? quotaPeriod,
    String? userId,
    required DateTime connectedAt,
    required DateTime lastSeen,
  }) = _DeviceModel;

  factory DeviceModel.fromJson(Map<String, dynamic> json) => _$DeviceModelFromJson(json);
}
