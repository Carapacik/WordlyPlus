import 'dart:math';

import 'package:flutter/material.dart';
import 'package:wordly/presentation/widgets/widgets.dart';
import 'package:wordly/resources/resources.dart';

class StatisticPage extends StatelessWidget {
  const StatisticPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: context.r.statistic),
      body: ConstraintScreen(
        child: Column(
          children: [
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _StatText(
                  value: 12,
                  title: context.r.played,
                ),
                _StatText(
                  value: 12,
                  title: context.r.win_rate,
                ),
                _StatText(
                  value: 12,
                  title: context.r.current_streak,
                ),
              ],
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: FittedBox(
                child: Text(
                  context.r.guess_distribution.toUpperCase(),
                  style: context.theme.tl,
                ),
              ),
            ),
            const SizedBox(height: 4),
            const _AttemptContent(attempts: []),
          ],
        ),
      ),
    );
  }
}

class _StatText extends StatelessWidget {
  const _StatText({required this.value, required this.title});

  final num value;
  final String title;

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            value.toStringAsFixed(2),
            style: context.theme.tl,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            title,
            style: context.theme.bs,
            textAlign: TextAlign.center,
          )
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
      itemBuilder: (context, index) => FractionallySizedBox(
        alignment: Alignment.topLeft,
        widthFactor: (attempts[index] + 1) / maxValue,
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(4),
          ),
          height: 20,
          child: Text(
            ' ${attempts[index]}',
            style: context.theme.bl,
          ),
        ),
      ),
      separatorBuilder: (_, __) => const SizedBox(height: 4),
    );
  }
}
