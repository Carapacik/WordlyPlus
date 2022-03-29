import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:wordly/data/models/board_data.dart';
import 'package:wordly/data/models/dictionary_languages.dart';
import 'package:wordly/data/models/letter_entering.dart';
import 'package:wordly/domain/board_repository.dart';

class BoardRepositoryImpl implements BoardRepository {
  late BoardData _boardData;

  @override
  BoardData get boardData => _boardData;

  @override
  Future<void> initBoardData(
    final DictionaryLanguages dictionaryLanguage,
  ) async {
    final isar = GetIt.I<Isar>();
    final letterEntering = await isar.letterEnterings
        .filter()
        .languageEqualTo(dictionaryLanguage)
        .findAll();
    final boardData = await isar.boardDatas.get(dictionaryLanguage.index) ??
        BoardData.init(dictionaryLanguage.index);
    _boardData = (boardData..keyboardState = letterEntering);
  }

  @override
  Future<void> saveBoardData(final BoardData data) async {
    await GetIt.I<Isar>().writeTxn((isar) async {
      _boardData = data;
      await isar.boardDatas.put(_boardData);
    });
  }
}
