import 'package:shared_preferences/shared_preferences.dart';
import 'package:wordly/data/models/dictionary_enum.dart';
import 'package:wordly/data/models/locale_enum.dart';

class SaveSettingsService {
  SaveSettingsService();

  static const _secondLaunchKey = 'second_launch_key';
  static const _isDarkKey = 'is_dark_key';
  static const _isHighContrastKey = 'is_high_contrast_key';
  static const _dictionaryKey = 'dictionary_key';
  static const _localeKey = 'locale_key';

  Future<void> saveDark({required bool value}) async {
    final sp = await SharedPreferences.getInstance();
    await sp.setBool(_isDarkKey, value);
  }

  Future<bool> getDark() async {
    final sp = await SharedPreferences.getInstance();
    return sp.getBool(_isDarkKey) ?? false;
  }

  Future<void> saveHighContrast({required bool value}) async {
    final sp = await SharedPreferences.getInstance();
    await sp.setBool(_isHighContrastKey, value);
  }

  Future<bool> getHighContrast() async {
    final sp = await SharedPreferences.getInstance();
    return sp.getBool(_isHighContrastKey) ?? false;
  }

  Future<void> saveDictionary(DictionaryEnum value) async {
    final sp = await SharedPreferences.getInstance();
    await sp.setInt(_dictionaryKey, value.index);
  }

  Future<DictionaryEnum> getDictionary() async {
    final sp = await SharedPreferences.getInstance();
    return sp.getInt(_dictionaryKey).toDictionary;
  }

  Future<void> saveLocale(LocaleEnum value) async {
    final sp = await SharedPreferences.getInstance();
    await sp.setInt(_localeKey, value.index);
  }

  Future<LocaleEnum> getLocale() async {
    final sp = await SharedPreferences.getInstance();
    return sp.getInt(_localeKey).toLocale;
  }

  Future<bool> isSecondLaunch() async {
    final sp = await SharedPreferences.getInstance();
    final isSecondLaunch = sp.getBool(_secondLaunchKey) ?? false;
    await sp.setBool(_secondLaunchKey, true);
    return isSecondLaunch;
  }
}
