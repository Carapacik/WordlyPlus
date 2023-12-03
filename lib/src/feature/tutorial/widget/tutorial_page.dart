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
                Text(
                  context.r.tutorialTitle,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 16),
                Text.rich(
                  TextSpan(
                    children: [
                      const TextSpan(text: '\u2022'),
                      const WidgetSpan(child: SizedBox(width: 6)),
                      TextSpan(text: context.r.tutorialDescription1),
                    ],
                  ),
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 16),
                Text.rich(
                  TextSpan(
                    children: [
                      const TextSpan(text: '\u2022'),
                      const WidgetSpan(child: SizedBox(width: 6)),
                      TextSpan(
                        text: context.r.tutorialDescription2,
                      ),
                    ],
                  ),
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 16),
                const Divider(color: AppColors.secondary),
                const SizedBox(height: 16),
                Text(
                  context.r.examples,
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 16),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 350, maxHeight: 60),
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
                const SizedBox(height: 16),
                Text(
                  context.r.tutorialWordCorrectSpot,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 16),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 350, maxHeight: 60),
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
                const SizedBox(height: 16),
                Text(
                  context.r.tutorialWordWrongSpot,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 16),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 350, maxHeight: 60),
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
                Text(
                  context.r.tutorialNotInWordSpot,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 16),
                const Divider(color: AppColors.secondary),
                const SizedBox(height: 16),
                Text(
                  context.r.newWordAvailableEachDay.toUpperCase(),
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
          LetterInfo(letter: 'p', status: LetterStatus.correctSpot),
          LetterInfo(letter: 'a'),
          LetterInfo(letter: 'u'),
          LetterInfo(letter: 's'),
          LetterInfo(letter: 'e'),
        ];
      case const Locale('ru'):
        return const [
          LetterInfo(letter: 'п', status: LetterStatus.correctSpot),
          LetterInfo(letter: 'а'),
          LetterInfo(letter: 'у'),
          LetterInfo(letter: 'з'),
          LetterInfo(letter: 'а'),
        ];
    }
    return [];
  }

  List<LetterInfo> _wordWithWrongSpot(Locale dictionary) {
    switch (dictionary) {
      case const Locale('en'):
        return const [
          LetterInfo(letter: 'c'),
          LetterInfo(letter: 'r'),
          LetterInfo(letter: 'a', status: LetterStatus.wrongSpot),
          LetterInfo(letter: 'n'),
          LetterInfo(letter: 'e'),
        ];
      case const Locale('ru'):
        return const [
          LetterInfo(letter: 'ф'),
          LetterInfo(letter: 'и'),
          LetterInfo(letter: 'ш', status: LetterStatus.wrongSpot),
          LetterInfo(letter: 'к'),
          LetterInfo(letter: 'а'),
        ];
    }
    return [];
  }

  List<LetterInfo> _wordNotSpot(Locale dictionary) {
    switch (dictionary) {
      case const Locale('en'):
        return const [
          LetterInfo(letter: 's'),
          LetterInfo(letter: 'p'),
          LetterInfo(letter: 'o'),
          LetterInfo(letter: 'r'),
          LetterInfo(letter: 'e', status: LetterStatus.notInWord),
        ];
      case const Locale('ru'):
        return const [
          LetterInfo(letter: 'л'),
          LetterInfo(letter: 'е'),
          LetterInfo(letter: 'й'),
          LetterInfo(letter: 'к'),
          LetterInfo(letter: 'а', status: LetterStatus.notInWord),
        ];
    }
    return [];
  }
}
