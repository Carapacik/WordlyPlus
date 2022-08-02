import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordly/bloc/game/game_bloc.dart';
import 'package:wordly/data/models/letter_info.dart';
import 'package:wordly/presentation/widgets/widgets.dart';
import 'package:wordly/resources/resources.dart';

class WordGrid extends StatelessWidget {
  const WordGrid({super.key});

  @override
  Widget build(BuildContext context) => ConstraintScreen(
        child: BlocBuilder<GameBloc, GameState>(
          buildWhen: (_, current) => current.isUpdate,
          builder: (context, state) {
            final gridInfo = state.maybeWhen(
              boardUpdate: (board) => board,
              wordSubmit: (board, _) => board,
              orElse: () => <LetterInfo>[],
            );
            return GridView.builder(
              itemCount: 30,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              primary: false,
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
              ),
              itemBuilder: (context, index) {
                final item = gridInfo.length > index
                    ? gridInfo[index]
                    : LetterInfo.empty();
                return _GridItem(info: item);
              },
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
            border: info.isStatusUnknown
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
              color: info.isStatusUnknown
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
