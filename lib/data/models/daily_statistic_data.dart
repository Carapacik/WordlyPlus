import 'package:isar/isar.dart';
import 'package:wordly/data/models/attempts.dart';

part 'daily_statistic_data.g.dart';

@Collection()
class DailyStatisticData {
  @Id()
  int? id;
  late int winsNumber;
  late int losesNumber;
  late int currentStreak;
  late Attempts attempts;
}
