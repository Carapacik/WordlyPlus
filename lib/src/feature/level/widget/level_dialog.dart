import 'package:flutter/material.dart';
import 'package:wordly/src/core/utils/extensions/extensions.dart';

Future<void> showLevelDialog(
  BuildContext context, {
  required String word,
  required String meaning,
  required bool isWin,
}) =>
    showDialog<void>(
      context: context,
      builder: (context) {
        final width = MediaQuery.sizeOf(context).width;
        final padding = width > 350 ? (width - 350) / 2 : 8;
        return Dialog(
          backgroundColor: isWin ? Colors.green : Colors.red,
          insetAnimationDuration: const Duration(milliseconds: 800),
          insetPadding: EdgeInsets.symmetric(horizontal: padding.toDouble()),
          child: Container(
            padding: const EdgeInsets.all(16),
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SelectableText(
                  word.toUpperCase(),
                  style: context.theme.tmb.copyWith(color: Colors.white),
                ),
                const SizedBox(height: 16),
                Text(
                  meaning,
                  style: context.theme.ll.copyWith(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        );
      },
    );
