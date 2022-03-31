import 'package:wordly/data/models/board_data.dart';
import 'package:wordly/data/models/dictionary_languages.dart';

abstract class BoardRepository {
  BoardData get boardData;

  Future<void> initBoardData(final DictionaryLanguages dictionaryLanguage);

  Future<void> saveBoardData(final BoardData data);
}
