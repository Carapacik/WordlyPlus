import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordle/bloc/main/main_cubit.dart';
import 'package:wordle/data/dictionary_interactor.dart';
import 'package:wordle/resources/app_colors.dart';
import 'package:wordle/resources/app_text_styles.dart';

class WordGrid extends StatelessWidget {
  const WordGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      buildWhen: (_, currentState) => currentState is GridUpdateState,
      builder: (context, state) {
        final _data = DictionaryInteractor.getInstance();
        final _letters = _data.getLetters();
        return GridView.count(
          padding: const EdgeInsets.all(8),
          shrinkWrap: true,
          primary: false,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          crossAxisCount: 5,
          children: List.generate(30, (index) {
            final letter = _letters.length > index ? _letters[index] : "";
            Color? color;
            if (letter.isNotEmpty &&
                _data.currentWordIndex > 0 &&
                index < 5 * _data.currentWordIndex) {
              final indexInRow = index % 5;
              if (_data.gridData.join().contains(letter)) {
                color = AppColors.grey;
              }
              if (_data.secretWord.contains(letter)) {
                color = AppColors.yellow;
              }
              if (_data.secretWord[indexInRow] == letter) {
                color = AppColors.green;
              }
            }
            return _GridItem(letter: letter, color: color);
          }),
        );
      },
    );
  }
}

class _GridItem extends StatelessWidget {
  const _GridItem({
    Key? key,
    required this.letter,
    this.color,
  }) : super(key: key);

  final Color? color;
  final String letter;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color ?? Colors.transparent,
          border: color == null
              ? Border.all(width: 2, color: AppColors.grey)
              : null,
        ),
        child: Text(
          letter.toUpperCase(),
          style: AppTextStyles.b30,
        ),
      ),
    );
  }
}
