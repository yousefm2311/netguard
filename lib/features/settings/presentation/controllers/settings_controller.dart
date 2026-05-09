import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  final _themeMode = ThemeMode.light.obs;
  final _locale = const Locale('en').obs;
  final baseUrlController = TextEditingController(text: 'http://192.168.1.1:3000');

  ThemeMode get themeMode => _themeMode.value;
  Locale get locale => _locale.value;

  void toggleTheme() {
    _themeMode.value = _themeMode.value == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    Get.changeThemeMode(_themeMode.value);
  }

  void setThemeMode(ThemeMode mode) {
    _themeMode.value = mode;
    Get.changeThemeMode(mode);
  }

  void changeLanguage(String langCode) {
    _locale.value = Locale(langCode);
    Get.updateLocale(_locale.value);
  }

  void setLocale(Locale locale) {
    _locale.value = locale;
    Get.updateLocale(locale);
  }

  void saveBaseUrl(String url) {
    // In a real app we'd save this to StorageService
    Get.snackbar('Settings Saved', 'API Base URL updated successfully', snackPosition: SnackPosition.BOTTOM);
  }

  @override
  void onClose() {
    baseUrlController.dispose();
    super.onClose();
  }
}
