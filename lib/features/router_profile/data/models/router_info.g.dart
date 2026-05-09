// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'router_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RouterInfoImpl _$$RouterInfoImplFromJson(Map<String, dynamic> json) =>
    _$RouterInfoImpl(
      model: json['model'] as String,
      brand: json['brand'] as String,
      firmware: json['firmware'] as String,
      ip: json['ip'] as String,
      mac: json['mac'] as String,
      lastDetected: DateTime.parse(json['lastDetected'] as String),
    );

Map<String, dynamic> _$$RouterInfoImplToJson(_$RouterInfoImpl instance) =>
    <String, dynamic>{
      'model': instance.model,
      'brand': instance.brand,
      'firmware': instance.firmware,
      'ip': instance.ip,
      'mac': instance.mac,
      'lastDetected': instance.lastDetected.toIso8601String(),
    };
