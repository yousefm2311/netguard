// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'security_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SecuritySettings _$SecuritySettingsFromJson(Map<String, dynamic> json) {
  return _SecuritySettings.fromJson(json);
}

/// @nodoc
mixin _$SecuritySettings {
  bool get threatProtection => throw _privateConstructorUsedError;
  bool get firewall => throw _privateConstructorUsedError;
  bool get portScanDetection => throw _privateConstructorUsedError;
  int get securityScore => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SecuritySettingsCopyWith<SecuritySettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SecuritySettingsCopyWith<$Res> {
  factory $SecuritySettingsCopyWith(
          SecuritySettings value, $Res Function(SecuritySettings) then) =
      _$SecuritySettingsCopyWithImpl<$Res, SecuritySettings>;
  @useResult
  $Res call(
      {bool threatProtection,
      bool firewall,
      bool portScanDetection,
      int securityScore});
}

/// @nodoc
class _$SecuritySettingsCopyWithImpl<$Res, $Val extends SecuritySettings>
    implements $SecuritySettingsCopyWith<$Res> {
  _$SecuritySettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? threatProtection = null,
    Object? firewall = null,
    Object? portScanDetection = null,
    Object? securityScore = null,
  }) {
    return _then(_value.copyWith(
      threatProtection: null == threatProtection
          ? _value.threatProtection
          : threatProtection // ignore: cast_nullable_to_non_nullable
              as bool,
      firewall: null == firewall
          ? _value.firewall
          : firewall // ignore: cast_nullable_to_non_nullable
              as bool,
      portScanDetection: null == portScanDetection
          ? _value.portScanDetection
          : portScanDetection // ignore: cast_nullable_to_non_nullable
              as bool,
      securityScore: null == securityScore
          ? _value.securityScore
          : securityScore // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SecuritySettingsImplCopyWith<$Res>
    implements $SecuritySettingsCopyWith<$Res> {
  factory _$$SecuritySettingsImplCopyWith(_$SecuritySettingsImpl value,
          $Res Function(_$SecuritySettingsImpl) then) =
      __$$SecuritySettingsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool threatProtection,
      bool firewall,
      bool portScanDetection,
      int securityScore});
}

/// @nodoc
class __$$SecuritySettingsImplCopyWithImpl<$Res>
    extends _$SecuritySettingsCopyWithImpl<$Res, _$SecuritySettingsImpl>
    implements _$$SecuritySettingsImplCopyWith<$Res> {
  __$$SecuritySettingsImplCopyWithImpl(_$SecuritySettingsImpl _value,
      $Res Function(_$SecuritySettingsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? threatProtection = null,
    Object? firewall = null,
    Object? portScanDetection = null,
    Object? securityScore = null,
  }) {
    return _then(_$SecuritySettingsImpl(
      threatProtection: null == threatProtection
          ? _value.threatProtection
          : threatProtection // ignore: cast_nullable_to_non_nullable
              as bool,
      firewall: null == firewall
          ? _value.firewall
          : firewall // ignore: cast_nullable_to_non_nullable
              as bool,
      portScanDetection: null == portScanDetection
          ? _value.portScanDetection
          : portScanDetection // ignore: cast_nullable_to_non_nullable
              as bool,
      securityScore: null == securityScore
          ? _value.securityScore
          : securityScore // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SecuritySettingsImpl implements _SecuritySettings {
  const _$SecuritySettingsImpl(
      {required this.threatProtection,
      required this.firewall,
      required this.portScanDetection,
      required this.securityScore});

  factory _$SecuritySettingsImpl.fromJson(Map<String, dynamic> json) =>
      _$$SecuritySettingsImplFromJson(json);

  @override
  final bool threatProtection;
  @override
  final bool firewall;
  @override
  final bool portScanDetection;
  @override
  final int securityScore;

  @override
  String toString() {
    return 'SecuritySettings(threatProtection: $threatProtection, firewall: $firewall, portScanDetection: $portScanDetection, securityScore: $securityScore)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SecuritySettingsImpl &&
            (identical(other.threatProtection, threatProtection) ||
                other.threatProtection == threatProtection) &&
            (identical(other.firewall, firewall) ||
                other.firewall == firewall) &&
            (identical(other.portScanDetection, portScanDetection) ||
                other.portScanDetection == portScanDetection) &&
            (identical(other.securityScore, securityScore) ||
                other.securityScore == securityScore));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, threatProtection, firewall,
      portScanDetection, securityScore);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SecuritySettingsImplCopyWith<_$SecuritySettingsImpl> get copyWith =>
      __$$SecuritySettingsImplCopyWithImpl<_$SecuritySettingsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SecuritySettingsImplToJson(
      this,
    );
  }
}

abstract class _SecuritySettings implements SecuritySettings {
  const factory _SecuritySettings(
      {required final bool threatProtection,
      required final bool firewall,
      required final bool portScanDetection,
      required final int securityScore}) = _$SecuritySettingsImpl;

  factory _SecuritySettings.fromJson(Map<String, dynamic> json) =
      _$SecuritySettingsImpl.fromJson;

  @override
  bool get threatProtection;
  @override
  bool get firewall;
  @override
  bool get portScanDetection;
  @override
  int get securityScore;
  @override
  @JsonKey(ignore: true)
  _$$SecuritySettingsImplCopyWith<_$SecuritySettingsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Threat _$ThreatFromJson(Map<String, dynamic> json) {
  return _Threat.fromJson(json);
}

/// @nodoc
mixin _$Threat {
  String get id => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get severity =>
      throw _privateConstructorUsedError; // 'low', 'medium', 'high', 'critical'
  String get description => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;
  String get sourceIp => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ThreatCopyWith<Threat> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ThreatCopyWith<$Res> {
  factory $ThreatCopyWith(Threat value, $Res Function(Threat) then) =
      _$ThreatCopyWithImpl<$Res, Threat>;
  @useResult
  $Res call(
      {String id,
      String type,
      String severity,
      String description,
      DateTime timestamp,
      String sourceIp});
}

/// @nodoc
class _$ThreatCopyWithImpl<$Res, $Val extends Threat>
    implements $ThreatCopyWith<$Res> {
  _$ThreatCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? severity = null,
    Object? description = null,
    Object? timestamp = null,
    Object? sourceIp = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      severity: null == severity
          ? _value.severity
          : severity // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      sourceIp: null == sourceIp
          ? _value.sourceIp
          : sourceIp // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ThreatImplCopyWith<$Res> implements $ThreatCopyWith<$Res> {
  factory _$$ThreatImplCopyWith(
          _$ThreatImpl value, $Res Function(_$ThreatImpl) then) =
      __$$ThreatImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String type,
      String severity,
      String description,
      DateTime timestamp,
      String sourceIp});
}

/// @nodoc
class __$$ThreatImplCopyWithImpl<$Res>
    extends _$ThreatCopyWithImpl<$Res, _$ThreatImpl>
    implements _$$ThreatImplCopyWith<$Res> {
  __$$ThreatImplCopyWithImpl(
      _$ThreatImpl _value, $Res Function(_$ThreatImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? severity = null,
    Object? description = null,
    Object? timestamp = null,
    Object? sourceIp = null,
  }) {
    return _then(_$ThreatImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      severity: null == severity
          ? _value.severity
          : severity // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      sourceIp: null == sourceIp
          ? _value.sourceIp
          : sourceIp // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ThreatImpl implements _Threat {
  const _$ThreatImpl(
      {required this.id,
      required this.type,
      required this.severity,
      required this.description,
      required this.timestamp,
      required this.sourceIp});

  factory _$ThreatImpl.fromJson(Map<String, dynamic> json) =>
      _$$ThreatImplFromJson(json);

  @override
  final String id;
  @override
  final String type;
  @override
  final String severity;
// 'low', 'medium', 'high', 'critical'
  @override
  final String description;
  @override
  final DateTime timestamp;
  @override
  final String sourceIp;

  @override
  String toString() {
    return 'Threat(id: $id, type: $type, severity: $severity, description: $description, timestamp: $timestamp, sourceIp: $sourceIp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ThreatImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.severity, severity) ||
                other.severity == severity) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.sourceIp, sourceIp) ||
                other.sourceIp == sourceIp));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, type, severity, description, timestamp, sourceIp);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ThreatImplCopyWith<_$ThreatImpl> get copyWith =>
      __$$ThreatImplCopyWithImpl<_$ThreatImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ThreatImplToJson(
      this,
    );
  }
}

abstract class _Threat implements Threat {
  const factory _Threat(
      {required final String id,
      required final String type,
      required final String severity,
      required final String description,
      required final DateTime timestamp,
      required final String sourceIp}) = _$ThreatImpl;

  factory _Threat.fromJson(Map<String, dynamic> json) = _$ThreatImpl.fromJson;

  @override
  String get id;
  @override
  String get type;
  @override
  String get severity;
  @override // 'low', 'medium', 'high', 'critical'
  String get description;
  @override
  DateTime get timestamp;
  @override
  String get sourceIp;
  @override
  @JsonKey(ignore: true)
  _$$ThreatImplCopyWith<_$ThreatImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
