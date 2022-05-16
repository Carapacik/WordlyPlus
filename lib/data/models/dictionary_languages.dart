import 'package:isar/isar.dart';
import 'package:wordly/resources/dictionary_en.dart';
import 'package:wordly/resources/dictionary_ru.dart';

enum DictionaryLanguages {
  ru._(2 / 3.5, dictionaryRu),
  en._(2 / 2.8, dictionaryEn);

  const DictionaryLanguages._(this.aspectRatio, this.currentDictionary);

  final double aspectRatio;
  final Map<String, String> currentDictionary;
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
