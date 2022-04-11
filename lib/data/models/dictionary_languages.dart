import 'package:isar/isar.dart';
import 'package:wordly/resources/dictionary_en.dart';
import 'package:wordly/resources/dictionary_ru.dart';

enum DictionaryLanguages { ru, en }

extension DictionaryLanguagesExt on DictionaryLanguages {
  double get aspectRatio {
    switch (this) {
      case DictionaryLanguages.ru:
        return 2 / 3.5;
      case DictionaryLanguages.en:
        return 2 / 2.8;
    }
  }

  Map<String, String> getCurrentDictionary() {
    switch (this) {
      case DictionaryLanguages.ru:
        return dictionaryRu;
      case DictionaryLanguages.en:
        return dictionaryEn;
    }
  }
}

extension StringExt on String {
  DictionaryLanguages get toDictionaryLanguage {
    switch (this) {
      case 'ru':
        return DictionaryLanguages.ru;
      case 'en':
      default:
        return DictionaryLanguages.en;
    }
  }
}

class DictionaryLanguagesConverter
    extends TypeConverter<DictionaryLanguages, int> {
  const DictionaryLanguagesConverter();

  @override
  DictionaryLanguages fromIsar(final int object) =>
      DictionaryLanguages.values[object];

  @override
  int toIsar(DictionaryLanguages object) => object.index;
}
