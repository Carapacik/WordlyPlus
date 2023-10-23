import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordly/src/feature/app/widget/dictionary_scope.dart';
import 'package:wordly/src/feature/game/logic/game_bloc.dart';
import 'package:wordly/src/feature/game/model/keyboard.dart';
import 'package:wordly/src/feature/game/model/letter_info.dart';

class KeyboardByLanguage extends StatelessWidget {
  const KeyboardByLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: switch (DictionaryScope.of(context).dictionary) {
        const Locale('en') => const KeyboardEn(),
        const Locale('ru') => const KeyboardRu(),
        _ => const SizedBox.shrink(),
      },
    );
  }
}

class KeyboardEn extends StatelessWidget {
  const KeyboardEn({super.key});

  @override
  Widget build(BuildContext context) {
    final statuses = context.watch<GameBloc>().state.statuses;
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
    final statuses = context.watch<GameBloc>().state.statuses;
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

extension on Locale {
  double width(BuildContext context) {
    return switch (this) {
      const Locale('en') => (min(MediaQuery.sizeOf(context).width, 520) - 11 * 6) / 10,
      const Locale('ru') => (min(MediaQuery.sizeOf(context).width, 520) - 13 * 6) / 12,
      _ => 0,
    };
  }
}

class EnterKey extends StatelessWidget {
  const EnterKey({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 3),
      child: SizedBox(
        height: 58,
        width: DictionaryScope.of(context).dictionary.width(context) * 1.65,
        child: Material(
          color: Colors.grey,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          child: InkWell(
            onTap: () => context.read<GameBloc>().add(const GameEvent.enterPressed()),
            child: const FittedBox(
              child: Text('ENTER'),
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
    return Padding(
      padding: const EdgeInsets.only(left: 3),
      child: SizedBox(
        height: 58,
        width: DictionaryScope.of(context).dictionary.width(context) * 1.65,
        child: Material(
          color: Colors.grey,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          child: InkWell(
            onTap: () => context.read<GameBloc>().add(const GameEvent.deletePressed()),
            onLongPress: () => context.read<GameBloc>().add(const GameEvent.deleteLongPressed()),
            child: const FittedBox(
              child: Icon(Icons.backspace_outlined),
            ),
          ),
        ),
      ),
    );
  }
}

class KeyboardKey extends StatelessWidget {
  const KeyboardKey({
    required this.letter,
    required this.status,
    super.key,
  });

  final String letter;
  final LetterStatus status;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3),
      child: SizedBox(
        height: 58,
        width: DictionaryScope.of(context).dictionary.width(context),
        child: Material(
          color: status.color,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          child: InkWell(
            onTap: () {
              context.read<GameBloc>().add(GameEvent.letterPressed(letter));
            },
            child: FittedBox(child: Text(letter.toUpperCase())),
          ),
        ),
      ),
    );
  }
}
