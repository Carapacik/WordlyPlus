import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wordle/bloc/main/main_cubit.dart';
import 'package:wordle/data/data_singleton.dart';
import 'package:wordle/resources/app_colors.dart';

class Grid extends StatelessWidget {
  const Grid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      buildWhen: (_, currentState) => currentState is GridUpdateState,
      builder: (context, state) {
        final data = DictionaryInteractor.getInstance();
        final letters = data.getLetters();
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 30),
          child: GridView.count(
            mainAxisSpacing: 1,
            crossAxisSpacing: 30,
            shrinkWrap: true,
            crossAxisCount: 5,
            children: List.generate(30, (index) {
              final letter = letters.length > index ? letters[index] : "";
              Color color = AppColors.grey;
              if (letter.isNotEmpty &&
                  data.currentWordIndex > 0 &&
                  index < 5 * data.currentWordIndex) {
                final indexInRow = index % 5;
                if (data.gridData.join().contains(letter)) {
                  color = Colors.black;
                }
                if (data.secretWord.contains(letter)) {
                  color = AppColors.yellow;
                }
                if (data.secretWord[indexInRow] == letter) {
                  color = AppColors.green;
                }
              }
              return Container(
                width: 30,
                height: 30,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  color: color,
                ),
                child: Text(
                  letter.toUpperCase(),
                  style: GoogleFonts.mulish(
                    fontWeight: FontWeight.w600,
                    fontSize: 30,
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
