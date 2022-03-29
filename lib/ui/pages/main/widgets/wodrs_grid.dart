import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordly/bloc/main/main_cubit.dart';
import 'package:wordly/bloc/settings/settings_cubit.dart';
import 'package:wordly/resources/typography.dart';

class WordsGrid extends StatelessWidget {
  const WordsGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      buildWhen: (_, currentState) => currentState is GridUpdateState,
      builder: (_, state) {
        return BlocBuilder<SettingsCubit, SettingsState>(
          buildWhen: (previous, current) =>
              previous.isHighContrast != current.isHighContrast,
          builder: (_, state) {
            return GridView.count(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              shrinkWrap: true,
              primary: false,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              crossAxisCount: 5,
              children: List.generate(30, (index) {
                final letter = "";
                Color? color;
                // final letter = _currentLetters.length > index
                //     ? _currentLetters[index]
                //     : "";
                // Color? color;
                // if (letter.isNotEmpty &&
                //     _dictionary.currentWordIndex > 0 &&
                //     index < 5 * _dictionary.currentWordIndex) {
                //   final indexInRow = index % 5;
                //   if (_currentLetters.contains(letter)) {
                //     color = AppColors.grey;
                //   }
                //   if (_dictionary.secretWord.contains(letter)) {
                //     color = state.isHighContrast
                //         ? AppColors.highContrastBlue
                //         : AppColors.yellow;
                //   }
                //   if (_dictionary.secretWord[indexInRow] == letter) {
                //     color = state.isHighContrast
                //         ? AppColors.highContrastOrange
                //         : AppColors.green;
                //   }
                // }
                return _GridItem(letter: letter, color: color);
              }),
            );
          },
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
              ? Border.all(
                  width: 2,
                  color: Theme.of(context).cardColor,
                )
              : null,
        ),
        child: Text(
          letter.toUpperCase(),
          style: AppTypography.b30,
        ),
      ),
    );
  }
}
