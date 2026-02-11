import 'dart:math';

import 'package:flutter/material.dart';
import 'package:wordly/src/core/common/common.dart';
import 'package:wordly/src/feature/settings/settings.dart';
import 'package:wordly/src/feature/shared/constraint_screen.dart';
import 'package:wordly/src/feature/shared/not_played.dart';
import 'package:wordly/src/feature/statistic/domain/model/game_statistic.dart';

class StatisticPage extends StatefulWidget {
  const StatisticPage({required this.dictionary, super.key});

  final Locale dictionary;

  @override
  State<StatisticPage> createState() => _StatisticPageState();
}

class _StatisticPageState extends State<StatisticPage> {
  late final Future<GameStatistic?> _getStatisticsFuture = context.dependencies.statisticsRepository.getStatistic(
    widget.dictionary.languageCode,
  );

  @override
  Widget build(BuildContext context) {
    return Title(
      color: Colors.black,
      title: context.l10n.statistic,
      child: Scaffold(
        backgroundColor: context.theme.extension<BackgroundCustomColors>()?.background,
        appBar: AppBar(
          centerTitle: true,
          title: Text(context.l10n.statistic, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 32)),
        ),
        body: ConstraintScreen(
          child: FutureBuilder(
            future: _getStatisticsFuture,
            builder: (context, snapshot) {
              if (!snapshot.hasData || snapshot.data == null) {
                return const HaveNotPlayed();
              }
              final GameStatistic? statistic = snapshot.requireData;
              final int played = statistic!.wins + statistic.loses;
              final num winRate = played != 0 ? statistic.wins * 100 / played : 0;
              final int streak = statistic.streak;
              final int maxStreak = statistic.maxStreak;
              return Column(
                children: [
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _StatText(value: played, title: context.l10n.played),
                      _StatText(value: winRate, title: context.l10n.winRate, percent: true),
                      _StatText(value: streak, title: context.l10n.currentStreak),
                      _StatText(value: maxStreak, title: context.l10n.maxStreak),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: FittedBox(
                      child: Text(
                        context.l10n.guessDistribution.toUpperCase(),
                        style: const TextStyle(fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  _AttemptContent(attempts: statistic.attempts),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class _StatText extends StatelessWidget {
  const _StatText({required this.value, required this.title, this.percent = false});

  final num value;
  final String title;
  final bool percent;

  @override
  Widget build(BuildContext context) => Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Text(
        percent ? '${value.toStringAsFixed(1)}%' : value.toString(),
        style: const TextStyle(fontWeight: FontWeight.w500),
      ),
      const SizedBox(height: 8),
      Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.w500),
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
    final SettingsContainer settingsScope = SettingsScope.of(context, listen: true);
    final Settings settings = settingsScope.settingsService.current;
    final int maxValue = attempts.reduce(max) + 1;
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      shrinkWrap: true,
      itemCount: attempts.length,
      separatorBuilder: (_, _) => const SizedBox(height: 4),
      itemBuilder: (context, index) => FractionallySizedBox(
        alignment: Alignment.topLeft,
        widthFactor: (attempts[index] + 1) / maxValue,
        child: Container(
          decoration: BoxDecoration(color: settings.general.correctColor, borderRadius: BorderRadius.circular(4)),
          height: 20,
          child: Text(' ${attempts[index]}', style: const TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}
