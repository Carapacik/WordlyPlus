import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordly/bloc/locale/locale_bloc.dart';
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
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: ConstraintScreen(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      context.r.tutorial_text,
                      style: context.theme.bl,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    _SpotWord(
                      typeIndex: 0,
                      letterIndex: 0,
                      letter: context.r.the_letter,
                      spot: context.r.letter_correct_spot,
                    ),
                    const SizedBox(height: 16),
                    _SpotWord(
                      typeIndex: 1,
                      letterIndex: 2,
                      letter: context.r.the_letter,
                      spot: context.r.letter_wrong_spot,
                    ),
                    const SizedBox(height: 16),
                    _SpotWord(
                      typeIndex: 2,
                      letterIndex: 4,
                      letter: context.r.the_letters,
                      spot: context.r.letter_not_in_word,
                    ),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute<void>(
                            builder: (context) => const GamePage(),
                          ),
                          (route) => false,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: context.dynamicColor(
                          light: AppColors.greyLight,
                          dark: AppColors.greyDark,
                        ),
                      ),
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(text: context.r.start),
                            WidgetSpan(
                              alignment: PlaceholderAlignment.middle,
                              baseline: TextBaseline.alphabetic,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 6),
                                child: Icon(
                                  Icons.adaptive.arrow_forward,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                        style: context.theme.blb.copyWith(color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
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
    required this.letter,
    required this.spot,
    super.key,
  });

  final int typeIndex;
  final int letterIndex;
  final String letter;
  final String spot;

  @override
  Widget build(BuildContext context) {
    final localeValue = context.read<LocaleBloc>().state.locale;
    final letters = localeValue.examplesList[typeIndex].characters.toList();
    return Column(
      children: [
        Center(
          child: SizedBox(
            height: 60,
            child: ListView.separated(
              primary: false,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: letters.length,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) => TileItem(
                info: LetterInfo(
                  letter: letters[index],
                  letterStatus: letterIndex == index
                      ? LetterStatus.values[typeIndex]
                      : LetterStatus.unknown,
                ),
              ),
              separatorBuilder: (context, index) => const SizedBox(width: 8),
            ),
          ),
        ),
        const SizedBox(height: 12),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(text: letter),
              TextSpan(
                text: letters[letterIndex].toUpperCase(),
                style: context.theme.blb,
              ),
              TextSpan(text: spot),
            ],
            style: context.theme.bl,
          ),
        ),
      ],
    );
  }
}
