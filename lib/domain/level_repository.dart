import 'package:wordly/data/collections/level_data.dart';
import 'package:wordly/data/models/dictionary_languages.dart';

abstract class LevelRepository {
  LevelData get levelData;

  Future<void> initLevelData(final DictionaryLanguages dictionaryLanguage);

  Future<void> saveLevelData(final int levelNumber);
}
