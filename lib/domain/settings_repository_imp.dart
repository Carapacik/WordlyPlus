import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:wordly/data/models/dictionary_languages.dart';
import 'package:wordly/data/models/locale_languages.dart';
import 'package:wordly/data/models/settings_data.dart';
import 'package:wordly/domain/settings_repository.dart';

class SettingsRepositoryImp implements SettingsRepository {
  late SettingsData _settingsData;

  @override
  SettingsData get settingsData => _settingsData;

  @override
  Future<void> initSettings() async {
    final result = await GetIt.I<Isar>().settingsDatas.get(0);
    _settingsData = result ??
        (SettingsData()
          ..id = 0
          ..dictionaryLanguage = DictionaryLanguages.en
          ..localeLanguage = LocaleLanguages.en
          ..isDark = false
          ..isHighContrast = false);
  }

  @override
  Future<void> saveSettings(SettingsData data) async {
    await GetIt.I<Isar>().writeTxn((isar) async {
      _settingsData = data;
      await isar.settingsDatas.put(data);
    });
  }
}
