import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:wordly/domain/daily_statistic_repository.dart';
import 'package:wordly/resources/typography.dart';
import 'package:wordly/ui/widgets/app_bar.dart';
import 'package:wordly/utils/utils.dart';

class StatisticPage extends StatelessWidget {
  const StatisticPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final statisticData = GetIt.I.get<DailyStatisticRepository>().statisticData;
    final total = statisticData.losesNumber + statisticData.winsNumber;
    final winRate = statisticData.winsNumber / total;
    return Scaffold(
      appBar: CustomAppBar(
        title: R.stringsOf(context).statistic,
      ),
      body: Responsive(
        mobile: Column(
          children: [
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _StatText(
                  value: total,
                  title: R.stringsOf(context).played,
                ),
                _StatText(
                  value: winRate,
                  title: R.stringsOf(context).win_percent,
                ),
                _StatText(
                  value: statisticData.currentStreak,
                  title: R.stringsOf(context).current_streak,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _StatText extends StatelessWidget {
  const _StatText({
    Key? key,
    required this.value,
    required this.title,
  }) : super(key: key);

  final num value;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value.toString(),
          style: AppTypography.b25,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          title,
          style: AppTypography.n14,
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
