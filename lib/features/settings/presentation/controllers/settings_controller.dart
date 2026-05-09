import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/network/api_client.dart';
import '../../../../core/storage/app_prefs.dart';

class SettingsController extends GetxController {
  ThemeMode themeMode = AppPrefs.getThemeMode();
  Locale locale = Locale(AppPrefs.getLanguageCode());
  late final TextEditingController baseUrlController;

  @override
  void onInit() {
    super.onInit();
    baseUrlController = TextEditingController(text: AppPrefs.getBaseUrl());
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    themeMode = mode;
    await AppPrefs.setThemeMode(mode);
    update();
  }

  Future<void> setLocale(Locale nextLocale) async {
    locale = nextLocale;
    await AppPrefs.setLanguageCode(nextLocale.languageCode);
    Get.updateLocale(nextLocale);
    update();
  }

  Future<void> saveBaseUrl() async {
    final value = baseUrlController.text.trim();
    if (value.isEmpty) return;
    await AppPrefs.setBaseUrl(value);
    if (Get.isRegistered<ApiClient>()) {
      Get.find<ApiClient>().updateBaseUrl(value);
    }
    Get.snackbar('Saved', 'API base URL updated.');
  }
}
