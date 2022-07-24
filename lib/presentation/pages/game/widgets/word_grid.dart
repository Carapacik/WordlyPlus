import 'package:flutter/material.dart';
import 'package:wordly/data/models/letter_info.dart';
import 'package:wordly/data/models/letter_status.dart';
import 'package:wordly/presentation/widgets/widgets.dart';
import 'package:wordly/resources/resources.dart';

class WordGrid extends StatelessWidget {
  const WordGrid({super.key});

  @override
  Widget build(BuildContext context) => ConstraintScreen(
        child: GridView.count(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          shrinkWrap: true,
          primary: false,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          crossAxisCount: 5,
          children: List.generate(
            30,
            (index) => _GridItem(
              info: LetterInfo(
                letter: '',
                letterStatus: LetterStatus.notInWord,
              ),
            ),
          ),
        ),
      );
}

class _GridItem extends StatelessWidget {
  const _GridItem({required this.info, super.key});

  final LetterInfo info;

  @override
  Widget build(BuildContext context) => AspectRatio(
        aspectRatio: 1,
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color:
                info.letterStatus.gridItemColor(context, isHighContrast: true),
            border: info.isStatusUnknown
                ? Border.all(
                    width: 3,
                    color: Theme.of(context).cardColor,
                  )
                : null,
          ),
          child: Text(
            info.letter.toUpperCase(),
            style: AppTypography.b30.copyWith(
              color: info.isStatusUnknown ? Colors.black : null,
            ),
          ),
        ),
      );
}
