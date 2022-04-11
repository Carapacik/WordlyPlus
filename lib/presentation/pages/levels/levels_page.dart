import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:wordly/data/collections/board_data.dart';
import 'package:wordly/domain/board_repository.dart';
import 'package:wordly/presentation/widgets/widgets.dart';
import 'package:wordly/resources/resources.dart';
import 'package:wordly/utils/utils.dart';

class LevelsPage extends StatelessWidget {
  const LevelsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: CustomAppBar(title: R.stringsOf(context).levels),
        body: ConstraintScreen(
          child: FutureBuilder<List<BoardData>>(
            future: GetIt.I<BoardRepository>().getAllData(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator.adaptive(
                    strokeWidth: 3,
                    valueColor: AlwaysStoppedAnimation<Color>(AppColors.grey),
                  ),
                );
              }
              final data = snapshot.requireData;
              return GridView.builder(
                padding: const EdgeInsets.all(12),
                itemCount: data.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemBuilder: (BuildContext context, int index) => _GridItem(
                  index: data[index].levelNumber,
                  word: data[index].secretWord,
                  isComplete: data[index].isComplete,
                  isWin: true,
                ),
              );
            },
          ),
        ),
      );
}

class _GridItem extends StatelessWidget {
  const _GridItem({
    required this.word,
    required this.isWin,
    required this.isComplete,
    required this.index,
    Key? key,
  }) : super(key: key);

  final String word;
  final bool isWin;
  final bool isComplete;
  final int index;

  @override
  Widget build(BuildContext context) => AspectRatio(
        aspectRatio: 1,
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: isWin ? AppColors.green : AppColors.red,
          ),
          child: Text(
            isComplete ? '$index\n$word' : '?',
            textAlign: TextAlign.center,
            style: AppTypography.b30.copyWith(
              color: Colors.white,
            ),
          ),
        ),
      );
}
