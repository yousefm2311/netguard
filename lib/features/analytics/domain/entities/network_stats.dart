import 'package:equatable/equatable.dart';

import '../../../devices/domain/entities/network_device.dart';

class DeviceUsageSlice extends Equatable {
  const DeviceUsageSlice({
    required this.label,
    required this.value,
  });

  final String label;
  final double value;

  @override
  List<Object?> get props => [label, value];
}

class NetworkStats extends Equatable {
  const NetworkStats({
    required this.connectedDevicesCount,
    required this.totalUsageGb,
    required this.topDevice,
    required this.dailyUsageGb,
    required this.deviceComparisonGb,
    required this.alerts,
    required this.isMocked,
  });

  final int connectedDevicesCount;
  final double totalUsageGb;
  final NetworkDevice topDevice;
  final List<double> dailyUsageGb;
  final List<DeviceUsageSlice> deviceComparisonGb;
  final List<String> alerts;
  final bool isMocked;

  @override
  List<Object?> get props => [
        connectedDevicesCount,
        totalUsageGb,
        topDevice,
        dailyUsageGb,
        deviceComparisonGb,
        alerts,
        isMocked,
      ];
}
