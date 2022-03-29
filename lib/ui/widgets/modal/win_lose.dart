import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_countdown_timer/index.dart';
import 'package:get_it/get_it.dart';
import 'package:wordly/bloc/main/main_cubit.dart';
import 'package:wordly/data/dictionary_repository.dart';
import 'package:wordly/resources/colors.dart';
import 'package:wordly/resources/typography.dart';
import 'package:wordly/utils/utils.dart';

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
      final mainCubit = BlocProvider.of<MainCubit>(context);
      final CountdownTimerController _countDownController =
          CountdownTimerController(
        endTime: endTime,
        onEnd: () {
          mainCubit.clearArea();
          Navigator.of(context, rootNavigator: true).pop();
        },
      );
      final word = GetIt.I<DictionaryRepository>().secretWord;
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        backgroundColor: isWin ? AppColors.green : AppColors.red,
        title: Center(
          child: Text(
            isWin
                ? R.stringsOf(context).win_message
                : R.stringsOf(context).lose_message,
            style: AppTypography.m25.copyWith(color: Colors.white),
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        R.stringsOf(context).next_wordle,
                        textAlign: TextAlign.center,
                        style: AppTypography.m16.copyWith(color: Colors.white),
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
                                AppTypography.m16.copyWith(color: Colors.white),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          shareEmojiString(context);
                        },
                        child: Container(
                          width: 80,
                          alignment: Alignment.center,
                          child: Text(
                            R.stringsOf(context).share,
                            style:
                                AppTypography.n14.copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(height: 4),
                      ElevatedButton(
                        onPressed: () {
                          copyEmojiString(context);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: 80,
                          child: Text(
                            R.stringsOf(context).copy,
                            style:
                                AppTypography.n14.copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 16),
            Text(
              R.stringsOf(context).secret_word_is,
              style: AppTypography.m20.copyWith(color: Colors.white),
            ),
            const SizedBox(height: 4),
            Text(
              word.toUpperCase(),
              style: AppTypography.m20.copyWith(color: Colors.white),
            ),
          ],
        ),
      );
    },
  );
}
