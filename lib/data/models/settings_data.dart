import 'package:isar/isar.dart';
import 'package:wordly/data/models/dictionary_languages.dart';
import 'package:wordly/data/models/locale_languages.dart';

part 'settings_data.g.dart';

@Collection()
class SettingsData {
  @Id()
  int? id;
  late bool isDark;
  late bool isHighContrast;
  late LocaleLanguages localeLanguage;
  late DictionaryLanguages dictionaryLanguage;
}
