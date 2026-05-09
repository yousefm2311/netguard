// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'guest_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GuestConfig _$GuestConfigFromJson(Map<String, dynamic> json) {
  return _GuestConfig.fromJson(json);
}

/// @nodoc
mixin _$GuestConfig {
  String get ssid => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  bool get isEnabled => throw _privateConstructorUsedError;
  int get duration => throw _privateConstructorUsedError; // in hours
  int? get speedLimit => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GuestConfigCopyWith<GuestConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GuestConfigCopyWith<$Res> {
  factory $GuestConfigCopyWith(
          GuestConfig value, $Res Function(GuestConfig) then) =
      _$GuestConfigCopyWithImpl<$Res, GuestConfig>;
  @useResult
  $Res call(
      {String ssid,
      String password,
      bool isEnabled,
      int duration,
      int? speedLimit});
}

/// @nodoc
class _$GuestConfigCopyWithImpl<$Res, $Val extends GuestConfig>
    implements $GuestConfigCopyWith<$Res> {
  _$GuestConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ssid = null,
    Object? password = null,
    Object? isEnabled = null,
    Object? duration = null,
    Object? speedLimit = freezed,
  }) {
    return _then(_value.copyWith(
      ssid: null == ssid
          ? _value.ssid
          : ssid // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      isEnabled: null == isEnabled
          ? _value.isEnabled
          : isEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      speedLimit: freezed == speedLimit
          ? _value.speedLimit
          : speedLimit // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GuestConfigImplCopyWith<$Res>
    implements $GuestConfigCopyWith<$Res> {
  factory _$$GuestConfigImplCopyWith(
          _$GuestConfigImpl value, $Res Function(_$GuestConfigImpl) then) =
      __$$GuestConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String ssid,
      String password,
      bool isEnabled,
      int duration,
      int? speedLimit});
}

/// @nodoc
class __$$GuestConfigImplCopyWithImpl<$Res>
    extends _$GuestConfigCopyWithImpl<$Res, _$GuestConfigImpl>
    implements _$$GuestConfigImplCopyWith<$Res> {
  __$$GuestConfigImplCopyWithImpl(
      _$GuestConfigImpl _value, $Res Function(_$GuestConfigImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ssid = null,
    Object? password = null,
    Object? isEnabled = null,
    Object? duration = null,
    Object? speedLimit = freezed,
  }) {
    return _then(_$GuestConfigImpl(
      ssid: null == ssid
          ? _value.ssid
          : ssid // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      isEnabled: null == isEnabled
          ? _value.isEnabled
          : isEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      speedLimit: freezed == speedLimit
          ? _value.speedLimit
          : speedLimit // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GuestConfigImpl implements _GuestConfig {
  const _$GuestConfigImpl(
      {required this.ssid,
      required this.password,
      required this.isEnabled,
      required this.duration,
      this.speedLimit});

  factory _$GuestConfigImpl.fromJson(Map<String, dynamic> json) =>
      _$$GuestConfigImplFromJson(json);

  @override
  final String ssid;
  @override
  final String password;
  @override
  final bool isEnabled;
  @override
  final int duration;
// in hours
  @override
  final int? speedLimit;

  @override
  String toString() {
    return 'GuestConfig(ssid: $ssid, password: $password, isEnabled: $isEnabled, duration: $duration, speedLimit: $speedLimit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GuestConfigImpl &&
            (identical(other.ssid, ssid) || other.ssid == ssid) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.isEnabled, isEnabled) ||
                other.isEnabled == isEnabled) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.speedLimit, speedLimit) ||
                other.speedLimit == speedLimit));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, ssid, password, isEnabled, duration, speedLimit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GuestConfigImplCopyWith<_$GuestConfigImpl> get copyWith =>
      __$$GuestConfigImplCopyWithImpl<_$GuestConfigImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GuestConfigImplToJson(
      this,
    );
  }
}

