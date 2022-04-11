import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wordly/data/models/dictionary_languages.dart';
import 'package:wordly/data/models/locale_languages.dart';

LocaleLanguages getSystemLocaleLanguage() {
  if (kIsWeb) {
    return LocaleLanguages.en;
  }
  return _toLocaleLanguages(Locale(Platform.localeName));
}

DictionaryLanguages getSystemDictionaryLanguage() {
  if (kIsWeb) {
    return DictionaryLanguages.en;
  }
  return _toDictionaryLanguage(Locale(Platform.localeName));
}

LocaleLanguages _toLocaleLanguages(Locale locale) {
  if (locale.languageCode.contains('ru')) {
    return LocaleLanguages.ru;
  } else if (locale.languageCode.contains('en')) {
    return LocaleLanguages.en;
  } else {
    return LocaleLanguages.en;
  }
}

DictionaryLanguages _toDictionaryLanguage(Locale locale) {
  if (locale.languageCode.contains('ru')) {
    return DictionaryLanguages.ru;
  } else if (locale.languageCode.contains('en')) {
    return DictionaryLanguages.en;
  } else {
    return DictionaryLanguages.en;
  }
}
