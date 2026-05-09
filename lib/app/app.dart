import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

import '../features/settings/presentation/controllers/settings_controller.dart';
import 'bindings/initial_binding.dart';
import 'routes/app_pages.dart';
import 'theme/app_theme.dart';
import 'translations/app_translations.dart';

class SmartNetControlApp extends StatelessWidget {
  const SmartNetControlApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingsController>(
      init: Get.put(SettingsController(), permanent: true),
      builder: (settingsController) {
        return GetMaterialApp(
          title: 'SmartNet Control',
          debugShowCheckedModeBanner: false,
          initialBinding: InitialBinding(),
          initialRoute: AppPages.root,
          getPages: AppPages.pages,
          theme: AppTheme.light(),
          darkTheme: AppTheme.dark(),
          themeMode: settingsController.themeMode,
          locale: settingsController.locale,
          fallbackLocale: const Locale('en'),
          translations: AppTranslations(),
          supportedLocales: const [
            Locale('en'),
            Locale('ar'),
          ],
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          builder: (context, child) {
            final isArabic = settingsController.locale.languageCode == 'ar';
            return Directionality(
              textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
              child: child ?? const SizedBox.shrink(),
            );
          },
        );
      },
    );
  }
}
