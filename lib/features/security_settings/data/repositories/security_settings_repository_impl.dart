import 'dart:convert';

import '../../../../core/mock/mock_backend.dart';
import '../../../../core/storage/app_prefs.dart';
import '../../domain/entities/security_settings_state.dart';
import '../../domain/repositories/security_settings_repository.dart';

class SecuritySettingsRepositoryImpl
    implements SecuritySettingsRepository {
  static const _prefsKey = 'security_settings_state';

  @override
  Future<SecuritySettingsState> loadState() async {
    final raw = AppPrefs.getString(_prefsKey);
    if (raw == null || raw.isEmpty) {
      return MockBackend.securitySettingsState();
    }
    final data = jsonDecode(raw) as Map<String, dynamic>;
    return SecuritySettingsState(
      firewallEnabled: data['firewallEnabled'] == true,
      macFilteringEnabled: data['macFilteringEnabled'] == true,
      intrusionAlertsEnabled: data['intrusionAlertsEnabled'] == true,
      autoBlockSuspiciousDevices: data['autoBlockSuspiciousDevices'] == true,
      passwordRotationDays: (data['passwordRotationDays'] as num).toInt(),
    );
  }

  @override
  Future<SecuritySettingsState> saveState(SecuritySettingsState state) async {
    await AppPrefs.setString(
      _prefsKey,
      jsonEncode({
        'firewallEnabled': state.firewallEnabled,
        'macFilteringEnabled': state.macFilteringEnabled,
        'intrusionAlertsEnabled': state.intrusionAlertsEnabled,
        'autoBlockSuspiciousDevices': state.autoBlockSuspiciousDevices,
        'passwordRotationDays': state.passwordRotationDays,
      }),
    );
    return state;
  }
}
