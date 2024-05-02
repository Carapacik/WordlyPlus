import 'dart:ui';

import 'package:wordly/src/feature/settings/data/dictionary_datasource.dart';

/// Repository that manages dictionary information
abstract interface class DictionaryRepository {
  /// Get dictionary
  Future<Locale?> getDictionary();

  /// Set dictionary
  Future<void> setDictionary(Locale dictionary);
}

/// Dictionary repository implementation
final class DictionaryRepositoryImpl implements DictionaryRepository {
  /// Create dictionary repository
  const DictionaryRepositoryImpl({required DictionaryDataSource dictionaryDataSource})
      : _dictionaryDataSource = dictionaryDataSource;

  final DictionaryDataSource _dictionaryDataSource;

  @override
  Future<Locale?> getDictionary() => _dictionaryDataSource.getDictionary();

  @override
  Future<void> setDictionary(Locale dictionary) => _dictionaryDataSource.setDictionary(dictionary);
}
