import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  final _secureStorage = const FlutterSecureStorage();
  late final SharedPreferences _prefs;

  Future<StorageService> init() async {
    _prefs = await SharedPreferences.getInstance();
    return this;
  }

  // --- Secure Storage (Tokens, Secrets) ---
  Future<void> saveToken(String token) async {
    await _secureStorage.write(key: 'auth_token', value: token);
  }

  Future<String?> getToken() async {
    return await _secureStorage.read(key: 'auth_token');
  }

  Future<void> clearToken() async {
    await _secureStorage.delete(key: 'auth_token');
  }

  // --- Shared Preferences (Settings, Preferences) ---
  Future<void> saveLanguage(String langCode) async {
    await _prefs.setString('language', langCode);
  }

  String getLanguage() {
    return _prefs.getString('language') ?? 'en';
  }

  Future<void> saveThemeMode(bool isDark) async {
    await _prefs.setBool('is_dark_mode', isDark);
  }

  bool isDarkMode() {
    return _prefs.getBool('is_dark_mode') ?? false;
  }
  
  Future<void> saveApiBaseUrl(String url) async {
    await _prefs.setString('api_base_url', url);
  }
}
