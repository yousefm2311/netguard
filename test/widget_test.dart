import 'package:flutter_test/flutter_test.dart';
import 'package:netguard/app/translations/app_translations.dart';

void main() {
  test('translations expose english and arabic app names', () {
    final keys = AppTranslations().keys;

    expect(keys['en']?['app_name'], 'SmartNet Control');
    expect(keys['ar']?['app_name'], 'سمارت نت كنترول');
  });
}
