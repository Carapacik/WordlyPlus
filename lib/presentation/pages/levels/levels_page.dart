import 'package:flutter/material.dart';
import 'package:wordly/presentation/widgets/widgets.dart';
import 'package:wordly/resources/resources.dart';

class LevelsPage extends StatelessWidget {
  const LevelsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: context.r.levels),
      body: ConstraintScreen(
        child: GridView.builder(
          padding: const EdgeInsets.all(12),
          itemCount: 1,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            return _GridItem(
              index: 1,
              word: '?',
              isComplete: false,
              isWin: false,
            );
          },
        ),
      ),
    );
  }
}

class _GridItem extends StatelessWidget {
  const _GridItem({
    required this.word,
    required this.isWin,
    required this.isComplete,
    required this.index,
  });

  final String word;
  final bool? isWin;
  final bool isComplete;
  final int index;

  @override
  Widget build(BuildContext context) => AspectRatio(
        aspectRatio: 1,
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: isWin == null
                ? AppColors.grey
                : isWin!
                    ? AppColors.green
                    : AppColors.red,
          ),
          child: Text(
            isComplete ? '$index\n$word' : '$index\n?',
            textAlign: TextAlign.center,
            style: AppTypography.b30.copyWith(
              color: Colors.white,
            ),
          ),
        ),
      );
}
