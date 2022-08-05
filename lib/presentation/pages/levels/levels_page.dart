import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordly/bloc/levels/levels_bloc.dart';
import 'package:wordly/presentation/widgets/widgets.dart';
import 'package:wordly/resources/resources.dart';

class LevelsPage extends StatelessWidget {
  const LevelsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: context.r.levels),
      body: ConstraintScreen(
        child: BlocBuilder<LevelsBloc, LevelsState>(
          builder: (context, state) => state.when(
            initial: () => const Center(child: CircularProgressIndicator()),
            levelsLoaded: (levels) {
              return GridView.builder(
                padding: const EdgeInsets.all(12),
                itemCount: levels.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  return _GridItem(
                    index: index + 1,
                    word: levels[index].word,
                    meaning: levels[index].meaning,
                    isWin: levels[index].isWin,
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

class _GridItem extends StatelessWidget {
  const _GridItem({
    required this.word,
    required this.meaning,
    required this.isWin,
    required this.index,
  });

  final String word;
  final String meaning;
  final bool? isWin;
  final int index;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () {
          //TODO show dialog meaning
        },
        child: AspectRatio(
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
              '$index\n$word',
              textAlign: TextAlign.center,
              style: context.theme.tl.copyWith(color: Colors.white),
            ),
          ),
        ),
      );
}
