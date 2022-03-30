import 'package:flutter/widgets.dart';
import 'package:isar/isar.dart';
import 'package:wordly/resources/dictionary_en.dart';
import 'package:wordly/resources/dictionary_ru.dart';
import 'package:wordly/ui/pages/main/widgets/keyboard_en.dart';
import 'package:wordly/ui/pages/main/widgets/keyboard_ru.dart';

enum DictionaryLanguages { ru, en }

extension DictionaryLanguagesExt on DictionaryLanguages {
  Widget get keyboard {
    switch (this) {
      case DictionaryLanguages.ru:
        return const KeyboardRu();
      case DictionaryLanguages.en:
      default:
        return const KeyboardEn();
    }
  }

  double get aspectRatio {
    switch (this) {
      case DictionaryLanguages.ru:
        return 2 / 3.5;
      case DictionaryLanguages.en:
      default:
        return 2 / 2.8;
    }
  }

  Map<String, String> getCurrentDictionary() {
    switch (this) {
      case DictionaryLanguages.ru:
        return dictionaryRu;
      case DictionaryLanguages.en:
      default:
        return dictionaryEn;
    }
  }
}

extension StringExt on String {
  DictionaryLanguages get toDictionaryLanguage {
    switch (this) {
      case "ru":
        return DictionaryLanguages.ru;
      case "en":
      default:
        return DictionaryLanguages.en;
    }
  }
}

class DictionaryLanguagesConverter
    extends TypeConverter<DictionaryLanguages, int> {
  const DictionaryLanguagesConverter();

  @override
  DictionaryLanguages fromIsar(final int object) {
    return DictionaryLanguages.values[object];
  }

  @override
  int toIsar(DictionaryLanguages object) {
    return object.index;
  }
}
