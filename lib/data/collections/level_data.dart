import 'package:isar/isar.dart';

part 'level_data.g.dart';

@Collection()
class LevelData {
  LevelData();

  factory LevelData.init(final int id) {
    return LevelData()
      ..id = id
      ..lastLevel = 1
      ..secretWord = "";
  }

  @Id()
  late int id;
  late int lastLevel;

  // хз зачем это тут
  late String secretWord;
}
