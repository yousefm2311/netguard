// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_stats.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DashboardStats _$DashboardStatsFromJson(Map<String, dynamic> json) {
  return _DashboardStats.fromJson(json);
}

/// @nodoc
mixin _$DashboardStats {
  int get connectedCount => throw _privateConstructorUsedError;
  double get totalUsageToday => throw _privateConstructorUsedError;
  int get activeAlerts => throw _privateConstructorUsedError;
  DeviceModel get topDevice => throw _privateConstructorUsedError;
  List<DailyUsage> get usageChart => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DashboardStatsCopyWith<DashboardStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardStatsCopyWith<$Res> {
  factory $DashboardStatsCopyWith(
          DashboardStats value, $Res Function(DashboardStats) then) =
      _$DashboardStatsCopyWithImpl<$Res, DashboardStats>;
  @useResult
  $Res call(
      {int connectedCount,
      double totalUsageToday,
      int activeAlerts,
      DeviceModel topDevice,
      List<DailyUsage> usageChart});

  $DeviceModelCopyWith<$Res> get topDevice;
}

/// @nodoc
class _$DashboardStatsCopyWithImpl<$Res, $Val extends DashboardStats>
    implements $DashboardStatsCopyWith<$Res> {
  _$DashboardStatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? connectedCount = null,
    Object? totalUsageToday = null,
    Object? activeAlerts = null,
    Object? topDevice = null,
    Object? usageChart = null,
  }) {
    return _then(_value.copyWith(
      connectedCount: null == connectedCount
          ? _value.connectedCount
          : connectedCount // ignore: cast_nullable_to_non_nullable
              as int,
      totalUsageToday: null == totalUsageToday
          ? _value.totalUsageToday
          : totalUsageToday // ignore: cast_nullable_to_non_nullable
              as double,
      activeAlerts: null == activeAlerts
          ? _value.activeAlerts
          : activeAlerts // ignore: cast_nullable_to_non_nullable
              as int,
      topDevice: null == topDevice
          ? _value.topDevice
          : topDevice // ignore: cast_nullable_to_non_nullable
              as DeviceModel,
      usageChart: null == usageChart
          ? _value.usageChart
          : usageChart // ignore: cast_nullable_to_non_nullable
              as List<DailyUsage>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DeviceModelCopyWith<$Res> get topDevice {
    return $DeviceModelCopyWith<$Res>(_value.topDevice, (value) {
      return _then(_value.copyWith(topDevice: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DashboardStatsImplCopyWith<$Res>
    implements $DashboardStatsCopyWith<$Res> {
  factory _$$DashboardStatsImplCopyWith(_$DashboardStatsImpl value,
          $Res Function(_$DashboardStatsImpl) then) =
      __$$DashboardStatsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int connectedCount,
      double totalUsageToday,
      int activeAlerts,
      DeviceModel topDevice,
      List<DailyUsage> usageChart});

  @override
  $DeviceModelCopyWith<$Res> get topDevice;
}

/// @nodoc
class __$$DashboardStatsImplCopyWithImpl<$Res>
    extends _$DashboardStatsCopyWithImpl<$Res, _$DashboardStatsImpl>
    implements _$$DashboardStatsImplCopyWith<$Res> {
  __$$DashboardStatsImplCopyWithImpl(
      _$DashboardStatsImpl _value, $Res Function(_$DashboardStatsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? connectedCount = null,
    Object? totalUsageToday = null,
    Object? activeAlerts = null,
    Object? topDevice = null,
    Object? usageChart = null,
  }) {
    return _then(_$DashboardStatsImpl(
      connectedCount: null == connectedCount
          ? _value.connectedCount
          : connectedCount // ignore: cast_nullable_to_non_nullable
              as int,
      totalUsageToday: null == totalUsageToday
          ? _value.totalUsageToday
          : totalUsageToday // ignore: cast_nullable_to_non_nullable
              as double,
      activeAlerts: null == activeAlerts
          ? _value.activeAlerts
          : activeAlerts // ignore: cast_nullable_to_non_nullable
              as int,
      topDevice: null == topDevice
          ? _value.topDevice
          : topDevice // ignore: cast_nullable_to_non_nullable
              as DeviceModel,
      usageChart: null == usageChart
          ? _value._usageChart
          : usageChart // ignore: cast_nullable_to_non_nullable
              as List<DailyUsage>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DashboardStatsImpl implements _DashboardStats {
  const _$DashboardStatsImpl(
      {required this.connectedCount,
      required this.totalUsageToday,
      required this.activeAlerts,
      required this.topDevice,
      required final List<DailyUsage> usageChart})
      : _usageChart = usageChart;

  factory _$DashboardStatsImpl.fromJson(Map<String, dynamic> json) =>
      _$$DashboardStatsImplFromJson(json);

  @override
  final int connectedCount;
  @override
  final double totalUsageToday;
  @override
  final int activeAlerts;
  @override
  final DeviceModel topDevice;
  final List<DailyUsage> _usageChart;
  @override
  List<DailyUsage> get usageChart {
    if (_usageChart is EqualUnmodifiableListView) return _usageChart;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_usageChart);
  }

  @override
  String toString() {
    return 'DashboardStats(connectedCount: $connectedCount, totalUsageToday: $totalUsageToday, activeAlerts: $activeAlerts, topDevice: $topDevice, usageChart: $usageChart)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DashboardStatsImpl &&
            (identical(other.connectedCount, connectedCount) ||
                other.connectedCount == connectedCount) &&
            (identical(other.totalUsageToday, totalUsageToday) ||
                other.totalUsageToday == totalUsageToday) &&
            (identical(other.activeAlerts, activeAlerts) ||
                other.activeAlerts == activeAlerts) &&
            (identical(other.topDevice, topDevice) ||
                other.topDevice == topDevice) &&
            const DeepCollectionEquality()
                .equals(other._usageChart, _usageChart));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      connectedCount,
      totalUsageToday,
      activeAlerts,
      topDevice,
      const DeepCollectionEquality().hash(_usageChart));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DashboardStatsImplCopyWith<_$DashboardStatsImpl> get copyWith =>
      __$$DashboardStatsImplCopyWithImpl<_$DashboardStatsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DashboardStatsImplToJson(
      this,
    );
  }
}

abstract class _DashboardStats implements DashboardStats {
  const factory _DashboardStats(
      {required final int connectedCount,
      required final double totalUsageToday,
      required final int activeAlerts,
      required final DeviceModel topDevice,
      required final List<DailyUsage> usageChart}) = _$DashboardStatsImpl;

  factory _DashboardStats.fromJson(Map<String, dynamic> json) =
      _$DashboardStatsImpl.fromJson;

  @override
  int get connectedCount;
  @override
  double get totalUsageToday;
  @override
  int get activeAlerts;
  @override
  DeviceModel get topDevice;
  @override
  List<DailyUsage> get usageChart;
  @override
  @JsonKey(ignore: true)
  _$$DashboardStatsImplCopyWith<_$DashboardStatsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DailyUsage _$DailyUsageFromJson(Map<String, dynamic> json) {
  return _DailyUsage.fromJson(json);
}

/// @nodoc
mixin _$DailyUsage {
  DateTime get date => throw _privateConstructorUsedError;
  double get usage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DailyUsageCopyWith<DailyUsage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DailyUsageCopyWith<$Res> {
  factory $DailyUsageCopyWith(
          DailyUsage value, $Res Function(DailyUsage) then) =
      _$DailyUsageCopyWithImpl<$Res, DailyUsage>;
  @useResult
  $Res call({DateTime date, double usage});
}

/// @nodoc
class _$DailyUsageCopyWithImpl<$Res, $Val extends DailyUsage>
    implements $DailyUsageCopyWith<$Res> {
  _$DailyUsageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? usage = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      usage: null == usage
          ? _value.usage
          : usage // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DailyUsageImplCopyWith<$Res>
    implements $DailyUsageCopyWith<$Res> {
  factory _$$DailyUsageImplCopyWith(
          _$DailyUsageImpl value, $Res Function(_$DailyUsageImpl) then) =
      __$$DailyUsageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime date, double usage});
}

/// @nodoc
class __$$DailyUsageImplCopyWithImpl<$Res>
    extends _$DailyUsageCopyWithImpl<$Res, _$DailyUsageImpl>
    implements _$$DailyUsageImplCopyWith<$Res> {
  __$$DailyUsageImplCopyWithImpl(
      _$DailyUsageImpl _value, $Res Function(_$DailyUsageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? usage = null,
  }) {
    return _then(_$DailyUsageImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
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
class _$DailyUsageImpl implements _DailyUsage {
  const _$DailyUsageImpl({required this.date, required this.usage});

  factory _$DailyUsageImpl.fromJson(Map<String, dynamic> json) =>
      _$$DailyUsageImplFromJson(json);

  @override
  final DateTime date;
  @override
  final double usage;

  @override
  String toString() {
    return 'DailyUsage(date: $date, usage: $usage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DailyUsageImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.usage, usage) || other.usage == usage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, date, usage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DailyUsageImplCopyWith<_$DailyUsageImpl> get copyWith =>
      __$$DailyUsageImplCopyWithImpl<_$DailyUsageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DailyUsageImplToJson(
      this,
    );
  }
}

abstract class _DailyUsage implements DailyUsage {
  const factory _DailyUsage(
      {required final DateTime date,
      required final double usage}) = _$DailyUsageImpl;

  factory _DailyUsage.fromJson(Map<String, dynamic> json) =
      _$DailyUsageImpl.fromJson;

  @override
  DateTime get date;
  @override
  double get usage;
  @override
  @JsonKey(ignore: true)
  _$$DailyUsageImplCopyWith<_$DailyUsageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
