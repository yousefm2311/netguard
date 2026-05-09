// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'guest_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GuestConfigImpl _$$GuestConfigImplFromJson(Map<String, dynamic> json) =>
    _$GuestConfigImpl(
      ssid: json['ssid'] as String,
      password: json['password'] as String,
      isEnabled: json['isEnabled'] as bool,
      duration: (json['duration'] as num).toInt(),
      speedLimit: (json['speedLimit'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$GuestConfigImplToJson(_$GuestConfigImpl instance) =>
    <String, dynamic>{
      'ssid': instance.ssid,
      'password': instance.password,
      'isEnabled': instance.isEnabled,
      'duration': instance.duration,
      'speedLimit': instance.speedLimit,
    };

_$GuestDeviceImpl _$$GuestDeviceImplFromJson(Map<String, dynamic> json) =>
    _$GuestDeviceImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      connectedAt: DateTime.parse(json['connectedAt'] as String),
      usage: (json['usage'] as num).toDouble(),
    );

Map<String, dynamic> _$$GuestDeviceImplToJson(_$GuestDeviceImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'connectedAt': instance.connectedAt.toIso8601String(),
      'usage': instance.usage,
    };
