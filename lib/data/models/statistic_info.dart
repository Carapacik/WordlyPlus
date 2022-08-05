import 'package:json_annotation/json_annotation.dart';

part 'statistic_info.g.dart';

@JsonSerializable(explicitToJson: true)
class StatisticInfo {
  const StatisticInfo({
    required this.wins,
    required this.loses,
    required this.attempts,
  });

  factory StatisticInfo.fromJson(Map<String, dynamic> json) =>
      _$StatisticInfoFromJson(json);

  final int wins;
  final int loses;
  final List<int> attempts;

  Map<String, dynamic> toJson() => _$StatisticInfoToJson(this);
}
