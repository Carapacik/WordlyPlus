import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordle/bloc/main/main_cubit.dart';
import 'package:wordle/data/dictionary_data.dart';
import 'package:wordle/data/models/keyboard_keys.dart';
import 'package:wordle/data/models/letter_status.dart';
import 'package:wordle/resources/app_colors.dart';
import 'package:wordle/resources/app_text_styles.dart';

class KeyboardKey extends StatelessWidget {
  const KeyboardKey({
    Key? key,
    required this.keyboardKey,
    this.lang = 0,
  }) : super(key: key);

  final KeyboardKeys keyboardKey;

  // lang 0  - en
  // lang 1  - ru
  final int lang;

  @override
  Widget build(BuildContext context) {
    final mainCubit = BlocProvider.of<MainCubit>(context);
    return BlocBuilder<MainCubit, MainState>(
      buildWhen: (_, currentState) {
        if (currentState is KeyboardKeyUpdateState) {
          final KeyboardKeyUpdateState state = currentState;
          if (state.keyboardKey == keyboardKey) {
            return true;
          }
        }
        return false;
      },
      builder: (context, state) {
        final _dictionary = DictionaryData.getInstance();
        return Container(
          margin: const EdgeInsets.all(4),
          width: _getWidthByLang(MediaQuery.of(context).size.width),
          child: AspectRatio(
            aspectRatio: 2 / 3,
            child: InkWell(
              onTap: () => mainCubit.setLetter(keyboardKey),
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: _dictionary
                      .getKeyStatus(keyboardKey.name(lang: lang))
                      .color(context),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  keyboardKey.name(lang: lang)?.toUpperCase() ?? "",
                  style: AppTextStyles.n14,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  double _getWidthByLang(final double width) {
    switch (lang) {
      case 0:
        return width * 0.07;
      case 1:
        return width * 0.059;
      default:
        return 0;
    }
  }
}

class EnterKeyboardKey extends StatelessWidget {
  const EnterKeyboardKey({
    Key? key,
    this.lang = 0,
  }) : super(key: key);

  final int lang;

  @override
  Widget build(BuildContext context) {
    final mainCubit = BlocProvider.of<MainCubit>(context);
    final dictionary = DictionaryData.getInstance();
    return Container(
      margin: const EdgeInsets.only(right: 4),
      height: _getHeightByLang(MediaQuery.of(context).size.width),
      child: InkWell(
        onTap: () {
          if (mainCubit.submitWord()) {
            dictionary.getAllLettersInList().asMap().map(
              (index, e) {
                final key = KeyboardKeys.values.firstWhere(
                  (element) => element.name(lang: lang) == e,
                );
                if (dictionary.secretWord[index] == e) {
                  mainCubit.updateKey(key, LetterStatus.correctSpot);
                  return MapEntry(index, e);
                }
                if (dictionary.secretWord.contains(e)) {
                  mainCubit.updateKey(key, LetterStatus.wrongSpot);
                  return MapEntry(index, e);
                }
                mainCubit.updateKey(key, LetterStatus.notInWords);
                return MapEntry(index, e);
              },
            );
          }
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColors.greyMain,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text(
            KeyboardKeys.enter.name(lang: lang)!.toUpperCase(),
            style: AppTextStyles.n14,
          ),
        ),
      ),
    );
  }

  double _getHeightByLang(final double width) {
    switch (lang) {
      case 0:
        return width * 0.07 / 2 * 3;
      case 1:
        return width * 0.059 / 2 * 3;
      default:
        return 0;
    }
  }
}

class DeleteKeyboardKey extends StatelessWidget {
  const DeleteKeyboardKey({Key? key, this.lang = 0}) : super(key: key);

  final int lang;

  @override
  Widget build(BuildContext context) {
    final mainCubit = BlocProvider.of<MainCubit>(context);
    final _width = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.only(left: 4),
      width: _getWidthByLang(_width),
      height: _getWidthByLang(_width),
      child: InkWell(
        onTap: mainCubit.removeLetter,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColors.greyMain,
            borderRadius: BorderRadius.circular(4),
          ),
          child: const Icon(Icons.backspace_outlined),
        ),
      ),
    );
  }

  double _getWidthByLang(final double width) {
    switch (lang) {
      case 0:
        return width * 0.07 / 2 * 3;
      case 1:
        return width * 0.059 / 2 * 3;
      default:
        return 0;
    }
  }
}
