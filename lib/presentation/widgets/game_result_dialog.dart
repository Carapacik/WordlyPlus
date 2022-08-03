import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordly/bloc/game/game_bloc.dart';
import 'package:wordly/data/models.dart';
import 'package:wordly/presentation/widgets/widgets.dart';
import 'package:wordly/resources/resources.dart';
import 'package:wordly/utils/utils.dart';

void showGameResultDialog(BuildContext context, {required GameResult result}) {
  // TODO for future events
  final gameBloc = context.read<GameBloc>();
  final now = DateTime.now();
  final tomorrow = DateTime(now.year, now.month, now.day + 1);
  final timeRemaining = tomorrow.difference(now);
  showDialog<void>(
    context: context,
    builder: (context) => Dialog(
      backgroundColor: result.isWin ? AppColors.green : AppColors.red,
      insetPadding:
          EdgeInsets.symmetric(horizontal: horizontalPadding(context)),
      insetAnimationDuration: const Duration(milliseconds: 500),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              result.isWin
                  ? context.r.win_message.toUpperCase()
                  : context.r.lose_message.toUpperCase(),
              style: context.theme.tm,
            ),
            const SizedBox(height: 12),
            Text(context.r.secret_word, style: context.theme.ll),
            const SizedBox(height: 4),
            SelectableText(result.word.toUpperCase(), style: context.theme.bl),
            const SizedBox(height: 8),
            Text(
              result.meaning,
              style: context.theme.ll,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(context.r.next_wordle, style: context.theme.tm),
                const SizedBox(width: 12),
                CountdownTimer(
                  onEnd: () {
                    // TODO clear board and restart game
                  },
                  timeRemaining: timeRemaining,
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
