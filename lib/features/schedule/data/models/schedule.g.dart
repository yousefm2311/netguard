// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ScheduleImpl _$$ScheduleImplFromJson(Map<String, dynamic> json) =>
    _$ScheduleImpl(
      id: json['id'] as String,
      deviceId: json['deviceId'] as String,
      deviceName: json['deviceName'] as String,
      startTime: json['startTime'] as String,
      endTime: json['endTime'] as String,
      days: (json['days'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      type: json['type'] as String,
      speedValue: (json['speedValue'] as num?)?.toInt(),
      isActive: json['isActive'] as bool,
    );

Map<String, dynamic> _$$ScheduleImplToJson(_$ScheduleImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'deviceId': instance.deviceId,
      'deviceName': instance.deviceName,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'days': instance.days,
      'type': instance.type,
      'speedValue': instance.speedValue,
      'isActive': instance.isActive,
    };
