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
        final _dictionary = DictionaryInteractor.getInstance();
        final _letters = _dictionary.getLetters();
        return GridView.count(
          padding: const EdgeInsets.all(10),
          shrinkWrap: true,
          primary: false,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          crossAxisCount: 5,
          children: List.generate(30, (index) {
            final letter = _letters.length > index ? _letters[index] : "";
            Color? color;
            if (letter.isNotEmpty &&
                _dictionary.currentWordIndex > 0 &&
                index < 5 * _dictionary.currentWordIndex) {
              final indexInRow = index % 5;
              if (_dictionary.gridData.join().contains(letter)) {
                color = AppColors.grey;
              }
              if (_dictionary.secretWord.contains(letter)) {
                color = AppColors.yellow;
              }
              if (_dictionary.secretWord[indexInRow] == letter) {
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
