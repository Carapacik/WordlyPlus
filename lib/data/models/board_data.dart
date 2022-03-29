import 'package:isar/isar.dart';
import 'package:wordly/data/models/dictionary_languages.dart';
import 'package:wordly/data/models/letter_entering.dart';
import 'package:wordly/data/models/letter_status.dart';

part 'board_data.g.dart';

@Collection()
class BoardData {
  BoardData();

  factory BoardData.init(int id) {
    return BoardData()
      ..id = id
      ..isComplete = false
      ..secretWord = ""
      ..lettersState = []
      ..keyboardState = [];
  }

  @Id()
  int? id;
  late bool isComplete;
  late String secretWord;
  late List<String> lettersState;
  late List<LetterEntering> keyboardState;

  static List<LetterEntering> fromMap(
    Map<String, LetterStatus> map,
    DictionaryLanguages language,
  ) {
    return map.entries
        .map(
          (element) => LetterEntering()
            ..language = language
            ..letter = element.key
            ..letterStatus = element.value,
        )
        .toList();
  }

  Map<String, LetterStatus> toMap(
    DictionaryLanguages language,
  ) {
    return {
      for (var element in keyboardState) element.letter: element.letterStatus
    };
  }
}
