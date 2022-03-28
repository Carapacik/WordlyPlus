import 'package:isar/isar.dart';
import 'package:wordly/data/models/letter_status.dart';

part 'level_data.g.dart';

@Collection()
class LevelData {
  @Id()
  late int id;
  late String word;
  late List<LetterStatus> letters;
  late bool isCompleted;
}
