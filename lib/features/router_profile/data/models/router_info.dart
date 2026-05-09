import 'package:freezed_annotation/freezed_annotation.dart';

part 'router_info.freezed.dart';
part 'router_info.g.dart';

@freezed
class RouterInfo with _$RouterInfo {
  const factory RouterInfo({
    required String model,
    required String brand,
    required String firmware,
    required String ip,
    required String mac,
    required DateTime lastDetected,
  }) = _RouterInfo;

  factory RouterInfo.fromJson(Map<String, dynamic> json) => _$RouterInfoFromJson(json);
}
