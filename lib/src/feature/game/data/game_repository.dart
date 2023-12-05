import 'dart:convert' show json;
import 'dart:math' show Random;
import 'dart:ui' show Locale;

import 'package:flutter/services.dart' show rootBundle;
import 'package:intl/intl.dart' show DateFormat;
import 'package:wordly/src/core/assets/generated/assets.gen.dart';
import 'package:wordly/src/core/utils/logger.dart';
import 'package:wordly/src/feature/game/data/game_datasource.dart';
import 'package:wordly/src/feature/game/model/game_result.dart';

abstract interface class IGameRepository {
  Future<void> init();

  bool get isFirstEnter;

  Future<void> saveFirstEnter();

  Map<String, String> currentDictionary(Locale dictionary);

  String generateSecretWord(Locale dictionary, {int levelNumber = 0});

  GameResult? loadDailyFromCache(Locale dictionary, DateTime date);

  Future<void> saveDailyBoard(Locale dictionary, DateTime date, GameResult savedResult);

  GameResult? loadLvlFromCache(Locale dictionary);

  Future<void> saveLvlBoard(Locale dictionary, GameResult savedResult);
}

final class GameRepository implements IGameRepository {
  GameRepository({required GameDataSource gameDataSource}) : _gameDataSource = gameDataSource;

  final GameDataSource _gameDataSource;

  late final Map<String, String> _ruDictionary;
  late final Map<String, String> _enDictionary;

  @override
  Future<void> init() async {
    final rawDictionaryRu = await rootBundle.loadString(Assets.dictionary.ru).then(json.decode) as Map<String, dynamic>;
    _ruDictionary = rawDictionaryRu.map((key, value) => MapEntry(key, value.toString()));
    final rawDictionaryEn = await rootBundle.loadString(Assets.dictionary.en).then(json.decode) as Map<String, dynamic>;
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

  @override
  String generateSecretWord(Locale dictionary, {int levelNumber = 0}) {
    final currentDict = currentDictionary(dictionary);
    int index;
    if (levelNumber == 0) {
      final now = DateTime.now().toUtc();
      final random = Random(now.year * 1000 + now.month * 100 + now.day);
      index = random.nextInt(currentDict.length);
    } else {
      index = Random(levelNumber).nextInt(currentDict.length);
    }
    final word = currentDict.keys.elementAt(index);
    logger.info('Secret word: $word');
    return word;
  }

  @override
  GameResult? loadDailyFromCache(Locale dictionary, DateTime date) =>
      _gameDataSource.loadDailyFromCache(dictionary.languageCode, DateFormat('dd-MM-yyyy').format(date));

  @override
  Future<void> saveDailyBoard(Locale dictionary, DateTime date, GameResult savedResult) =>
      _gameDataSource.saveDailyBoard(dictionary.languageCode, DateFormat('dd-MM-yyyy').format(date), savedResult);

  @override
  GameResult? loadLvlFromCache(Locale dictionary) => _gameDataSource.loadLvlFromCache(dictionary.languageCode);

  @override
  Future<void> saveLvlBoard(Locale dictionary, GameResult savedResult) =>
      _gameDataSource.saveLvlBoard(dictionary.languageCode, savedResult);

  @override
  bool get isFirstEnter => _gameDataSource.isFirstEnter;

  @override
  Future<void> saveFirstEnter() => _gameDataSource.saveFirstEnter();
}
