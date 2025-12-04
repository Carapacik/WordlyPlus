import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordly/src/core/constant/generated/fonts.gen.dart';
import 'package:wordly/src/core/constant/localization/localization.dart';
import 'package:wordly/src/feature/game/bloc/game_bloc.dart';
import 'package:wordly/src/feature/game/model/keyboard.dart';
import 'package:wordly/src/feature/game/model/letter_info.dart';
import 'package:wordly/src/feature/settings/widget/settings_scope.dart';

class KeyboardByLanguage extends StatelessWidget {
  const KeyboardByLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    final Locale dictionary =
        SettingsScope.settingsOf(context).dictionary ?? Localization.computeDefaultLocale(withDictionary: true);
    return SizedBox(
      height: 200,
      child: switch (dictionary.languageCode) {
        'en' => const KeyboardEn(),
        'ru' => const KeyboardRu(),
        _ => const SizedBox.shrink(),
      },
    );
  }
}

class KeyboardEn extends StatelessWidget {
  const KeyboardEn({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, LetterStatus> statuses = context.watch<GameBloc>().state.statuses;
    return Column(
      children: [
        const SizedBox(height: 8),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (var i = 0; i < KeyboardList.enKeyboard.$1.length; i++)
              KeyboardKey(
                letter: KeyboardList.enKeyboard.$1[i],
                status: statuses.containsKey(KeyboardList.enKeyboard.$1[i])
                    ? statuses[KeyboardList.enKeyboard.$1[i]]!
                    : LetterStatus.unknown,
              ),
          ],
        ),
        const Spacer(),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (var i = 0; i < KeyboardList.enKeyboard.$2.length; i++)
              KeyboardKey(
                letter: KeyboardList.enKeyboard.$2[i],
                status: statuses.containsKey(KeyboardList.enKeyboard.$2[i])
                    ? statuses[KeyboardList.enKeyboard.$2[i]]!
                    : LetterStatus.unknown,
              ),
          ],
        ),
        const Spacer(),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const EnterKey(),
            for (var i = 0; i < KeyboardList.enKeyboard.$3.length; i++)
              KeyboardKey(
                letter: KeyboardList.enKeyboard.$3[i],
                status: statuses.containsKey(KeyboardList.enKeyboard.$3[i])
                    ? statuses[KeyboardList.enKeyboard.$3[i]]!
                    : LetterStatus.unknown,
              ),
            const DeleteKey(),
          ],
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}

class KeyboardRu extends StatelessWidget {
  const KeyboardRu({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, LetterStatus> statuses = context.watch<GameBloc>().state.statuses;
    return Column(
      children: [
        const SizedBox(height: 8),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (var i = 0; i < KeyboardList.ruKeyboard.$1.length; i++)
              KeyboardKey(
                letter: KeyboardList.ruKeyboard.$1[i],
                status: statuses.containsKey(KeyboardList.ruKeyboard.$1[i])
                    ? statuses[KeyboardList.ruKeyboard.$1[i]]!
                    : LetterStatus.unknown,
              ),
          ],
        ),
        const Spacer(),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (var i = 0; i < KeyboardList.ruKeyboard.$2.length; i++)
              KeyboardKey(
                letter: KeyboardList.ruKeyboard.$2[i],
                status: statuses.containsKey(KeyboardList.ruKeyboard.$2[i])
                    ? statuses[KeyboardList.ruKeyboard.$2[i]]!
                    : LetterStatus.unknown,
              ),
          ],
        ),
        const Spacer(),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const EnterKey(),
            for (var i = 0; i < KeyboardList.ruKeyboard.$3.length; i++)
              KeyboardKey(
                letter: KeyboardList.ruKeyboard.$3[i],
                status: statuses.containsKey(KeyboardList.ruKeyboard.$3[i])
                    ? statuses[KeyboardList.ruKeyboard.$3[i]]!
                    : LetterStatus.unknown,
              ),
            const DeleteKey(),
          ],
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}

class EnterKey extends StatelessWidget {
  const EnterKey({super.key});

  @override
  Widget build(BuildContext context) {
    final Locale dictionary =
        SettingsScope.settingsOf(context).dictionary ?? Localization.computeDefaultLocale(withDictionary: true);
    return Padding(
      padding: const EdgeInsets.only(right: 3),
      child: SizedBox(
        height: 58,
        width: dictionary.width(context) * 1.65,
        child: Material(
          color: LetterStatus.unknown.cellColor(context),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          child: InkWell(
            onTap: () => context.read<GameBloc>().add(const GameEvent.enterPressed()),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 4),
              child: FittedBox(child: Icon(Icons.send, color: LetterStatus.unknown.textColor(context))),
            ),
          ),
        ),
      ),
    );
  }
}

class DeleteKey extends StatelessWidget {
  const DeleteKey({super.key});

  @override
  Widget build(BuildContext context) {
    final Locale dictionary =
        SettingsScope.settingsOf(context).dictionary ?? Localization.computeDefaultLocale(withDictionary: true);
    return Padding(
      padding: const EdgeInsets.only(left: 3),
      child: SizedBox(
        height: 58,
        width: dictionary.width(context) * 1.65,
        child: Material(
          color: LetterStatus.unknown.cellColor(context),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          child: InkWell(
            onTap: () => context.read<GameBloc>().add(const GameEvent.deletePressed()),
            onLongPress: () => context.read<GameBloc>().add(const GameEvent.deleteLongPressed()),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 4),
              child: FittedBox(child: Icon(Icons.backspace_outlined, color: LetterStatus.unknown.textColor(context))),
            ),
          ),
        ),
      ),
    );
  }
}

class KeyboardKey extends StatelessWidget {
  const KeyboardKey({required this.letter, required this.status, super.key});

  final String letter;
  final LetterStatus status;

  @override
  Widget build(BuildContext context) {
    final Locale dictionary =
        SettingsScope.settingsOf(context).dictionary ?? Localization.computeDefaultLocale(withDictionary: true);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3),
      child: SizedBox(
        height: 58,
        width: dictionary.width(context),
        child: Material(
          color: status.cellColor(context),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          child: InkWell(
            onTap: () {
              context.read<GameBloc>().add(GameEvent.letterPressed(letter));
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
              child: FittedBox(
                child: Text(
                  letter.toUpperCase(),
                  style: TextStyle(color: status.textColor(context), fontFamily: FontFamily.robotoMono),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
