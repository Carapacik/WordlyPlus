import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:wordly/data/collections/board_data.dart';
import 'package:wordly/data/models/dictionary_languages.dart';
import 'package:wordly/domain/board_repository.dart';

class BoardRepositoryImpl implements BoardRepository {
  late BoardData _boardData;

  @override
  BoardData get boardData => _boardData;

  @override
  Future<void> initBoardData({
    required final DictionaryLanguages dictionaryLanguage,
    required final int levelNumber,
  }) async {
    final isar = GetIt.I<Isar>();
    final data = await isar.boardDatas
            .filter()
            .levelNumberEqualTo(levelNumber)
            .languageEqualTo(dictionaryLanguage)
            .findFirst() ??
        BoardData.init(
          language: dictionaryLanguage,
          levelNumber: levelNumber,
        );
    _boardData = data;
  }

  @override
  Future<void> saveBoardData(final BoardData data) async {
    await GetIt.I<Isar>().writeTxn((isar) async {
      _boardData = data;
      await isar.boardDatas.put(_boardData);
    });
  }
}
