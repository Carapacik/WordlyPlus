import 'package:isar/isar.dart';
import 'package:wordly/data/models/attempts.dart';

part 'daily_statistic.g.dart';

@Collection()
class DailyStatistic {
  @Id()
  int? id;
  late int winsNumber;
  late int losesNumber;
  late int currentStreak;
  late Attempts attempts;
}
