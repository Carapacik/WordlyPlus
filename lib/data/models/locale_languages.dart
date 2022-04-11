import 'dart:ui';

import 'package:isar/isar.dart';

enum LocaleLanguages { ru, en }

extension LocaleLanguagesExt on LocaleLanguages {
  Locale get locale {
    switch (this) {
      case LocaleLanguages.ru:
        return const Locale('ru');
      case LocaleLanguages.en:
        return const Locale('en');
    }
  }
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
