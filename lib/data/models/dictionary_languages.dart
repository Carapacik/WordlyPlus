import 'package:isar/isar.dart';

enum DictionaryLanguages { ru, en }

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
