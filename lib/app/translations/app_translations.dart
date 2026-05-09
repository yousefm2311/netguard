import 'package:get/get.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'app_name': 'SmartNet Control',
          'subtitle': 'Manage your network smartly',
          'sign_in': 'Sign In',
          // More keys to be added
        },
        'ar_SA': {
          'app_name': 'سمارت نت',
          'subtitle': 'أدر شبكتك بذكاء',
          'sign_in': 'تسجيل الدخول',
          // More keys to be added
        }
      };
}
