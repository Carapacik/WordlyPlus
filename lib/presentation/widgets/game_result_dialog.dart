import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordly/bloc/game/game_bloc.dart';
import 'package:wordly/data/models.dart';
import 'package:wordly/presentation/widgets/widgets.dart';
import 'package:wordly/resources/resources.dart';
import 'package:wordly/utils/utils.dart';

void showGameResultDialog(BuildContext context, {required GameResult result}) {
  final gameBloc = context.read<GameBloc>();
  final now = DateTime.now();
  final tomorrow = DateTime(now.year, now.month, now.day + 1);
  final timeRemaining = tomorrow.difference(now);
  showDialog<void>(
    context: context,
    builder: (context) {
      if (result.isWin == null) {
        return const SizedBox.shrink();
      }
      return Dialog(
        backgroundColor: result.isWin! ? AppColors.green : AppColors.red,
        insetPadding:
            EdgeInsets.symmetric(horizontal: horizontalPadding(context)),
        insetAnimationDuration: const Duration(milliseconds: 500),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                result.isWin!
                    ? context.r.win_message.toUpperCase()
                    : context.r.lose_message.toUpperCase(),
                style: context.theme.tm,
              ),
              const SizedBox(height: 12),
              Text(context.r.secret_word, style: context.theme.ll),
              const SizedBox(height: 4),
              SelectableText(
                result.word.toUpperCase(),
                style: context.theme.bl,
              ),
              const SizedBox(height: 8),
              Text(
                result.meaning,
                style: context.theme.ll,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    final textFunction = result.isWin!
                        ? context.r.check_my_result_win
                        : context.r.check_my_result_lose;
                    gameBloc.add(GameEvent.share(textFunction: textFunction));
                  },
                  child: Text(context.r.share),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(context.r.next_wordle, style: context.theme.tm),
                  const SizedBox(width: 12),
                  CountdownTimer(
                    onEnd: () {
                      Navigator.of(context).pop();
                      gameBloc.add(const GameEvent.loadGame());
                    },
                    timeRemaining: timeRemaining,
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
