// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'network_log_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NetworkLogEntry _$NetworkLogEntryFromJson(Map<String, dynamic> json) {
  return _NetworkLogEntry.fromJson(json);
}

/// @nodoc
mixin _$NetworkLogEntry {
  String get id => throw _privateConstructorUsedError;
  String get deviceId => throw _privateConstructorUsedError;
  String get domain => throw _privateConstructorUsedError;
  String get protocol => throw _privateConstructorUsedError;
  String get action => throw _privateConstructorUsedError; // 'allow', 'block'
  DateTime get timestamp => throw _privateConstructorUsedError;
  int get bytes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NetworkLogEntryCopyWith<NetworkLogEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NetworkLogEntryCopyWith<$Res> {
  factory $NetworkLogEntryCopyWith(
          NetworkLogEntry value, $Res Function(NetworkLogEntry) then) =
      _$NetworkLogEntryCopyWithImpl<$Res, NetworkLogEntry>;
  @useResult
  $Res call(
      {String id,
      String deviceId,
      String domain,
      String protocol,
      String action,
      DateTime timestamp,
      int bytes});
}

/// @nodoc
class _$NetworkLogEntryCopyWithImpl<$Res, $Val extends NetworkLogEntry>
    implements $NetworkLogEntryCopyWith<$Res> {
  _$NetworkLogEntryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? deviceId = null,
    Object? domain = null,
    Object? protocol = null,
    Object? action = null,
    Object? timestamp = null,
    Object? bytes = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      deviceId: null == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String,
      domain: null == domain
          ? _value.domain
          : domain // ignore: cast_nullable_to_non_nullable
              as String,
      protocol: null == protocol
          ? _value.protocol
          : protocol // ignore: cast_nullable_to_non_nullable
              as String,
      action: null == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      bytes: null == bytes
          ? _value.bytes
          : bytes // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NetworkLogEntryImplCopyWith<$Res>
    implements $NetworkLogEntryCopyWith<$Res> {
  factory _$$NetworkLogEntryImplCopyWith(_$NetworkLogEntryImpl value,
          $Res Function(_$NetworkLogEntryImpl) then) =
      __$$NetworkLogEntryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String deviceId,
      String domain,
      String protocol,
      String action,
      DateTime timestamp,
      int bytes});
}

/// @nodoc
class __$$NetworkLogEntryImplCopyWithImpl<$Res>
    extends _$NetworkLogEntryCopyWithImpl<$Res, _$NetworkLogEntryImpl>
    implements _$$NetworkLogEntryImplCopyWith<$Res> {
  __$$NetworkLogEntryImplCopyWithImpl(
      _$NetworkLogEntryImpl _value, $Res Function(_$NetworkLogEntryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? deviceId = null,
    Object? domain = null,
    Object? protocol = null,
    Object? action = null,
    Object? timestamp = null,
    Object? bytes = null,
  }) {
    return _then(_$NetworkLogEntryImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      deviceId: null == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String,
      domain: null == domain
          ? _value.domain
          : domain // ignore: cast_nullable_to_non_nullable
              as String,
      protocol: null == protocol
          ? _value.protocol
          : protocol // ignore: cast_nullable_to_non_nullable
              as String,
      action: null == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      bytes: null == bytes
          ? _value.bytes
          : bytes // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NetworkLogEntryImpl implements _NetworkLogEntry {
  const _$NetworkLogEntryImpl(
      {required this.id,
      required this.deviceId,
      required this.domain,
      required this.protocol,
      required this.action,
      required this.timestamp,
      required this.bytes});

  factory _$NetworkLogEntryImpl.fromJson(Map<String, dynamic> json) =>
      _$$NetworkLogEntryImplFromJson(json);

  @override
  final String id;
  @override
  final String deviceId;
  @override
  final String domain;
  @override
  final String protocol;
  @override
  final String action;
// 'allow', 'block'
  @override
  final DateTime timestamp;
  @override
  final int bytes;

  @override
  String toString() {
    return 'NetworkLogEntry(id: $id, deviceId: $deviceId, domain: $domain, protocol: $protocol, action: $action, timestamp: $timestamp, bytes: $bytes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NetworkLogEntryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            (identical(other.domain, domain) || other.domain == domain) &&
            (identical(other.protocol, protocol) ||
                other.protocol == protocol) &&
            (identical(other.action, action) || other.action == action) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.bytes, bytes) || other.bytes == bytes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, deviceId, domain, protocol, action, timestamp, bytes);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NetworkLogEntryImplCopyWith<_$NetworkLogEntryImpl> get copyWith =>
      __$$NetworkLogEntryImplCopyWithImpl<_$NetworkLogEntryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NetworkLogEntryImplToJson(
      this,
    );
  }
}

abstract class _NetworkLogEntry implements NetworkLogEntry {
  const factory _NetworkLogEntry(
      {required final String id,
      required final String deviceId,
      required final String domain,
      required final String protocol,
      required final String action,
      required final DateTime timestamp,
      required final int bytes}) = _$NetworkLogEntryImpl;

  factory _NetworkLogEntry.fromJson(Map<String, dynamic> json) =
      _$NetworkLogEntryImpl.fromJson;

  @override
  String get id;
  @override
  String get deviceId;
  @override
  String get domain;
  @override
  String get protocol;
  @override
  String get action;
  @override // 'allow', 'block'
  DateTime get timestamp;
  @override
  int get bytes;
  @override
  @JsonKey(ignore: true)
  _$$NetworkLogEntryImplCopyWith<_$NetworkLogEntryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
