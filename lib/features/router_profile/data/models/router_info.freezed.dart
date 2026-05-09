// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'router_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RouterInfo _$RouterInfoFromJson(Map<String, dynamic> json) {
  return _RouterInfo.fromJson(json);
}

/// @nodoc
mixin _$RouterInfo {
  String get model => throw _privateConstructorUsedError;
  String get brand => throw _privateConstructorUsedError;
  String get firmware => throw _privateConstructorUsedError;
  String get ip => throw _privateConstructorUsedError;
  String get mac => throw _privateConstructorUsedError;
  DateTime get lastDetected => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RouterInfoCopyWith<RouterInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RouterInfoCopyWith<$Res> {
  factory $RouterInfoCopyWith(
          RouterInfo value, $Res Function(RouterInfo) then) =
      _$RouterInfoCopyWithImpl<$Res, RouterInfo>;
  @useResult
  $Res call(
      {String model,
      String brand,
      String firmware,
      String ip,
      String mac,
      DateTime lastDetected});
}

/// @nodoc
class _$RouterInfoCopyWithImpl<$Res, $Val extends RouterInfo>
    implements $RouterInfoCopyWith<$Res> {
  _$RouterInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = null,
    Object? brand = null,
    Object? firmware = null,
    Object? ip = null,
    Object? mac = null,
    Object? lastDetected = null,
  }) {
    return _then(_value.copyWith(
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
      brand: null == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String,
      firmware: null == firmware
          ? _value.firmware
          : firmware // ignore: cast_nullable_to_non_nullable
              as String,
      ip: null == ip
          ? _value.ip
          : ip // ignore: cast_nullable_to_non_nullable
              as String,
      mac: null == mac
          ? _value.mac
          : mac // ignore: cast_nullable_to_non_nullable
              as String,
      lastDetected: null == lastDetected
          ? _value.lastDetected
          : lastDetected // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RouterInfoImplCopyWith<$Res>
    implements $RouterInfoCopyWith<$Res> {
  factory _$$RouterInfoImplCopyWith(
          _$RouterInfoImpl value, $Res Function(_$RouterInfoImpl) then) =
      __$$RouterInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String model,
      String brand,
      String firmware,
      String ip,
      String mac,
      DateTime lastDetected});
}

/// @nodoc
class __$$RouterInfoImplCopyWithImpl<$Res>
    extends _$RouterInfoCopyWithImpl<$Res, _$RouterInfoImpl>
    implements _$$RouterInfoImplCopyWith<$Res> {
  __$$RouterInfoImplCopyWithImpl(
      _$RouterInfoImpl _value, $Res Function(_$RouterInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = null,
    Object? brand = null,
    Object? firmware = null,
    Object? ip = null,
    Object? mac = null,
    Object? lastDetected = null,
  }) {
    return _then(_$RouterInfoImpl(
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
      brand: null == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String,
      firmware: null == firmware
          ? _value.firmware
          : firmware // ignore: cast_nullable_to_non_nullable
              as String,
      ip: null == ip
          ? _value.ip
          : ip // ignore: cast_nullable_to_non_nullable
              as String,
      mac: null == mac
          ? _value.mac
          : mac // ignore: cast_nullable_to_non_nullable
              as String,
      lastDetected: null == lastDetected
          ? _value.lastDetected
          : lastDetected // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RouterInfoImpl implements _RouterInfo {
  const _$RouterInfoImpl(
      {required this.model,
      required this.brand,
      required this.firmware,
      required this.ip,
      required this.mac,
      required this.lastDetected});

  factory _$RouterInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$RouterInfoImplFromJson(json);

  @override
  final String model;
  @override
  final String brand;
  @override
  final String firmware;
  @override
  final String ip;
  @override
  final String mac;
  @override
  final DateTime lastDetected;

  @override
  String toString() {
    return 'RouterInfo(model: $model, brand: $brand, firmware: $firmware, ip: $ip, mac: $mac, lastDetected: $lastDetected)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RouterInfoImpl &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.brand, brand) || other.brand == brand) &&
            (identical(other.firmware, firmware) ||
                other.firmware == firmware) &&
            (identical(other.ip, ip) || other.ip == ip) &&
            (identical(other.mac, mac) || other.mac == mac) &&
            (identical(other.lastDetected, lastDetected) ||
                other.lastDetected == lastDetected));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, model, brand, firmware, ip, mac, lastDetected);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RouterInfoImplCopyWith<_$RouterInfoImpl> get copyWith =>
      __$$RouterInfoImplCopyWithImpl<_$RouterInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RouterInfoImplToJson(
      this,
    );
  }
}

abstract class _RouterInfo implements RouterInfo {
  const factory _RouterInfo(
      {required final String model,
      required final String brand,
      required final String firmware,
      required final String ip,
      required final String mac,
      required final DateTime lastDetected}) = _$RouterInfoImpl;

  factory _RouterInfo.fromJson(Map<String, dynamic> json) =
      _$RouterInfoImpl.fromJson;

  @override
  String get model;
  @override
  String get brand;
  @override
  String get firmware;
  @override
  String get ip;
  @override
  String get mac;
  @override
  DateTime get lastDetected;
  @override
  @JsonKey(ignore: true)
  _$$RouterInfoImplCopyWith<_$RouterInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
