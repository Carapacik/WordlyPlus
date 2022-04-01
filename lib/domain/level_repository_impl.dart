import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:wordly/data/collections/level_data.dart';
import 'package:wordly/data/models/dictionary_languages.dart';
import 'package:wordly/domain/level_repository.dart';

class LevelRepositoryImpl implements LevelRepository {
  late LevelData _levelData;

  @override
  LevelData get levelData => _levelData;

  @override
  Future<void> initLevelData(DictionaryLanguages language) async {
    final result = await GetIt.I<Isar>().levelDatas.get(language.index);
    _levelData = result ?? LevelData.init(language.index);
  }

  @override
  Future<void> saveLevelData(final int levelNumber) async {
    final data = LevelData()
      ..id = _levelData.id
      ..lastLevel = levelNumber
      ..secretWord = _levelData.secretWord;

    await GetIt.I<Isar>().writeTxn((isar) async {
      _levelData = data;
      await isar.levelDatas.put(_levelData);
    });
  }
}
