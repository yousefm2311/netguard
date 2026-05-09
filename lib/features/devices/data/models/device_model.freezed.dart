// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'device_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DeviceModel _$DeviceModelFromJson(Map<String, dynamic> json) {
  return _DeviceModel.fromJson(json);
}

/// @nodoc
mixin _$DeviceModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get ip => throw _privateConstructorUsedError;
  String get mac => throw _privateConstructorUsedError;
  String get status =>
      throw _privateConstructorUsedError; // 'online', 'blocked', 'limited'
  double get usageToday => throw _privateConstructorUsedError;
  double get usageWeekly => throw _privateConstructorUsedError;
  double get usageMonthly => throw _privateConstructorUsedError;
  int? get speedLimit => throw _privateConstructorUsedError; // Mbps
  int? get quota => throw _privateConstructorUsedError; // GB
  String? get quotaPeriod => throw _privateConstructorUsedError;
  String? get userId => throw _privateConstructorUsedError;
  DateTime get connectedAt => throw _privateConstructorUsedError;
  DateTime get lastSeen => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DeviceModelCopyWith<DeviceModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeviceModelCopyWith<$Res> {
  factory $DeviceModelCopyWith(
          DeviceModel value, $Res Function(DeviceModel) then) =
      _$DeviceModelCopyWithImpl<$Res, DeviceModel>;
  @useResult
  $Res call(
      {String id,
      String name,
      String ip,
      String mac,
      String status,
      double usageToday,
      double usageWeekly,
      double usageMonthly,
      int? speedLimit,
      int? quota,
      String? quotaPeriod,
      String? userId,
      DateTime connectedAt,
      DateTime lastSeen});
}

/// @nodoc
class _$DeviceModelCopyWithImpl<$Res, $Val extends DeviceModel>
    implements $DeviceModelCopyWith<$Res> {
  _$DeviceModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? ip = null,
    Object? mac = null,
    Object? status = null,
    Object? usageToday = null,
    Object? usageWeekly = null,
    Object? usageMonthly = null,
    Object? speedLimit = freezed,
    Object? quota = freezed,
    Object? quotaPeriod = freezed,
    Object? userId = freezed,
    Object? connectedAt = null,
    Object? lastSeen = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      ip: null == ip
          ? _value.ip
          : ip // ignore: cast_nullable_to_non_nullable
              as String,
      mac: null == mac
          ? _value.mac
          : mac // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      usageToday: null == usageToday
          ? _value.usageToday
          : usageToday // ignore: cast_nullable_to_non_nullable
              as double,
      usageWeekly: null == usageWeekly
          ? _value.usageWeekly
          : usageWeekly // ignore: cast_nullable_to_non_nullable
              as double,
      usageMonthly: null == usageMonthly
          ? _value.usageMonthly
          : usageMonthly // ignore: cast_nullable_to_non_nullable
              as double,
      speedLimit: freezed == speedLimit
          ? _value.speedLimit
          : speedLimit // ignore: cast_nullable_to_non_nullable
              as int?,
      quota: freezed == quota
          ? _value.quota
          : quota // ignore: cast_nullable_to_non_nullable
              as int?,
      quotaPeriod: freezed == quotaPeriod
          ? _value.quotaPeriod
          : quotaPeriod // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      connectedAt: null == connectedAt
          ? _value.connectedAt
          : connectedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastSeen: null == lastSeen
          ? _value.lastSeen
          : lastSeen // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeviceModelImplCopyWith<$Res>
    implements $DeviceModelCopyWith<$Res> {
  factory _$$DeviceModelImplCopyWith(
          _$DeviceModelImpl value, $Res Function(_$DeviceModelImpl) then) =
      __$$DeviceModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String ip,
      String mac,
      String status,
      double usageToday,
      double usageWeekly,
      double usageMonthly,
      int? speedLimit,
      int? quota,
      String? quotaPeriod,
      String? userId,
      DateTime connectedAt,
      DateTime lastSeen});
}

