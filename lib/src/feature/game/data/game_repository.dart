import 'dart:convert' show json;
import 'dart:ui';

import 'package:flutter/services.dart' show rootBundle;
import 'package:intl/intl.dart';
import 'package:wordly/src/feature/game/data/game_datasource.dart';
import 'package:wordly/src/feature/game/model/letter_info.dart';

abstract interface class IGameRepository {
  Future<void> init();

  Map<String, String> currentDictionary(Locale dictionary);

  Map<String, String> get ruDictionary;

  Map<String, String> get enDictionary;

  List<LetterInfo>? loadDailyFromCache(Locale dictionary, DateTime date);

  Future<void> saveDailyBoard(Locale dictionary, List<LetterInfo> board, DateTime date);
}

final class GameRepository implements IGameRepository {
  GameRepository({required GameDataSource gameDataSource}) : _gameDataSource = gameDataSource;

  final GameDataSource _gameDataSource;

  late final Map<String, String> _ruDictionary;
  late final Map<String, String> _enDictionary;

  @override
  Future<void> init() async {
    final rawDictionaryRu =
        await rootBundle.loadString('assets/dictionary/ru.json').then(json.decode) as Map<String, dynamic>;
    _ruDictionary = rawDictionaryRu.map((key, value) => MapEntry(key, value.toString()));
    final rawDictionaryEn =
        await rootBundle.loadString('assets/dictionary/en.json').then(json.decode) as Map<String, dynamic>;
    _enDictionary = rawDictionaryEn.map((key, value) => MapEntry(key, value.toString()));
  }

  @override
  Map<String, String> get enDictionary => _enDictionary;

  @override
  Map<String, String> get ruDictionary => _ruDictionary;

  @override
  Map<String, String> currentDictionary(Locale dictionary) {
    switch (dictionary) {
      case const Locale('ru'):
        return _ruDictionary;
      case const Locale('en'):
        return _enDictionary;
    }
    return _enDictionary;
  }

  @override
  List<LetterInfo>? loadDailyFromCache(Locale dictionary, DateTime date) =>
      _gameDataSource.loadDailyFromCache(dictionary.languageCode, DateFormat('dd-MM-yyyy').format(date));

  @override
  Future<void> saveDailyBoard(Locale dictionary, List<LetterInfo> board, DateTime date) =>
      _gameDataSource.saveDailyBoard(dictionary.languageCode, DateFormat('dd-MM-yyyy').format(date), board);
}
