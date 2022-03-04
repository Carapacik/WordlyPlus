import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wordle/bloc/main/main_cubit.dart';
import 'package:wordle/data/dictionary_interactor.dart';
import 'package:wordle/resources/app_colors.dart';

class Grid extends StatelessWidget {
  const Grid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      buildWhen: (_, currentState) => currentState is GridUpdateState,
      builder: (context, state) {
        final _data = DictionaryInteractor.getInstance();
        final _letters = _data.getLetters();
        final _height = MediaQuery.of(context).size.height;
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: GridView.count(
            shrinkWrap: true,
            mainAxisSpacing: _height / 80,
            crossAxisSpacing: _height / 80,
            crossAxisCount: 5,
            children: List.generate(30, (index) {
              final letter = _letters.length > index ? _letters[index] : "";
              Color color = Colors.transparent;
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
              return AspectRatio(
                aspectRatio: 1,
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                    color: color,
                    border: color == Colors.transparent
                        ? Border.all(width: 3, color: AppColors.grey)
                        : null,
                  ),
                  child: Text(
                    letter.toUpperCase(),
                    style: GoogleFonts.mulish(
                      fontWeight: FontWeight.w600,
                      fontSize: 30,
                    ),
                  ),
                ),
              );
            }),
          ),
        );
      },
    );
  }
}
