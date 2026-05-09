import 'package:get/get.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'login': 'Login',
          'email': 'Email',
          'password': 'Password',
          'dashboard': 'Dashboard',
          'devices': 'Devices',
          'analytics': 'Analytics',
          'settings': 'Settings',
          'router_profile': 'Router Profile',
          'connected_devices': 'Connected Devices',
          'total_usage': 'Total Usage',
          'top_device': 'Top Device',
          'block_device': 'Block Device',
          'limit_speed': 'Limit Speed',
          'set_quota': 'Set Quota',
          'dark_mode': 'Dark Mode',
          'language': 'Language',
          'detect_router': 'Detect Router',
          'download_profile': 'Download Profile',
        },
        'ar_SA': {
          'login': 'تسجيل الدخول',
          'email': 'البريد الإلكتروني',
          'password': 'كلمة المرور',
          'dashboard': 'لوحة القيادة',
          'devices': 'الأجهزة',
          'analytics': 'التحليلات',
          'settings': 'الإعدادات',
          'router_profile': 'ملف تعريف الراوتر',
          'connected_devices': 'الأجهزة المتصلة',
          'total_usage': 'إجمالي الاستخدام',
          'top_device': 'أعلى جهاز استخداماً',
          'block_device': 'حظر الجهاز',
          'limit_speed': 'تحديد السرعة',
          'set_quota': 'تحديد الحصة',
          'dark_mode': 'الوضع الداكن',
          'language': 'اللغة',
          'detect_router': 'اكتشاف الراوتر',
          'download_profile': 'تحميل ملف التعريف',
        }
      };
}
