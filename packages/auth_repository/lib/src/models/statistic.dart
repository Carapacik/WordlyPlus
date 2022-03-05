import 'package:auth_repository/src/models/tries.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'statistic.freezed.dart';

part 'statistic.g.dart';

@freezed
class Statistic with _$Statistic {
  factory Statistic({
    @Default(0) int win,
    @Default(0) int loses,
    @Default(0) int maxStreak,
    required String uid,
    @Default(0) double winRate,
    @Default(Tries()) Tries tries,
  }) = Data;

  factory Statistic.fromJson(Map<String, dynamic> json) =>
      _$StatisticFromJson(json);
}
