import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wordly/resources/dictionary_en.dart';
import 'package:wordly/resources/dictionary_ru.dart';

enum DictionaryEnum {
  ru._(2 / 3.4, dictionaryRu),
  en._(2 / 2.7, dictionaryEn);

  const DictionaryEnum._(this.aspectRatio, this.currentDictionary);

  final double aspectRatio;
  final Map<String, String> currentDictionary;

  static DictionaryEnum get dictionaryBySystemLocale {
    if (kIsWeb) {
      return DictionaryEnum.en;
    }
    return _toDictionaryLanguage(Locale(Platform.localeName));
  }
}

DictionaryEnum _toDictionaryLanguage(Locale locale) {
  if (locale.languageCode.contains('ru')) {
    return DictionaryEnum.ru;
  } else if (locale.languageCode.contains('en')) {
    return DictionaryEnum.en;
  }
  return DictionaryEnum.en;
}

extension DictionaryInt on int? {
  DictionaryEnum get toDictionary {
    if (this == null) {
      return DictionaryEnum.dictionaryBySystemLocale;
    }
    return DictionaryEnum.values[this!];
  }
}

extension StringExt on String {
  DictionaryEnum get toDictionary {
    switch (this) {
      case 'ru':
        return DictionaryEnum.ru;
      case 'en':
      default:
        return DictionaryEnum.en;
    }
  }
}
