import 'package:equatable/equatable.dart';
import 'package:isar/isar.dart';
import 'package:wordly/data/models/dictionary_languages.dart';
import 'package:wordly/data/models/letter_status.dart';

part 'board_data.g.dart';

@Collection()
class BoardData extends Equatable {
  BoardData();

  factory BoardData.init({
    required final DictionaryLanguages language,
    required final int levelNumber,
  }) {
    return BoardData()
      ..isComplete = false
      ..secretWord = ''
      ..levelNumber = levelNumber
      ..language = language
      ..lettersState = ['']
      ..keyboardLetters = []
      ..keyboardLetterStatuses = [];
  }

  @Id()
  int? id;
  late bool isComplete;
  late String secretWord;
  @Index()
  late int levelNumber;
  @Index()
  @DictionaryLanguagesConverter()
  late DictionaryLanguages language;
  late List<String> lettersState;
  late List<String> keyboardLetters;
  late List<int> keyboardLetterStatuses;

  // final keyboardState = IsarLinks<LetterEntering>();

  static List<String> toListString(Map<String, LetterStatus> map) {
    return map.entries.map((element) => element.key).toList();
  }

  static List<int> toListLetterStatus(Map<String, LetterStatus> map) {
    return map.entries.map((element) => element.value.index).toList();
  }

  Map<String, LetterStatus> toMap() {
    return {
      for (var i = 0; i < keyboardLetters.length; i++)
        keyboardLetters[i]: LetterStatus.values[keyboardLetterStatuses[i]]
    };
  }

  @override
  List<Object?> get props => [id, levelNumber, language];
}
