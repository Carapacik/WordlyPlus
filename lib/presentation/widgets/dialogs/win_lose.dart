import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/index.dart';
import 'package:wordle/data/dictionary_data.dart';
import 'package:wordle/data/models/game_statistic.dart';
import 'package:wordle/data/models/letter_data.dart';
import 'package:wordle/data/models/letter_status.dart';
import 'package:wordle/resources/app_text_styles.dart';
import 'package:wordle/resources/r.dart';
import 'package:wordle/utils/utils.dart';

Future<void> showWinLoseDialog(
  final BuildContext context, {
  required final GameStatistic statistic,
  final bool isWin = true,
  required final List<LetterData> grid,
}) async {
  showDialog(
    context: context,
    builder: (context) {
      final now = DateTime.now();
      final nextMidnight =
          DateTime(now.year, now.month, now.day).add(const Duration(days: 1));
      final int endTime = now.millisecondsSinceEpoch +
          nextMidnight.difference(now).inMilliseconds;
      final CountdownTimerController _countDownController =
          CountdownTimerController(
        endTime: endTime,
        onEnd: () async {
          await DictionaryData.getInstance().createSecretWord();
          Navigator.of(context, rootNavigator: true).pop();
        },
      );
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        backgroundColor: isWin ? Colors.green : Colors.red,
        title: Center(
          child: Text(
            isWin
                ? R.stringsOf(context).win_message
                : R.stringsOf(context).lose_message,
            style: AppTextStyles.m25.copyWith(color: Colors.white),
          ),
        ),
        content: IntrinsicHeight(
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      R.stringsOf(context).next_wordle,
                      textAlign: TextAlign.center,
                      style: AppTextStyles.m16.copyWith(color: Colors.white),
                    ),
                    CountdownTimer(
                      controller: _countDownController,
                      widgetBuilder: (_, CurrentRemainingTime? time) {
                        if (time == null) {
                          return Container();
                        }
                        final duration = Duration(
                          hours: time.hours ?? 0,
                          minutes: time.min ?? 0,
                          seconds: time.sec ?? 0,
                        );
                        return Text(
                          durationToString(duration),
                          style:
                              AppTextStyles.m16.copyWith(color: Colors.white),
                        );
                      },
                    ),
                  ],
                ),
              ),
              const VerticalDivider(
                thickness: 2,
                color: Colors.white,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ElevatedButton(
                  onPressed: () {
                    String temp = "";
                    grid.asMap().map((key, value) {
                      temp += value.status.toEmoji();
                      if (key % 5 == 4) {
                        temp += "\n";
                      }
                      return MapEntry(key, value);
                    });
                    print(temp);
                  },
                  child: Text(
                    '${grid.length}',
                    style: AppTextStyles.m16.copyWith(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
