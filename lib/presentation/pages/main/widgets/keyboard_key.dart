import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordle/bloc/main/main_cubit.dart';
import 'package:wordle/data/dictionary_interactor.dart';
import 'package:wordle/data/entities/keyboard_keys.dart';
import 'package:wordle/data/entities/letter.dart';
import 'package:wordle/resources/app_colors.dart';
import 'package:wordle/resources/app_text_styles.dart';

class KeyboardKey extends StatelessWidget {
  const KeyboardKey({
    Key? key,
    required this.keyboardKey,
    this.flex = 10,
  }) : super(key: key);

  final KeyboardKeys keyboardKey;
  final int flex;

  @override
  Widget build(BuildContext context) {
    final mainCubit = BlocProvider.of<MainCubit>(context);
    return BlocBuilder<MainCubit, MainState>(
      buildWhen: (_, currentState) {
        if (currentState is KeyboardKeyUpdateState) {
          final KeyboardKeyUpdateState state = currentState;
          if (state.keyboardKey.name == keyboardKey.name) {
            return true;
          }
        }
        return false;
      },
      builder: (context, state) {
        final _dictionary = DictionaryInteractor.getInstance();
        return Flexible(
          flex: flex,
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: AspectRatio(
              aspectRatio: keyboardKey == KeyboardKeys.enter ? 1 : 2 / 3,
              child: InkWell(
                onTap: () => keyboardKey == KeyboardKeys.enter
                    ? _onEnterPressed(mainCubit, _dictionary)
                    : mainCubit.setLetter(keyboardKey),
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: _dictionary.getKeyColor(keyboardKey),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    keyboardKey.name()?.toUpperCase() ?? "",
                    style: AppTextStyles.n14,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _onEnterPressed(
    final MainCubit mainCubit,
    final DictionaryInteractor dictionary,
  ) {
    if (mainCubit.submitWord()) {
      dictionary.gridData[dictionary.currentWordIndex - 1]
          .split("")
          .asMap()
          .map(
        (index, e) {
          final key = KeyboardKeys.values.firstWhere(
            (KeyboardKeys element) {
              return element.name() == e;
            },
          );
          if (dictionary.secretWord[index] == e) {
            mainCubit.updateKey(key, Letter.correctSpot);
            return MapEntry(index, e);
          }
          if (dictionary.secretWord.contains(e)) {
            mainCubit.updateKey(key, Letter.wrongSpot);
            return MapEntry(index, e);
          }
          mainCubit.updateKey(key, Letter.notInWords);
          return MapEntry(index, e);
        },
      );
    }
  }
}

class DeleteKeyboardKey extends StatelessWidget {
  const DeleteKeyboardKey({
    Key? key,
    this.flex = 14,
  }) : super(key: key);

  final int flex;

  @override
  Widget build(BuildContext context) {
    final mainCubit = BlocProvider.of<MainCubit>(context);
    return Flexible(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: AspectRatio(
          aspectRatio: 1,
          child: InkWell(
            onTap: mainCubit.removeLetter,
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.greyMain,
                borderRadius: BorderRadius.circular(4),
              ),
              child: const Icon(Icons.backspace_outlined, size: 20),
            ),
          ),
        ),
      ),
    );
  }
}
