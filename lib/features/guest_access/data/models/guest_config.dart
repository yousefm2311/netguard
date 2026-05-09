import 'package:freezed_annotation/freezed_annotation.dart';

part 'guest_config.freezed.dart';
part 'guest_config.g.dart';

@freezed
class GuestConfig with _$GuestConfig {
  const factory GuestConfig({
    required String ssid,
    required String password,
    required bool isEnabled,
    required int duration, // in hours
    int? speedLimit, // in Mbps
  }) = _GuestConfig;

  factory GuestConfig.fromJson(Map<String, dynamic> json) => _$GuestConfigFromJson(json);
}

@freezed
class GuestDevice with _$GuestDevice {
  const factory GuestDevice({
    required String id,
    required String name,
    required DateTime connectedAt,
    required double usage, // in bytes
  }) = _GuestDevice;

  factory GuestDevice.fromJson(Map<String, dynamic> json) => _$GuestDeviceFromJson(json);
}