abstract class _GuestConfig implements GuestConfig {
  const factory _GuestConfig(
      {required final String ssid,
      required final String password,
      required final bool isEnabled,
      required final int duration,
      final int? speedLimit}) = _$GuestConfigImpl;

  factory _GuestConfig.fromJson(Map<String, dynamic> json) =
      _$GuestConfigImpl.fromJson;

  @override
  String get ssid;
  @override
  String get password;
  @override
  bool get isEnabled;
  @override
  int get duration;
  @override // in hours
  int? get speedLimit;
  @override
  @JsonKey(ignore: true)
  _$$GuestConfigImplCopyWith<_$GuestConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GuestDevice _$GuestDeviceFromJson(Map<String, dynamic> json) {
  return _GuestDevice.fromJson(json);
}

/// @nodoc
mixin _$GuestDevice {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  DateTime get connectedAt => throw _privateConstructorUsedError;
  double get usage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GuestDeviceCopyWith<GuestDevice> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GuestDeviceCopyWith<$Res> {
  factory $GuestDeviceCopyWith(
          GuestDevice value, $Res Function(GuestDevice) then) =
      _$GuestDeviceCopyWithImpl<$Res, GuestDevice>;
  @useResult
  $Res call({String id, String name, DateTime connectedAt, double usage});
}

/// @nodoc
class _$GuestDeviceCopyWithImpl<$Res, $Val extends GuestDevice>
    implements $GuestDeviceCopyWith<$Res> {
  _$GuestDeviceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? connectedAt = null,
    Object? usage = null,
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
      connectedAt: null == connectedAt
          ? _value.connectedAt
          : connectedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      usage: null == usage
          ? _value.usage
          : usage // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GuestDeviceImplCopyWith<$Res>
    implements $GuestDeviceCopyWith<$Res> {
  factory _$$GuestDeviceImplCopyWith(
          _$GuestDeviceImpl value, $Res Function(_$GuestDeviceImpl) then) =
      __$$GuestDeviceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, DateTime connectedAt, double usage});
}

/// @nodoc
class __$$GuestDeviceImplCopyWithImpl<$Res>
    extends _$GuestDeviceCopyWithImpl<$Res, _$GuestDeviceImpl>
    implements _$$GuestDeviceImplCopyWith<$Res> {
  __$$GuestDeviceImplCopyWithImpl(
      _$GuestDeviceImpl _value, $Res Function(_$GuestDeviceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? connectedAt = null,
    Object? usage = null,
  }) {
    return _then(_$GuestDeviceImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      connectedAt: null == connectedAt
          ? _value.connectedAt
          : connectedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      usage: null == usage
          ? _value.usage
          : usage // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GuestDeviceImpl implements _GuestDevice {
  const _$GuestDeviceImpl(
      {required this.id,
      required this.name,
      required this.connectedAt,
      required this.usage});

  factory _$GuestDeviceImpl.fromJson(Map<String, dynamic> json) =>
      _$$GuestDeviceImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final DateTime connectedAt;
  @override
  final double usage;

  @override
  String toString() {
    return 'GuestDevice(id: $id, name: $name, connectedAt: $connectedAt, usage: $usage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GuestDeviceImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.connectedAt, connectedAt) ||
                other.connectedAt == connectedAt) &&
            (identical(other.usage, usage) || other.usage == usage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, connectedAt, usage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GuestDeviceImplCopyWith<_$GuestDeviceImpl> get copyWith =>
      __$$GuestDeviceImplCopyWithImpl<_$GuestDeviceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GuestDeviceImplToJson(
      this,
    );
  }
}

abstract class _GuestDevice implements GuestDevice {
  const factory _GuestDevice(
      {required final String id,
      required final String name,
      required final DateTime connectedAt,
      required final double usage}) = _$GuestDeviceImpl;

  factory _GuestDevice.fromJson(Map<String, dynamic> json) =
      _$GuestDeviceImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  DateTime get connectedAt;
  @override
  double get usage;
  @override
  @JsonKey(ignore: true)
  _$$GuestDeviceImplCopyWith<_$GuestDeviceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
