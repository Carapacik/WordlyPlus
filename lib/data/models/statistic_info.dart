class StatisticInfo {
  const StatisticInfo({
    required this.wins,
    required this.loses,
    required this.attempts,
    required this.streak,
  });

  factory StatisticInfo.empty() =>
      const StatisticInfo(wins: 0, loses: 0, streak: 0, attempts: zeroAttempts);

  factory StatisticInfo.fromJson(Map<String, dynamic> json) => StatisticInfo(
        wins: json['wins'] as int,
        loses: json['loses'] as int,
        attempts: (json['attempts'] as List<dynamic>)
            .map((dynamic e) => e as int)
            .toList(),
        streak: json['streak'] as int,
      );

  final int wins;
  final int loses;
  final int streak;
  final List<int> attempts;

  static const zeroAttempts = <int>[0, 0, 0, 0, 0, 0];

  Map<String, dynamic> toJson() => <String, dynamic>{
        'wins': wins,
        'loses': loses,
        'streak': streak,
        'attempts': attempts,
      };
}
