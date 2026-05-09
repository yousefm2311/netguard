import '../entities/security_settings_state.dart';

abstract class SecuritySettingsRepository {
  Future<SecuritySettingsState> loadState();

  Future<SecuritySettingsState> saveState(SecuritySettingsState state);
}
