import 'package:isar/isar.dart';
import 'package:wordly/data/models/letter_status.dart';

part 'letter_entering.g.dart';

@Collection()
class LetterEntering {
  @Id()
  late int id;
  late LetterStatus letterStatus;
  late String letter;
}
