import 'package:flutter/material.dart';
import 'package:wordly/src/core/resources/resources.dart';
import 'package:wordly/src/core/utils/extensions/extensions.dart';
import 'package:wordly/src/feature/game/model/game_mode.dart';
import 'package:wordly/src/feature/game/widget/countdown_timer.dart';

Future<void> showGameResultDialog(
  BuildContext context,
  String secretWord,
  String meaning,
  GameMode mode, {
  required bool isWin,
  required VoidCallback nextLevelPressed,
  VoidCallback? onTimerEnd,
}) =>
    showDialog(
      context: context,
      barrierDismissible: mode == GameMode.daily,
      builder: (context) => DialogContent(
        secretWord: secretWord,
        meaning: meaning,
        isWin: isWin,
        mode: mode,
        onTimerEnd: onTimerEnd,
        nextLevelPressed: nextLevelPressed,
      ),
    );

class DialogContent extends StatelessWidget {
  const DialogContent({
    required this.secretWord,
    required this.meaning,
    required this.isWin,
    required this.mode,
    required this.onTimerEnd,
    required this.nextLevelPressed,
    super.key,
  });

  final String secretWord;
  final String meaning;
  final bool isWin;
  final GameMode mode;
  final VoidCallback? onTimerEnd;
  final VoidCallback nextLevelPressed;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final padding = width > 350 ? (width - 350) / 2 : 8;
    return Dialog(
      backgroundColor: isWin ? AppColors.green : AppColors.red,
      insetAnimationDuration: const Duration(milliseconds: 800),
      insetPadding: EdgeInsets.symmetric(horizontal: padding.toDouble()),
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                (isWin ? context.r.winMessage : context.r.loseMessage).toUpperCase(),
                style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w800),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              Text(
                context.r.secretWord,
                style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 12),
              SelectableText(
                secretWord.toUpperCase(),
                style: const TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 12),
              Text(
                meaning,
                style: const TextStyle(color: Colors.white, fontSize: 14),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              switch (mode) {
                GameMode.daily => _DailyContent(isWin: isWin, onEnd: onTimerEnd),
                GameMode.lvl => _LevelContent(isWin: isWin, nextLevelPressed: nextLevelPressed),
              },
            ],
          ),
        ),
      ),
    );
  }
}

class _DailyContent extends StatelessWidget {
  const _DailyContent({required this.isWin, this.onEnd});

  final bool isWin;
  final VoidCallback? onEnd;

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now().toUtc();
    final tomorrow = DateTime.utc(now.year, now.month, now.day + 1);
    final timeRemaining = tomorrow.difference(now);
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            // final textFunction = isWin
            //     ? context.r.check_my_result_win
            //     : context.r.check_my_result_lose;
            // gameBloc.add(GameEvent.share(textFunction: textFunction));
          },
          child: Text(
            context.r.share,
            style: TextStyle(
              color: isWin ? AppColors.green : AppColors.red,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 24),
        Text(
          context.r.nextWord,
          style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 4),
        CountdownTimer(
          onEnd: onEnd,
          timeRemaining: timeRemaining,
        ),
      ],
    );
  }
}

class _LevelContent extends StatelessWidget {
  const _LevelContent({required this.isWin, required this.nextLevelPressed});

  final bool isWin;
  final VoidCallback nextLevelPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: nextLevelPressed,
      child: Text(
        context.r.nextLevel,
        style: TextStyle(
          color: isWin ? AppColors.green : AppColors.red,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
