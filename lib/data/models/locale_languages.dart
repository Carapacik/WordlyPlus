import 'dart:ui';

import 'package:isar/isar.dart';

enum LocaleLanguages {
  ru._(Locale('ru')),
  en._(Locale('en'));

  const LocaleLanguages._(this.locale);

  final Locale locale;
  static const List<LocaleLanguages> _values = [ru, en];
}

extension StringExt on String {
  LocaleLanguages get toLocaleLanguage {
    switch (this) {
      case 'ru':
        return LocaleLanguages.ru;
      case 'en':
      default:
        return LocaleLanguages.en;
    }
  }
}

class LocaleLanguagesConverter extends TypeConverter<LocaleLanguages, int> {
  const LocaleLanguagesConverter();

  @override
  LocaleLanguages fromIsar(final int object) => LocaleLanguages.values[object];

  @override
  int toIsar(LocaleLanguages object) => object.index;
}
