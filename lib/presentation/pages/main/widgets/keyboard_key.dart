import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordle/bloc/main/main_cubit.dart';
import 'package:wordle/data/data_singleton.dart';
import 'package:wordle/data/enums/keyboard_keys.dart';
import 'package:wordle/data/enums/letter.dart';

class KeyboardKey extends StatelessWidget {
  const KeyboardKey({
    Key? key,
    this.color = Colors.black26,
    required this.keyboardKey,
  }) : super(key: key);

  final Color color;
  final KeyboardKeys keyboardKey;

  @override
  Widget build(BuildContext context) {
    final homeCubit = BlocProvider.of<MainCubit>(context);
    return BlocBuilder<MainCubit, MainState>(
      buildWhen: (_, currentState) {
        if (currentState is KeyboardKeyUpdateState) {
          final KeyboardKeyUpdateState state = currentState;
          if (state.key.name == keyboardKey.name) {
            return true;
          }
        }
        return false;
      },
      builder: (context, currentState) {
        final data = DictionaryInteractor.getInstance();
        return Padding(
          padding: const EdgeInsets.all(4.0),
          child: InkWell(
            onTap: () {
              homeCubit.setLetter(keyboardKey);
            },
            child: AspectRatio(
              aspectRatio: 2 / 3,
              child: Container(
                decoration: BoxDecoration(
                  color: data.getKeyColor(keyboardKey),
                  borderRadius: BorderRadius.circular(4.6),
                ),
                child: Center(
                  child: Text(
                    keyboardKey.name.toUpperCase(),
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class EnterKeyboardKey extends StatelessWidget {
  const EnterKeyboardKey({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeCubit = BlocProvider.of<MainCubit>(context);
    final data = DictionaryInteractor.getInstance();
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: AspectRatio(
        aspectRatio: 1 / 1,
        child: InkWell(
          onTap: () {
            if (homeCubit.submitWord()) {
              data.gridData[data.currentWordIndex - 1]
                  .split("")
                  .asMap()
                  .map((index, e) {
                final key =
                    KeyboardKeys.values.firstWhere((KeyboardKeys element) {
                  return element.name == e;
                });
                if (data.secretWord[index] == e) {
                  homeCubit.updateKey(key, Letter.correctSpot);
                  return MapEntry(index, e);
                }
                if (data.secretWord.contains(e)) {
                  homeCubit.updateKey(key, Letter.wrongSpot);
                  return MapEntry(index, e);
                }
                homeCubit.updateKey(key, Letter.notInWord);
                return MapEntry(index, e);
              });
            }
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black26,
              borderRadius: BorderRadius.circular(4.6),
            ),
            child: Center(
              child: Text(
                KeyboardKeys.enter.name.toUpperCase(),
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class BackspaceKeyboardKey extends StatelessWidget {
  const BackspaceKeyboardKey({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeCubit = BlocProvider.of<MainCubit>(context);
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: AspectRatio(
        aspectRatio: 1 / 1,
        child: InkWell(
          onTap: () {
            homeCubit.removeLetter();
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black26,
              borderRadius: BorderRadius.circular(4.6),
            ),
            child: const Center(
              child: Icon(Icons.backspace_outlined),
            ),
          ),
        ),
      ),
    );
  }
}
