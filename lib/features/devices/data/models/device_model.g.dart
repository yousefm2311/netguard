// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DeviceModelImpl _$$DeviceModelImplFromJson(Map<String, dynamic> json) =>
    _$DeviceModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      ip: json['ip'] as String,
      mac: json['mac'] as String,
      status: json['status'] as String,
      usageToday: (json['usageToday'] as num).toDouble(),
      usageWeekly: (json['usageWeekly'] as num).toDouble(),
      usageMonthly: (json['usageMonthly'] as num).toDouble(),
      speedLimit: (json['speedLimit'] as num?)?.toInt(),
      quota: (json['quota'] as num?)?.toInt(),
      quotaPeriod: json['quotaPeriod'] as String?,
      userId: json['userId'] as String?,
      connectedAt: DateTime.parse(json['connectedAt'] as String),
      lastSeen: DateTime.parse(json['lastSeen'] as String),
    );

Map<String, dynamic> _$$DeviceModelImplToJson(_$DeviceModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'ip': instance.ip,
      'mac': instance.mac,
      'status': instance.status,
      'usageToday': instance.usageToday,
      'usageWeekly': instance.usageWeekly,
      'usageMonthly': instance.usageMonthly,
      'speedLimit': instance.speedLimit,
      'quota': instance.quota,
      'quotaPeriod': instance.quotaPeriod,
      'userId': instance.userId,
      'connectedAt': instance.connectedAt.toIso8601String(),
      'lastSeen': instance.lastSeen.toIso8601String(),
    };
