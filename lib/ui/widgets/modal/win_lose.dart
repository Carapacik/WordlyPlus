import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_countdown_timer/index.dart';
import 'package:wordly/bloc/main/main_cubit.dart';
import 'package:wordly/resources/resources.dart';
import 'package:wordly/ui/widgets/widgets.dart';
import 'package:wordly/utils/utils.dart';

Future<void> showWinLoseDialog(
  final BuildContext context, {
  required final bool isWin,
  required final String word,
  required final String secretWordMeaning,
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
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        insetPadding: const EdgeInsets.all(24),
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
              mainAxisSize: MainAxisSize.min,
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
                      const SizedBox(height: 4),
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
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomButton(
                        text: R.stringsOf(context).share,
                        onTap: () {
                          shareEmojiString(context);
                        },
                      ),
                      const SizedBox(height: 4),
                      CustomButton(
                        text: R.stringsOf(context).copy,
                        onTap: () {
                          copyEmojiString(context);
                        },
                      )
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 16),
            Text(
              R.stringsOf(context).secret_word_is,
              style: AppTypography.m18.copyWith(color: Colors.white),
            ),
            const SizedBox(height: 4),
            SelectableText(
              word.toUpperCase(),
              style: AppTypography.m20.copyWith(color: Colors.white),
            ),
            const SizedBox(height: 16),
            Text(
              secretWordMeaning,
              textAlign: TextAlign.center,
              style: AppTypography.n14.copyWith(color: Colors.white),
            ),
          ],
        ),
      );
    },
  );
}
