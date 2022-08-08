import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordly/bloc/game/game_bloc.dart';
import 'package:wordly/data/models.dart';
import 'package:wordly/presentation/widgets/widgets.dart';

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
                    : const LetterInfo.empty();
                return CubicItem(info: item);
              },
            );
          },
        ),
      );
}
