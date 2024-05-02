import 'dart:ui';

import 'package:wordly/src/core/utils/preferences_dao.dart';

/// {@template dictionary_datasource}
/// [DictionaryDataSource] is an entry point to the dictionary data layer.
///
/// This is used to set and get dictionary.
/// {@endtemplate}
abstract interface class DictionaryDataSource {
  /// Set dictionary
  Future<void> setDictionary(Locale dictionary);

  /// Get current dictionary from cache
  Future<Locale?> getDictionary();
}

/// {@macro dictionary_datasource}
final class DictionaryDataSourceLocal extends PreferencesDao implements DictionaryDataSource {
  /// {@macro dictionary_datasource}
  const DictionaryDataSourceLocal({required super.sharedPreferences});

  PreferencesEntry<String> get _dictionary => stringEntry('settings.dictionary');

  @override
  Future<void> setDictionary(Locale dictionary) async {
    await _dictionary.set(dictionary.languageCode);
  }

  @override
  Future<Locale?> getDictionary() async {
    final languageCode = _dictionary.read();

    if (languageCode == null) {
      return null;
    }

    return Locale.fromSubtags(languageCode: languageCode);
  }
}
