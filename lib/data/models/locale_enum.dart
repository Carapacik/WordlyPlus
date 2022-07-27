import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum LocaleEnum {
  ru._(Locale('ru')),
  en._(Locale('en'));

  const LocaleEnum._(this.locale);

  final Locale locale;

  static LocaleEnum get getSystemLocaleByLanguage {
    if (kIsWeb) {
      return LocaleEnum.en;
    }
    return _toLocaleLanguages(Locale(Platform.localeName));
  }
}

LocaleEnum _toLocaleLanguages(Locale locale) {
  if (locale.languageCode.contains('ru')) {
    return LocaleEnum.ru;
  } else if (locale.languageCode.contains('en')) {
    return LocaleEnum.en;
  } else {
    return LocaleEnum.en;
  }
}

extension LocaleInt on int? {
  LocaleEnum get toLocale {
    if (this == null) {
      return LocaleEnum.getSystemLocaleByLanguage;
    }
    return LocaleEnum.values[this!];
  }
}

extension StringExt on String {
  LocaleEnum get toLocale {
    switch (this) {
      case 'ru':
        return LocaleEnum.ru;
      case 'en':
      default:
        return LocaleEnum.en;
    }
  }
}
