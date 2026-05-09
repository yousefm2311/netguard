import 'package:equatable/equatable.dart';

class ActivityEvent extends Equatable {
  const ActivityEvent({
    required this.id,
    required this.title,
    required this.description,
    required this.deviceId,
    required this.deviceName,
    required this.category,
    required this.timestampLabel,
    required this.severity,
  });

  final String id;
  final String title;
  final String description;
  final String deviceId;
  final String deviceName;
  final String category;
  final String timestampLabel;
  final String severity;

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        deviceId,
        deviceName,
        category,
        timestampLabel,
        severity,
      ];
}
