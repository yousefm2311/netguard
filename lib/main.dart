import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'core/routes/app_routes.dart';
import 'core/theme/app_theme.dart';
import 'core/translations/app_translations.dart';
import 'core/bindings/app_bindings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  
  runApp(const SmartNetApp());
}

class SmartNetApp extends StatelessWidget {
  const SmartNetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'SmartNet Control',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system, // Will implement a toggle later
      translations: AppTranslations(),
      locale: const Locale('en', 'US'), // Default locale
      fallbackLocale: const Locale('en', 'US'),
      initialBinding: AppBindings(),
      initialRoute: AppRoutes.login,
      getPages: AppRoutes.pages,
    );
  }
}
