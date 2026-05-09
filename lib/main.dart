import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';
import 'app/themes/app_theme.dart';
import 'app/translations/app_translations.dart';
import 'app/bindings/initial_binding.dart';
import 'core/storage/storage_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  final storageService = await StorageService().init();
  Get.put(storageService, permanent: true);

  runApp(const SmartNetApp());
}

class SmartNetApp extends StatelessWidget {
  const SmartNetApp({super.key});

  @override
  Widget build(BuildContext context) {
    final storage = Get.find<StorageService>();
    final isDark = storage.isDarkMode();
    final lang = storage.getLanguage();

    return GetMaterialApp(
      title: 'SmartNet Control',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
      translations: AppTranslations(),
      locale: Locale(lang),
      fallbackLocale: const Locale('en', 'US'),
      initialBinding: InitialBinding(),
      // initialRoute: AppRoutes.login, // Will be set in Phase 3
      getPages: AppPages.pages,
      home: const Scaffold(
        body: Center(child: Text('SmartNet Architecture V3 Setup Complete')),
      ),
    );
  }
}