/// @nodoc
class __$$DeviceModelImplCopyWithImpl<$Res>
    extends _$DeviceModelCopyWithImpl<$Res, _$DeviceModelImpl>
    implements _$$DeviceModelImplCopyWith<$Res> {
  __$$DeviceModelImplCopyWithImpl(
      _$DeviceModelImpl _value, $Res Function(_$DeviceModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? ip = null,
    Object? mac = null,
    Object? status = null,
    Object? usageToday = null,
    Object? usageWeekly = null,
    Object? usageMonthly = null,
    Object? speedLimit = freezed,
    Object? quota = freezed,
    Object? quotaPeriod = freezed,
    Object? userId = freezed,
    Object? connectedAt = null,
    Object? lastSeen = null,
  }) {
    return _then(_$DeviceModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      ip: null == ip
          ? _value.ip
          : ip // ignore: cast_nullable_to_non_nullable
              as String,
      mac: null == mac
          ? _value.mac
          : mac // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      usageToday: null == usageToday
          ? _value.usageToday
          : usageToday // ignore: cast_nullable_to_non_nullable
              as double,
      usageWeekly: null == usageWeekly
          ? _value.usageWeekly
          : usageWeekly // ignore: cast_nullable_to_non_nullable
              as double,
      usageMonthly: null == usageMonthly
          ? _value.usageMonthly
          : usageMonthly // ignore: cast_nullable_to_non_nullable
              as double,
      speedLimit: freezed == speedLimit
          ? _value.speedLimit
          : speedLimit // ignore: cast_nullable_to_non_nullable
              as int?,
      quota: freezed == quota
          ? _value.quota
          : quota // ignore: cast_nullable_to_non_nullable
              as int?,
      quotaPeriod: freezed == quotaPeriod
          ? _value.quotaPeriod
          : quotaPeriod // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      connectedAt: null == connectedAt
          ? _value.connectedAt
          : connectedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastSeen: null == lastSeen
          ? _value.lastSeen
          : lastSeen // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeviceModelImpl implements _DeviceModel {
  const _$DeviceModelImpl(
      {required this.id,
      required this.name,
      required this.ip,
      required this.mac,
      required this.status,
      required this.usageToday,
      required this.usageWeekly,
      required this.usageMonthly,
      this.speedLimit,
      this.quota,
      this.quotaPeriod,
      this.userId,
      required this.connectedAt,
      required this.lastSeen});

  factory _$DeviceModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeviceModelImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String ip;
  @override
  final String mac;
  @override
  final String status;
// 'online', 'blocked', 'limited'
  @override
  final double usageToday;
  @override
  final double usageWeekly;
  @override
  final double usageMonthly;
  @override
  final int? speedLimit;
// Mbps
  @override
  final int? quota;
// GB
  @override
  final String? quotaPeriod;
  @override
  final String? userId;
  @override
  final DateTime connectedAt;
  @override
  final DateTime lastSeen;

  @override
  String toString() {
    return 'DeviceModel(id: $id, name: $name, ip: $ip, mac: $mac, status: $status, usageToday: $usageToday, usageWeekly: $usageWeekly, usageMonthly: $usageMonthly, speedLimit: $speedLimit, quota: $quota, quotaPeriod: $quotaPeriod, userId: $userId, connectedAt: $connectedAt, lastSeen: $lastSeen)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeviceModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.ip, ip) || other.ip == ip) &&
            (identical(other.mac, mac) || other.mac == mac) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.usageToday, usageToday) ||
                other.usageToday == usageToday) &&
            (identical(other.usageWeekly, usageWeekly) ||
                other.usageWeekly == usageWeekly) &&
            (identical(other.usageMonthly, usageMonthly) ||
                other.usageMonthly == usageMonthly) &&
            (identical(other.speedLimit, speedLimit) ||
                other.speedLimit == speedLimit) &&
            (identical(other.quota, quota) || other.quota == quota) &&
            (identical(other.quotaPeriod, quotaPeriod) ||
                other.quotaPeriod == quotaPeriod) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.connectedAt, connectedAt) ||
                other.connectedAt == connectedAt) &&
            (identical(other.lastSeen, lastSeen) ||
                other.lastSeen == lastSeen));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      ip,
      mac,
      status,
      usageToday,
      usageWeekly,
      usageMonthly,
      speedLimit,
      quota,
      quotaPeriod,
      userId,
      connectedAt,
      lastSeen);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeviceModelImplCopyWith<_$DeviceModelImpl> get copyWith =>
      __$$DeviceModelImplCopyWithImpl<_$DeviceModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeviceModelImplToJson(
      this,
    );
  }
}

abstract class _DeviceModel implements DeviceModel {
  const factory _DeviceModel(
      {required final String id,
      required final String name,
      required final String ip,
      required final String mac,
      required final String status,
      required final double usageToday,
      required final double usageWeekly,
      required final double usageMonthly,
      final int? speedLimit,
      final int? quota,
      final String? quotaPeriod,
      final String? userId,
      required final DateTime connectedAt,
      required final DateTime lastSeen}) = _$DeviceModelImpl;

  factory _DeviceModel.fromJson(Map<String, dynamic> json) =
      _$DeviceModelImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get ip;
  @override
  String get mac;
  @override
  String get status;
  @override // 'online', 'blocked', 'limited'
  double get usageToday;
  @override
  double get usageWeekly;
  @override
  double get usageMonthly;
  @override
  int? get speedLimit;
  @override // Mbps
  int? get quota;
  @override // GB
  String? get quotaPeriod;
  @override
  String? get userId;
  @override
  DateTime get connectedAt;
  @override
  DateTime get lastSeen;
  @override
  @JsonKey(ignore: true)
  _$$DeviceModelImplCopyWith<_$DeviceModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
