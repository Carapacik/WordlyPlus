import 'package:isar/isar.dart';
import 'package:wordly/data/models/letter_entering.dart';
import 'package:wordly/data/models/letter_status.dart';

part 'board_data.g.dart';

@Collection()
class BoardData {
  @Id()
  int? id;
  late bool isComplete;
  late List<LetterEntering> lettersState;
  late List<LetterStatus> keyboardState;
}
