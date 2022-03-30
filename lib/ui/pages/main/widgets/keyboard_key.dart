import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:wordly/bloc/main/main_cubit.dart';
import 'package:wordly/bloc/settings/settings_cubit.dart';
import 'package:wordly/data/models/dictionary_languages.dart';
import 'package:wordly/data/models/keyboard_keys.dart';
import 'package:wordly/data/models/letter_status.dart';
import 'package:wordly/data/repositories/dictionary_repository.dart';
import 'package:wordly/resources/typography.dart';

class KeyboardKey extends StatelessWidget {
  const KeyboardKey({
    Key? key,
    required this.keyboardKey,
    this.lang = DictionaryLanguages.en,
  }) : super(key: key);

  final KeyboardKeys keyboardKey;
  final DictionaryLanguages lang;

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
        final dictionaryRepository = GetIt.I<DictionaryRepository>();
        final parentWidth = MediaQuery.of(context).size.width > 500
            ? 500
            : MediaQuery.of(context).size.width;
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 2),
          width: keyboardKey.width(language: lang, parentWidth: parentWidth),
          child: AspectRatio(
            aspectRatio: lang == DictionaryLanguages.en ? 2 / 3 : 2 / 3.5,
            child: InkWell(
              onTap: () {
                mainCubit.setLetter(keyboardKey);
              },
              child: BlocBuilder<SettingsCubit, SettingsState>(
                buildWhen: (previous, current) =>
                    previous.isHighContrast != current.isHighContrast,
                builder: (context, state) {
                  return Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: dictionaryRepository
                          .getKeyStatus(keyboardKey.name(lang))
                          .color(context, highContrast: state.isHighContrast),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      keyboardKey.name(lang)?.toUpperCase() ?? "",
                      style: AppTypography.n14,
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}

class EnterKeyboardKey extends StatelessWidget {
  const EnterKeyboardKey({
    Key? key,
    this.lang = DictionaryLanguages.en,
  }) : super(key: key);

  final DictionaryLanguages lang;

  @override
  Widget build(BuildContext context) {
    final dictionaryRepository = GetIt.I<DictionaryRepository>();
    final mainCubit = BlocProvider.of<MainCubit>(context);
    final width = MediaQuery.of(context).size.width > 500
        ? 500
        : MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.only(right: 2),
      height: KeyboardKeys.enter.width(language: lang, parentWidth: width),
      child: InkWell(
        onTap: () {
          final wordComplete = mainCubit.completeWord();
          if (wordComplete) {
            dictionaryRepository.getAllLettersInList().map(
              (index, value) {
                final key = KeyboardKeys.values.firstWhere(
                  (element) => element.name(lang) == value,
                );
                if (dictionaryRepository.secretWord[index] == value) {
                  mainCubit.updateKey(key, LetterStatus.correctSpot);
                  return MapEntry(index, value);
                }
                if (dictionaryRepository.secretWord.contains(value)) {
                  mainCubit.updateKey(key, LetterStatus.wrongSpot);
                  return MapEntry(index, value);
                }
                mainCubit.updateKey(key, LetterStatus.notInWords);
                return MapEntry(index, value);
              },
            );
          }
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text(
            KeyboardKeys.enter.name(lang)!.toUpperCase(),
            style: AppTypography.n14,
          ),
        ),
      ),
    );
  }
}

class DeleteKeyboardKey extends StatelessWidget {
  const DeleteKeyboardKey({
    Key? key,
    this.lang = DictionaryLanguages.en,
  }) : super(key: key);

  final DictionaryLanguages lang;

  @override
  Widget build(BuildContext context) {
    final mainCubit = BlocProvider.of<MainCubit>(context);
    final width = MediaQuery.of(context).size.width > 500
        ? 500
        : MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.only(left: 2),
      width: KeyboardKeys.delete.width(language: lang, parentWidth: width),
      height: KeyboardKeys.delete.width(language: lang, parentWidth: width),
      child: InkWell(
        onTap: () async {
          mainCubit.removeLetter();
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(4),
          ),
          child: const Icon(Icons.backspace_outlined),
        ),
      ),
    );
  }
}
