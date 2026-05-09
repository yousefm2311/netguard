import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/providers/storage_service.dart';

class SettingsController extends GetxController {
  final StorageService _storageService;

  var isDarkMode = false.obs;
  var currentLanguage = 'en'.obs;

  SettingsController(this._storageService);

  @override
  void onInit() {
    super.onInit();
    loadSettings();
  }

  Future<void> loadSettings() async {
    isDarkMode.value = (await _storageService.getThemeMode()) ?? false;
    Get.changeThemeMode(isDarkMode.value ? ThemeMode.dark : ThemeMode.light);

    currentLanguage.value = (await _storageService.getLanguage()) ?? 'en';
    if (currentLanguage.value == 'ar') {
      Get.updateLocale(const Locale('ar', 'SA'));
    } else {
      Get.updateLocale(const Locale('en', 'US'));
    }
  }

  void toggleTheme(bool value) async {
    isDarkMode.value = value;
    Get.changeThemeMode(value ? ThemeMode.dark : ThemeMode.light);
    await _storageService.saveThemeMode(value);
  }

  void changeLanguage(String langCode) async {
    currentLanguage.value = langCode;
    if (langCode == 'ar') {
      Get.updateLocale(const Locale('ar', 'SA'));
    } else {
      Get.updateLocale(const Locale('en', 'US'));
    }
    await _storageService.saveLanguage(langCode);
  }
}
