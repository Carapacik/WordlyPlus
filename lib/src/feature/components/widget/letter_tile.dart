import 'package:flutter/material.dart';
import 'package:wordly/src/feature/game/model/letter_info.dart';

class LetterTile extends StatelessWidget {
  const LetterTile({
    required this.letter,
    required this.onTap,
    this.selected = false,
    this.color,
    super.key,
  });

  final LetterInfo letter;
  final Color? color;
  final VoidCallback? onTap;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
          constraints: const BoxConstraints(maxHeight: 60, maxWidth: 60),
          decoration: BoxDecoration(
            color: color ?? letter.status.color(context),
            borderRadius: BorderRadius.circular(6),
            border: Border.all(
              width: 3,
              color: selected
                  ? Colors.red
                  : letter.status == LetterStatus.unknown
                      ? Colors.grey
                      : Colors.transparent,
            ),
          ),
          child: FittedBox(
            child: Text(letter.letter.toUpperCase()),
          ),
        ),
      ),
    );
  }
}
