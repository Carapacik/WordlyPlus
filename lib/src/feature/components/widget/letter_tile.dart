import 'package:flutter/material.dart';
import 'package:wordly/src/core/resources/resources.dart';
import 'package:wordly/src/feature/game/model/letter_info.dart';

class LetterTile extends StatelessWidget {
  const LetterTile({required this.info, this.selected = false, this.onTap, this.color, super.key});

  final LetterInfo info;
  final bool selected;
  final VoidCallback? onTap;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
          constraints: const BoxConstraints(maxHeight: 60, maxWidth: 60),
          decoration: BoxDecoration(
            color: color ?? info.status.cellColor(context),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(width: 3, color: selected ? AppColors.red : Colors.transparent),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: FittedBox(
              child: Text(
                info.letter.toUpperCase(),
                style: TextStyle(color: info.status.textColor(context), fontWeight: FontWeight.w800),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
