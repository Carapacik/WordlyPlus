import 'package:isar/isar.dart';
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
      ..keyboardState = {}
      ..secretWord = ""
      ..lettersState = [];
  }

  @Id()
  int? id;
  late bool isComplete;
  late String secretWord;
  late List<String> lettersState;
  late Map<String, LetterStatus> keyboardState;
}
