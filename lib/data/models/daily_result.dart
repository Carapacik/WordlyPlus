import 'package:isar/isar.dart';

part 'daily_result.g.dart';

@Collection()
class DailyResult {
  @Id()
  int? id;
  late String dailyWord;
  late bool isWin;
}
