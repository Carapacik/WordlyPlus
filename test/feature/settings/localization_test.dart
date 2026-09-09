import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:wordly/src/localization/localization.dart';

void main() {
  test('regional locales resolve to supported languages', () {
    expect(Localization.resolve(const Locale('ru', 'RU')), const Locale('ru'));
    expect(Localization.resolve(const Locale('en', 'GB')), const Locale('en'));
    expect(Localization.resolve(const Locale('de', 'DE')), Localization.fallbackLocale);
  });

  testWidgets('device locale is normalized for the default dictionary', (tester) async {
    tester.platformDispatcher.localeTestValue = const Locale('ru', 'RU');
    addTearDown(tester.platformDispatcher.clearLocaleTestValue);
    expect(Localization.deviceLocale, const Locale('ru'));
    expect(Localization.supportedDictionaryLocales, contains(Localization.deviceLocale));
  });
}
