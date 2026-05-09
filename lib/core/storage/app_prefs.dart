import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppPrefs {
  static late SharedPreferences _prefs;

  static const _themeKey = 'theme_mode';
  static const _languageKey = 'language_code';
  static const _routerProfileKey = 'router_profile_cache';
  static const _baseUrlKey = 'base_url';

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static ThemeMode getThemeMode() {
    switch (_prefs.getString(_themeKey)) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }

  static Future<void> setThemeMode(ThemeMode mode) async {
    final value = switch (mode) {
      ThemeMode.light => 'light',
      ThemeMode.dark => 'dark',
      ThemeMode.system => 'system',
    };
    await _prefs.setString(_themeKey, value);
  }

  static String getLanguageCode() => _prefs.getString(_languageKey) ?? 'en';

  static Future<void> setLanguageCode(String code) async {
    await _prefs.setString(_languageKey, code);
  }

  static String? getRouterProfileCache() => _prefs.getString(_routerProfileKey);

  static Future<void> setRouterProfileCache(String value) async {
    await _prefs.setString(_routerProfileKey, value);
  }

  static String getBaseUrl() =>
      _prefs.getString(_baseUrlKey) ?? 'https://api.smartnetcontrol.dev';

  static Future<void> setBaseUrl(String value) async {
    await _prefs.setString(_baseUrlKey, value);
  }

  static String? getString(String key) => _prefs.getString(key);

  static Future<void> setString(String key, String value) async {
    await _prefs.setString(key, value);
  }

  static bool getBool(String key, {bool fallback = false}) =>
      _prefs.getBool(key) ?? fallback;

  static Future<void> setBool(String key, bool value) async {
    await _prefs.setBool(key, value);
  }

  static int getInt(String key, {int fallback = 0}) =>
      _prefs.getInt(key) ?? fallback;

  static Future<void> setInt(String key, int value) async {
    await _prefs.setInt(key, value);
  }
}
