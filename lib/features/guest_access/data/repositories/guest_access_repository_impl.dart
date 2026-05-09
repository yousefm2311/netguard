import 'dart:convert';

import '../../../../core/mock/mock_backend.dart';
import '../../../../core/storage/app_prefs.dart';
import '../../domain/entities/guest_access_settings.dart';
import '../../domain/repositories/guest_access_repository.dart';

class GuestAccessRepositoryImpl implements GuestAccessRepository {
  static const _prefsKey = 'guest_access_settings';

  @override
  Future<GuestAccessSettings> loadSettings() async {
    final raw = AppPrefs.getString(_prefsKey);
    if (raw == null || raw.isEmpty) {
      return MockBackend.guestAccessSettings();
    }
    final data = jsonDecode(raw) as Map<String, dynamic>;
    return GuestAccessSettings(
      enabled: data['enabled'] == true,
      networkName: data['networkName'].toString(),
      password: data['password'].toString(),
      quotaGb: (data['quotaGb'] as num).toInt(),
      speedLimitMbps: (data['speedLimitMbps'] as num).toInt(),
      scheduleLabel: data['scheduleLabel'].toString(),
    );
  }

  @override
  Future<GuestAccessSettings> saveSettings(GuestAccessSettings settings) async {
    await AppPrefs.setString(
      _prefsKey,
      jsonEncode({
        'enabled': settings.enabled,
        'networkName': settings.networkName,
        'password': settings.password,
        'quotaGb': settings.quotaGb,
        'speedLimitMbps': settings.speedLimitMbps,
        'scheduleLabel': settings.scheduleLabel,
      }),
    );
    return settings;
  }
}
