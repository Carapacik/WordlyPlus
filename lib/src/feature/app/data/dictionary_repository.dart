import 'dart:ui';

import 'package:wordly/src/feature/app/data/dictionary_datasource.dart';

/// {@template dictionary_datasource}
/// This is used to set and get dictionary.
/// {@endtemplate}
abstract interface class DictionaryRepository {
  /// Set dictionary
  Future<void> setDictionary(Locale dictionary);

  /// Get current dictionary from cache
  Locale? loadDictionaryFromCache();
}

/// {@macro dictionary_datasource}
final class DictionaryRepositoryImpl implements DictionaryRepository {
  /// {@macro dictionary_datasource}
  const DictionaryRepositoryImpl(this._dictionaryDataSource);

  final DictionaryDataSource _dictionaryDataSource;

  @override
  Future<void> setDictionary(Locale dictionary) => _dictionaryDataSource.setDictionary(dictionary);

  @override
  Locale? loadDictionaryFromCache() => _dictionaryDataSource.loadDictionaryFromCache();
}
