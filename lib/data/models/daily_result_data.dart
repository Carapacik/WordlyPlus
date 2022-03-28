import 'package:isar/isar.dart';

part 'daily_result_data.g.dart';

@Collection()
class DailyResultData {
  @Id()
  late int id;
  late String dailyWord;
  late bool isWin;
}
