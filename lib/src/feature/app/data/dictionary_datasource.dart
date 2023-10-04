import 'dart:ui';

import 'package:shared_preferences/shared_preferences.dart';

/// {@template dictionary_datasource}
/// [DictionaryDataSource] is an entry point to the dictionary data layer.
///
/// This is used to set and get dictionary.
/// {@endtemplate}
abstract interface class DictionaryDataSource {
  /// Set dictionary
  Future<void> setDictionary(Locale dictionary);

  /// Get current dictionary from cache
  Locale? loadDictionaryFromCache();
}

/// {@macro dictionary_datasource}
final class DictionaryDataSourceImpl implements DictionaryDataSource {
  /// {@macro dictionary_datasource}
  const DictionaryDataSourceImpl({
    required SharedPreferences sharedPreferences,
  }) : _sharedPreferences = sharedPreferences;
  final SharedPreferences _sharedPreferences;

  static const _prefix = 'dictionary';

  @override
  Future<void> setDictionary(Locale dictionary) async {
    await _sharedPreferences.setString(
      '$_prefix.dictionary',
      dictionary.toString(),
    );

    return;
  }

  @override
  Locale? loadDictionaryFromCache() {
    final dictionary = _sharedPreferences.getString('$_prefix.dictionary');

    if (dictionary != null) {
      final dictionaryParts = dictionary.split('_');
      return Locale.fromSubtags(
        languageCode: dictionaryParts[0],
        countryCode: dictionaryParts.length > 1 ? dictionaryParts[1] : null,
      );
    }

    return null;
  }
}
