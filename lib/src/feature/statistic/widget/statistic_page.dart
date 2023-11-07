import 'dart:math';

import 'package:flutter/material.dart';
import 'package:wordly/src/core/utils/extensions/extensions.dart';
import 'package:wordly/src/feature/app/widget/theme_scope.dart';
import 'package:wordly/src/feature/components/widget/constraint_screen.dart';
import 'package:wordly/src/feature/components/widget/not_played.dart';
import 'package:wordly/src/feature/statistic/model/game_statistics.dart';

class StatisticPage extends StatefulWidget {
  const StatisticPage({required this.dictionary, super.key});

  final Locale dictionary;

  @override
  State<StatisticPage> createState() => _StatisticPageState();
}

class _StatisticPageState extends State<StatisticPage> {
  GameStatistics? _statistics;

  @override
  void initState() {
    super.initState();
    _statistics = context.dependencies.statisticsRepository.loadAppStatisticFromCache(widget.dictionary);
  }

  @override
  Widget build(BuildContext context) => Title(
        color: Colors.black,
        title: context.r.statistic,
        child: Scaffold(
          appBar: AppBar(title: Text(context.r.statistic)),
          body: ConstraintScreen(
            child: Builder(
              builder: (context) {
                if (_statistics == null) {
                  return const HaveNotPlayed();
                }
                final played = _statistics!.wins + _statistics!.loses;
                final winRate = played != 0 ? _statistics!.wins * 100 / played : 0;
                final streak = _statistics!.streak;
                final maxStreak = _statistics!.maxStreak;
                return Column(
                  children: [
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _StatText(
                          value: played,
                          title: context.r.played,
                        ),
                        _StatText(
                          value: winRate,
                          title: context.r.winRate,
                          percent: true,
                        ),
                        _StatText(
                          value: streak,
                          title: context.r.currentStreak,
                        ),
                        _StatText(
                          value: maxStreak,
                          title: context.r.maxStreak,
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: FittedBox(
                        child: Text(
                          context.r.guessDistribution.toUpperCase(),
                          style: context.theme.tl,
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    _AttemptContent(attempts: _statistics!.attempts),
                  ],
                );
              },
            ),
          ),
        ),
      );
}

class _StatText extends StatelessWidget {
  const _StatText({
    required this.value,
    required this.title,
    this.percent = false,
    // ignore: unused_element
    super.key,
  });

  final num value;
  final String title;
  final bool percent;

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            percent ? '${value.toStringAsFixed(1)}%' : value.toString(),
            style: context.theme.tl,
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: context.theme.ll,
            textAlign: TextAlign.center,
          ),
        ],
      );
}

class _AttemptContent extends StatelessWidget {
  const _AttemptContent({required this.attempts});

  final List<int> attempts;

  @override
  Widget build(BuildContext context) {
    final maxValue = attempts.reduce(max) + 1;
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      shrinkWrap: true,
      itemCount: attempts.length,
      separatorBuilder: (_, __) => const SizedBox(height: 4),
      itemBuilder: (context, index) => FractionallySizedBox(
        alignment: Alignment.topLeft,
        widthFactor: (attempts[index] + 1) / maxValue,
        child: Container(
          decoration: BoxDecoration(
            color: ThemeScope.of(context).theme.correctColor,
            borderRadius: BorderRadius.circular(4),
          ),
          height: 20,
          child: Text(
            ' ${attempts[index]}',
            style: context.theme.bl.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
