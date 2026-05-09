// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_log_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NetworkLogEntryImpl _$$NetworkLogEntryImplFromJson(
        Map<String, dynamic> json) =>
    _$NetworkLogEntryImpl(
      id: json['id'] as String,
      deviceId: json['deviceId'] as String,
      domain: json['domain'] as String,
      protocol: json['protocol'] as String,
      action: json['action'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      bytes: (json['bytes'] as num).toInt(),
    );

Map<String, dynamic> _$$NetworkLogEntryImplToJson(
        _$NetworkLogEntryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'deviceId': instance.deviceId,
      'domain': instance.domain,
      'protocol': instance.protocol,
      'action': instance.action,
      'timestamp': instance.timestamp.toIso8601String(),
      'bytes': instance.bytes,
    };
