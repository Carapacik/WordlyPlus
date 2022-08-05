import 'package:json_annotation/json_annotation.dart';

part 'statistic_info.g.dart';

@JsonSerializable(explicitToJson: true)
class StatisticInfo {
  const StatisticInfo({
    required this.wins,
    required this.loses,
    required this.attempts,
    required this.streak,
  });

  factory StatisticInfo.empty() =>
      const StatisticInfo(wins: 0, loses: 0, streak: 0, attempts: zeroAttempts);

  factory StatisticInfo.fromJson(Map<String, dynamic> json) =>
      _$StatisticInfoFromJson(json);

  final int wins;
  final int loses;
  final int streak;
  final List<int> attempts;

  static const zeroAttempts = <int>[0, 0, 0, 0, 0, 0];

  Map<String, dynamic> toJson() => _$StatisticInfoToJson(this);
}
