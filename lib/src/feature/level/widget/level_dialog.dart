import 'package:flutter/material.dart';
import 'package:wordly/src/core/resources/resources.dart';

Future<void> showLevelDialog(
  BuildContext context, {
  required String word,
  required String meaning,
  required bool isWin,
}) => showDialog<void>(
  context: context,
  builder: (context) {
    final width = MediaQuery.sizeOf(context).width;
    final padding = width > 350 ? (width - 350) / 2 : 8;
    return Dialog(
      backgroundColor: isWin ? AppColors.green : AppColors.red,
      insetAnimationDuration: const Duration(milliseconds: 800),
      insetPadding: EdgeInsets.symmetric(horizontal: padding.toDouble()),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SelectableText(word.toUpperCase(), style: const TextStyle(color: Colors.white, fontSize: 24)),
            const SizedBox(height: 16),
            Text(meaning, style: const TextStyle(color: Colors.white, fontSize: 16), textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  },
);
