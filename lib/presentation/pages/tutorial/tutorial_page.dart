import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordly/bloc/dictionary/dictionary_bloc.dart';
import 'package:wordly/data/models.dart';
import 'package:wordly/presentation/pages/game/game_page.dart';
import 'package:wordly/presentation/widgets/widgets.dart';
import 'package:wordly/resources/resources.dart';

class TutorialPage extends StatelessWidget {
  const TutorialPage({super.key});

  @override
  Widget build(BuildContext context) => Title(
        color: AppColors.dark,
        title: context.r.how_to_play,
        child: Scaffold(
          appBar: CustomAppBar(title: context.r.how_to_play),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                children: [
                  const Text(
                    'Each guess must be a valid 5-letter word. Hit the enter button to submit.\n'
                    'After each guess, the color of the tiles will change to show how close your guess was to the word.',
                  ),
                  const SizedBox(height: 12),
                  const _SpotWord(typeIndex: 0, letterIndex: 0),
                  const SizedBox(height: 4),
                  const Text(
                      'The letter P is in the word and in the correct spot.'),
                  const SizedBox(height: 12),
                  const _SpotWord(typeIndex: 1, letterIndex: 2),
                  const SizedBox(height: 4),
                  const Text(
                      'The letter A is in the word and in the correct spot.'),
                  const SizedBox(height: 12),
                  const _SpotWord(typeIndex: 2, letterIndex: 4),
                  const SizedBox(height: 4),
                  const Text(
                      'The letter E is in the word and in the correct spot.'),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute<void>(
                          builder: (context) => const GamePage(),
                        ),
                        (route) => false,
                      );
                    },
                    child: const Text('PLAY'),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}

class _SpotWord extends StatelessWidget {
  const _SpotWord({
    required this.typeIndex,
    required this.letterIndex,
    super.key,
  });

  final int typeIndex;
  final int letterIndex;

  @override
  Widget build(BuildContext context) {
    final dictionary = context.read<DictionaryBloc>().state.dictionary;
    final letters = dictionary.examplesList[typeIndex].characters.toList();
    return SizedBox(
      height: 60,
      child: ListView.separated(
        primary: false,
        scrollDirection: Axis.horizontal,
        itemCount: letters.length,
        itemBuilder: (context, index) => CubicItem(
          info: LetterInfo(
            letter: letters[index],
            letterStatus: letterIndex == index
                ? LetterStatus.values[typeIndex]
                : LetterStatus.unknown,
          ),
        ),
        separatorBuilder: (context, index) => const SizedBox(width: 8),
      ),
    );
  }
}
