import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordly/bloc/game/game_bloc.dart';
import 'package:wordly/data/models/dictionary_enum.dart';
import 'package:wordly/data/models/keyboard_keys.dart';
import 'package:wordly/resources/resources.dart';

class KeyboardKey extends StatelessWidget {
  const KeyboardKey({
    required this.keyboardKey,
    this.dictionary = DictionaryEnum.en,
    super.key,
  });

  final KeyboardKeys keyboardKey;
  final DictionaryEnum dictionary;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2),
      width: keyboardKey.size(
        context,
        dictionary: dictionary,
      ),
      child: AspectRatio(
        aspectRatio: dictionary.aspectRatio,
        child: InkWell(
          onTap: () {
            context.read<GameBloc>().add(GameEvent.letterPressed(keyboardKey));
          },
          borderRadius: BorderRadius.circular(6),
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: Colors.black12,
            ),
            child: Text(
              keyboardKey.fromDictionary(dictionary)?.toUpperCase() ?? '',
              style: context.theme.ll,
            ),
          ),
        ),
      ),
    );
  }
}

class EnterKeyboardKey extends StatelessWidget {
  const EnterKeyboardKey({this.dictionary = DictionaryEnum.en, super.key});

  final DictionaryEnum dictionary;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 2),
      height: KeyboardKeys.enter.size(
        context,
        dictionary: dictionary,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
      ),
      child: InkWell(
        onTap: () {
          context.read<GameBloc>().add(const GameEvent.enterPressed());
        },
        borderRadius: BorderRadius.circular(6),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          alignment: Alignment.center,
          color: Colors.black12,
          child: Text(
            KeyboardKeys.enter.fromDictionary(dictionary)!.toUpperCase(),
            style: context.theme.ll,
          ),
        ),
      ),
    );
  }
}

class DeleteKeyboardKey extends StatelessWidget {
  const DeleteKeyboardKey({this.dictionary = DictionaryEnum.en, super.key});

  final DictionaryEnum dictionary;

  @override
  Widget build(BuildContext context) {
    final size = KeyboardKeys.delete.size(context, dictionary: dictionary);
    return Container(
      margin: const EdgeInsets.only(left: 2),
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
      ),
      child: InkWell(
        onTap: () {
          context.read<GameBloc>().add(const GameEvent.deletePressed());
        },
        onLongPress: () {
          context.read<GameBloc>().add(const GameEvent.deleteLongPressed());
        },
        borderRadius: BorderRadius.circular(6),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          alignment: Alignment.center,
          color: Colors.black12,
          child: const Icon(Icons.backspace_outlined),
        ),
      ),
    );
  }
}
