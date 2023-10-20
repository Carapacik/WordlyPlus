import 'dart:convert' show json;
import 'dart:math' show Random;
import 'dart:ui' show Locale;

import 'package:flutter/services.dart' show rootBundle;
import 'package:intl/intl.dart';
import 'package:wordly/src/feature/game/data/game_datasource.dart';
import 'package:wordly/src/feature/game/model/saved_result.dart';

abstract interface class IGameRepository {
  Future<void> init();

  Map<String, String> currentDictionary(Locale dictionary);

  String generateSecretWord(Locale dictionary);

  SavedResult? loadDailyFromCache(Locale dictionary, DateTime date);

  Future<void> saveDailyBoard(Locale dictionary, DateTime date, SavedResult savedResult);
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
  Map<String, String> currentDictionary(Locale dictionary) {
    switch (dictionary) {
      case const Locale('ru'):
        return _ruDictionary;
      case const Locale('en'):
        return _enDictionary;
    }
    return _enDictionary;
  }

  String generateSecretWord(Locale dictionary) {
    final currentDict = currentDictionary(dictionary);

    final now = DateTime.now().toUtc();
    final random = Random(now.year * 1000 + now.month * 100 + now.day);
    final index = random.nextInt(currentDict.length);
    return currentDict.keys.elementAt(index);
  }

  @override
  SavedResult? loadDailyFromCache(Locale dictionary, DateTime date) =>
      _gameDataSource.loadDailyFromCache(dictionary.languageCode, DateFormat('dd-MM-yyyy').format(date));

  @override
  Future<void> saveDailyBoard(Locale dictionary, DateTime date, SavedResult savedResult) =>
      _gameDataSource.saveDailyBoard(dictionary.languageCode, DateFormat('dd-MM-yyyy').format(date), savedResult);
}
