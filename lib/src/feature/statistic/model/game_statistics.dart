class GameStatistics {
  const GameStatistics({
    required this.wins,
    required this.loses,
    required this.streak,
    required this.maxStreak,
    required this.attempts,
  });

  factory GameStatistics.fromJson(Map<String, dynamic> json) => GameStatistics(
    wins: json['wins'] as int,
    loses: json['loses'] as int,
    streak: json['streak'] as int,
    maxStreak: json['maxStreak'] as int,
    attempts: (json['attempts'] as List<dynamic>).map((e) => e as int).toList(),
  );

  final int wins;
  final int loses;
  final int streak;
  final int maxStreak;
  final List<int> attempts;

  static const zeroAttempts = <int>[0, 0, 0, 0, 0, 0];

  Map<String, Object?> toJson() => <String, Object?>{
    'wins': wins,
    'loses': loses,
    'streak': streak,
    'maxStreak': maxStreak,
    'attempts': attempts,
  };
}
