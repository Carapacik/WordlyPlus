import 'package:isar/isar.dart';
import 'package:wordly/data/models/dictionary_languages.dart';
import 'package:wordly/data/models/locale_languages.dart';

part 'settings_data.g.dart';

@Collection()
class SettingsData {
  SettingsData();

  factory SettingsData.init() {
    return SettingsData()
      ..id = 0
      ..dictionaryLanguage = DictionaryLanguages.en
      ..localeLanguage = LocaleLanguages.en
      ..isDark = false
      ..isHighContrast = false;
  }

  @Id()
  late int id;
  late bool isDark;
  late bool isHighContrast;
  @LocaleLanguagesConverter()
  late LocaleLanguages localeLanguage;
  @DictionaryLanguagesConverter()
  late DictionaryLanguages dictionaryLanguage;
}
