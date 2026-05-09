import '../entities/guest_access_settings.dart';

abstract class GuestAccessRepository {
  Future<GuestAccessSettings> loadSettings();

  Future<GuestAccessSettings> saveSettings(GuestAccessSettings settings);
}
