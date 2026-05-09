import 'package:equatable/equatable.dart';

class NetworkDevice extends Equatable {
  const NetworkDevice({
    required this.id,
    required this.name,
    required this.ip,
    required this.mac,
    required this.usageGb,
    required this.isBlocked,
    required this.speedLimitMbps,
    required this.quotaGb,
    required this.status,
  });

  final String id;
  final String name;
  final String ip;
  final String mac;
  final double usageGb;
  final bool isBlocked;
  final int speedLimitMbps;
  final int quotaGb;
  final String status;

  NetworkDevice copyWith({
    bool? isBlocked,
    int? speedLimitMbps,
    int? quotaGb,
  }) {
    return NetworkDevice(
      id: id,
      name: name,
      ip: ip,
      mac: mac,
      usageGb: usageGb,
      isBlocked: isBlocked ?? this.isBlocked,
      speedLimitMbps: speedLimitMbps ?? this.speedLimitMbps,
      quotaGb: quotaGb ?? this.quotaGb,
      status: status,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        ip,
        mac,
        usageGb,
        isBlocked,
        speedLimitMbps,
        quotaGb,
        status,
      ];
}
