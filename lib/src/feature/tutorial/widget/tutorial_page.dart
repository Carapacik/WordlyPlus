import 'package:flutter/material.dart';
import 'package:wordly/src/core/resources/resources.dart';
import 'package:wordly/src/core/utils/extensions/extensions.dart';
import 'package:wordly/src/feature/components/widget/constraint_screen.dart';
import 'package:wordly/src/feature/components/widget/letter_tile.dart';
import 'package:wordly/src/feature/game/model/letter_info.dart';
import 'package:wordly/src/feature/settings/widget/settings_scope.dart';

class TutorialPage extends StatelessWidget {
  const TutorialPage({super.key});

  @override
  Widget build(BuildContext context) {
    final dictionary = SettingsScope.dictionaryOf(context).dictionary;
    final wordWithCorrectSpot = _wordWithCorrectSpot(dictionary);
    final wordWithWrongSpot = _wordWithWrongSpot(dictionary);
    final wordNotSpot = _wordNotSpot(dictionary);
    return Title(
      color: Colors.black,
      title: context.r.tutorial,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            context.r.tutorial,
            style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 32),
          ),
        ),
        body: ConstraintScreen(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ListView(
              padding: EdgeInsets.only(bottom: MediaQuery.paddingOf(context).bottom + 16),
              children: [
                const Text(
                  'Guess the WORD in 6 tries.',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Each guess must be a valid 5 letter word. Hit the enter button to submit.',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 16),
                const Text(
                  'After each guess, the color of the tiles will change to show how close your guess was to the word.',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 16),
                const Divider(color: AppColors.secondary),
                const SizedBox(height: 16),
                const Text(
                  'Examples',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                ),
                Center(
                  child: ListView.separated(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    primary: false,
                    scrollDirection: Axis.horizontal,
                    itemCount: wordWithCorrectSpot.length,
                    separatorBuilder: (_, __) => const SizedBox(width: 8),
                    itemBuilder: (context, index) => LetterTile(info: wordWithCorrectSpot[index]),
                  ),
                ),
                Center(
                  child: ListView.separated(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    primary: false,
                    scrollDirection: Axis.horizontal,
                    itemCount: wordWithWrongSpot.length,
                    separatorBuilder: (_, __) => const SizedBox(width: 8),
                    itemBuilder: (context, index) => LetterTile(info: wordWithWrongSpot[index]),
                  ),
                ),
                Center(
                  child: ListView.separated(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    primary: false,
                    scrollDirection: Axis.horizontal,
                    itemCount: wordNotSpot.length,
                    separatorBuilder: (_, __) => const SizedBox(width: 8),
                    itemBuilder: (context, index) => LetterTile(info: wordNotSpot[index]),
                  ),
                ),
                const SizedBox(height: 16),
                const Divider(color: AppColors.secondary),
                const SizedBox(height: 16),
                Text(
                  'A new WORD will be available each day!'.toUpperCase(),
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<LetterInfo> _wordWithCorrectSpot(Locale dictionary) {
    switch (dictionary) {
      case const Locale('en'):
        return const [
          LetterInfo(letter: 'w', status: LetterStatus.correctSpot),
          LetterInfo(letter: 'e'),
          LetterInfo(letter: 'a'),
          LetterInfo(letter: 'r'),
          LetterInfo(letter: 'y'),
        ];
      case const Locale('ru'):
        return const [
          LetterInfo(letter: 'п', status: LetterStatus.correctSpot),
          LetterInfo(letter: 'а'),
          LetterInfo(letter: 'у', status: LetterStatus.notInWord),
          LetterInfo(letter: 'з', status: LetterStatus.wrongSpot),
          LetterInfo(letter: 'а'),
        ];
    }
    return [];
  }

  List<LetterInfo> _wordWithWrongSpot(Locale dictionary) {
    switch (dictionary) {
      case const Locale('en'):
        return const [
          LetterInfo(letter: 'p'),
          LetterInfo(letter: 'i', status: LetterStatus.wrongSpot),
          LetterInfo(letter: 'l'),
          LetterInfo(letter: 'l'),
          LetterInfo(letter: 's'),
        ];
      case const Locale('ru'):
        return const [
          LetterInfo(letter: 'п', status: LetterStatus.correctSpot),
          LetterInfo(letter: 'а'),
          LetterInfo(letter: 'у', status: LetterStatus.notInWord),
          LetterInfo(letter: 'з', status: LetterStatus.wrongSpot),
          LetterInfo(letter: 'а'),
        ];
    }
    return [];
  }

  List<LetterInfo> _wordNotSpot(Locale dictionary) {
    switch (dictionary) {
      case const Locale('en'):
        return const [
          LetterInfo(letter: 'v'),
          LetterInfo(letter: 'a'),
          LetterInfo(letter: 'g'),
          LetterInfo(letter: 'u', status: LetterStatus.notInWord),
          LetterInfo(letter: 'e'),
        ];
      case const Locale('ru'):
        return const [
          LetterInfo(letter: 'п', status: LetterStatus.correctSpot),
          LetterInfo(letter: 'а'),
          LetterInfo(letter: 'у', status: LetterStatus.notInWord),
          LetterInfo(letter: 'з', status: LetterStatus.wrongSpot),
          LetterInfo(letter: 'а'),
        ];
    }
    return [];
  }
}
