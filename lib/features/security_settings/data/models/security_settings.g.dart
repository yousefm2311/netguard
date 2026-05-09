// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'security_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SecuritySettingsImpl _$$SecuritySettingsImplFromJson(
        Map<String, dynamic> json) =>
    _$SecuritySettingsImpl(
      threatProtection: json['threatProtection'] as bool,
      firewall: json['firewall'] as bool,
      portScanDetection: json['portScanDetection'] as bool,
      securityScore: (json['securityScore'] as num).toInt(),
    );

Map<String, dynamic> _$$SecuritySettingsImplToJson(
        _$SecuritySettingsImpl instance) =>
    <String, dynamic>{
      'threatProtection': instance.threatProtection,
      'firewall': instance.firewall,
      'portScanDetection': instance.portScanDetection,
      'securityScore': instance.securityScore,
    };

_$ThreatImpl _$$ThreatImplFromJson(Map<String, dynamic> json) => _$ThreatImpl(
      id: json['id'] as String,
      type: json['type'] as String,
      severity: json['severity'] as String,
      description: json['description'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      sourceIp: json['sourceIp'] as String,
    );

Map<String, dynamic> _$$ThreatImplToJson(_$ThreatImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'severity': instance.severity,
      'description': instance.description,
      'timestamp': instance.timestamp.toIso8601String(),
      'sourceIp': instance.sourceIp,
    };
