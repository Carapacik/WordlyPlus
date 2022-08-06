import 'package:flutter/material.dart';
import 'package:wordly/resources/resources.dart';
import 'package:wordly/utils/utils.dart';

void showMeaningDialog(
  BuildContext context, {
  required String word,
  required String meaning,
  required bool isWin,
}) {
  showDialog<void>(
    context: context,
    builder: (context) => Dialog(
      backgroundColor: isWin ? AppColors.green : AppColors.red,
      insetPadding:
          EdgeInsets.symmetric(horizontal: horizontalPadding(context)),
      insetAnimationDuration: const Duration(milliseconds: 700),
      child: Container(
        padding: const EdgeInsets.all(16),
        constraints: const BoxConstraints(maxHeight: 200),
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SelectableText(
              word.toUpperCase(),
              style: context.theme.tm,
            ),
            const SizedBox(height: 16),
            Text(
              meaning,
              style: context.theme.ll,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    ),
  );
}
