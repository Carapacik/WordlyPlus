import 'dart:convert' show json;

import 'package:flutter/services.dart' show rootBundle;

abstract interface class IGameRepository {
  Future<void> init();

  Map<String, String> get ruDictionary;

  Map<String, String> get enDictionary;
}

final class GameRepository implements IGameRepository {
  GameRepository();

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
}
