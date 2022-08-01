import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordly/bloc/game/game_bloc.dart';
import 'package:wordly/data/models/letter_info.dart';
import 'package:wordly/data/models/letter_status.dart';
import 'package:wordly/presentation/widgets/widgets.dart';
import 'package:wordly/resources/resources.dart';

class WordGrid extends StatelessWidget {
  const WordGrid({super.key});

  @override
  Widget build(BuildContext context) => ConstraintScreen(
        child: BlocBuilder<GameBloc, GameState>(
          buildWhen: (_, current) => current.isBoardUpdate,
          builder: (context, state) {
            final gridInfo = state.maybeWhen(
              boardUpdate: (board) => board,
              orElse: () => <LetterInfo>[],
            );
            return GridView.count(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              primary: false,
              shrinkWrap: true,
              crossAxisCount: 5,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              children: List.generate(30, (index) {
                final item = gridInfo.length > index
                    ? gridInfo[index]
                    : LetterInfo.empty();
                return _GridItem(info: item);
              }),
            );
          },
        ),
      );
}

class _GridItem extends StatelessWidget {
  const _GridItem({required this.info, super.key});

  final LetterInfo info;

  @override
  Widget build(BuildContext context) => AspectRatio(
        aspectRatio: 1,
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color:
                info.letterStatus.gridItemColor(context, isHighContrast: true),
            border: info.letterStatus == LetterStatus.unknown
                ? Border.all(
                    width: 3,
                    color: context.dynamicColor(
                      light: Colors.black,
                      dark: Colors.white,
                    ),
                  )
                : null,
          ),
          child: Text(
            info.letter.toUpperCase(),
            style: context.theme.tl.copyWith(
              color: info.letterStatus == LetterStatus.unknown
                  ? null
                  : context.dynamicColor(
                      light: Colors.black,
                      dark: Colors.white,
                    ),
            ),
          ),
        ),
      );
}
