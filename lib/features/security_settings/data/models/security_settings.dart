import 'package:freezed_annotation/freezed_annotation.dart';

part 'security_settings.freezed.dart';
part 'security_settings.g.dart';

@freezed
class SecuritySettings with _$SecuritySettings {
  const factory SecuritySettings({
    required bool threatProtection,
    required bool firewall,
    required bool portScanDetection,
    required int securityScore,
  }) = _SecuritySettings;

  factory SecuritySettings.fromJson(Map<String, dynamic> json) => _$SecuritySettingsFromJson(json);
}

@freezed
class Threat with _$Threat {
  const factory Threat({
    required String id,
    required String type,
    required String severity, // 'low', 'medium', 'high', 'critical'
    required String description,
    required DateTime timestamp,
    required String sourceIp,
  }) = _Threat;

  factory Threat.fromJson(Map<String, dynamic> json) => _$ThreatFromJson(json);
}
