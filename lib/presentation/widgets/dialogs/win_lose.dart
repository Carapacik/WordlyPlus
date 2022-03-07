import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/index.dart';
import 'package:wordle/data/dictionary_data.dart';
import 'package:wordle/resources/app_text_styles.dart';
import 'package:wordle/resources/r.dart';
import 'package:wordle/utils/utils.dart';

Future<void> showWinLoseDialog(
  final BuildContext context, {
  final bool isWin = true,
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
          await DictionaryData.getInstance().createWord();
          Navigator.of(context, rootNavigator: true).pop();
        },
      );
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        backgroundColor: isWin ? Colors.green : Colors.red,
        title: Text(
          isWin
              ? R.stringsOf(context).win_message
              : R.stringsOf(context).lose_message,
          style: AppTextStyles.m25,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              R.stringsOf(context).next_wordle,
              style: AppTextStyles.m25,
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
                  style: AppTextStyles.m20,
                );
              },
            ),
          ],
        ),
      );
    },
  );
}
