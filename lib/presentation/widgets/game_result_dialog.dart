import 'package:flutter/material.dart';
import 'package:wordly/data/models/game_result.dart';
import 'package:wordly/resources/resources.dart';
import 'package:wordly/utils/utils.dart';

void showGameResultDialog(BuildContext context, {required GameResult result}) {
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
              result.isWin ? context.r.win_message : context.r.lose_message,
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
          ],
        ),
      ),
    ),
  );
}
