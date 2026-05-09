import 'package:equatable/equatable.dart';

class SecuritySettingsState extends Equatable {
  const SecuritySettingsState({
    required this.firewallEnabled,
    required this.macFilteringEnabled,
    required this.intrusionAlertsEnabled,
    required this.autoBlockSuspiciousDevices,
    required this.passwordRotationDays,
  });

  final bool firewallEnabled;
  final bool macFilteringEnabled;
  final bool intrusionAlertsEnabled;
  final bool autoBlockSuspiciousDevices;
  final int passwordRotationDays;

  SecuritySettingsState copyWith({
    bool? firewallEnabled,
    bool? macFilteringEnabled,
    bool? intrusionAlertsEnabled,
    bool? autoBlockSuspiciousDevices,
    int? passwordRotationDays,
  }) {
    return SecuritySettingsState(
      firewallEnabled: firewallEnabled ?? this.firewallEnabled,
      macFilteringEnabled: macFilteringEnabled ?? this.macFilteringEnabled,
      intrusionAlertsEnabled:
          intrusionAlertsEnabled ?? this.intrusionAlertsEnabled,
      autoBlockSuspiciousDevices:
          autoBlockSuspiciousDevices ?? this.autoBlockSuspiciousDevices,
      passwordRotationDays:
          passwordRotationDays ?? this.passwordRotationDays,
    );
  }

  @override
  List<Object?> get props => [
        firewallEnabled,
        macFilteringEnabled,
        intrusionAlertsEnabled,
        autoBlockSuspiciousDevices,
        passwordRotationDays,
      ];
}
