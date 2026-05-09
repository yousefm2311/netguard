import 'package:equatable/equatable.dart';

class RouterProfile extends Equatable {
  const RouterProfile({
    required this.model,
    required this.firmwareVersion,
    required this.supportsQuota,
    required this.supportsSpeedLimit,
    required this.downloadedAt,
    required this.rawProfileJson,
  });

  final String model;
  final String firmwareVersion;
  final bool supportsQuota;
  final bool supportsSpeedLimit;
  final String downloadedAt;
  final String rawProfileJson;

  @override
  List<Object?> get props => [
        model,
        firmwareVersion,
        supportsQuota,
        supportsSpeedLimit,
        downloadedAt,
        rawProfileJson,
      ];
}
