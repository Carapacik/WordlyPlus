import 'package:flutter/material.dart';
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
          onTap: () {},
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: Colors.black12,
            ),
            child: Text(
              'S',
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
      child: InkWell(
        onTap: () {},
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text(
            KeyboardKeys.enter.fromDictionaryLang(dictionary)!.toUpperCase(),
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
    return Container(
      margin: const EdgeInsets.only(left: 2),
      width: KeyboardKeys.delete.size(
        context,
        dictionary: dictionary,
      ),
      height: KeyboardKeys.delete.size(
        context,
        dictionary: dictionary,
      ),
      child: InkWell(
        // onTap: mainCubit.removeLetter,
        // onLongPress: mainCubit.removeFullWord,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.circular(4),
          ),
          child: const Icon(Icons.backspace_outlined),
        ),
      ),
    );
  }
}
