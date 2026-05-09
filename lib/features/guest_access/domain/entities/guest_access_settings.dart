import 'package:equatable/equatable.dart';

class GuestAccessSettings extends Equatable {
  const GuestAccessSettings({
    required this.enabled,
    required this.networkName,
    required this.password,
    required this.quotaGb,
    required this.speedLimitMbps,
    required this.scheduleLabel,
  });

  final bool enabled;
  final String networkName;
  final String password;
  final int quotaGb;
  final int speedLimitMbps;
  final String scheduleLabel;

  GuestAccessSettings copyWith({
    bool? enabled,
    String? networkName,
    String? password,
    int? quotaGb,
    int? speedLimitMbps,
    String? scheduleLabel,
  }) {
    return GuestAccessSettings(
      enabled: enabled ?? this.enabled,
      networkName: networkName ?? this.networkName,
      password: password ?? this.password,
      quotaGb: quotaGb ?? this.quotaGb,
      speedLimitMbps: speedLimitMbps ?? this.speedLimitMbps,
      scheduleLabel: scheduleLabel ?? this.scheduleLabel,
    );
  }

  @override
  List<Object?> get props => [
        enabled,
        networkName,
        password,
        quotaGb,
        speedLimitMbps,
        scheduleLabel,
      ];
}
