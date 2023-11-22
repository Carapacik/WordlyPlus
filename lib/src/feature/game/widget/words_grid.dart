import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordly/src/feature/game/bloc/game_bloc.dart';
import 'package:wordly/src/feature/game/model/letter_info.dart';

class WordsGrid extends StatelessWidget {
  const WordsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 350),
        child: BlocBuilder<GameBloc, GameState>(
          builder: (context, state) {
            return GridView.builder(
              itemCount: 30,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              primary: false,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
              ),
              itemBuilder: (_, index) => GridTile(
                info: state.board.length > index ? state.board[index] : const LetterInfo(letter: ''),
              ),
            );
          },
        ),
      ),
    );
  }
}

class GridTile extends StatelessWidget {
  const GridTile({required this.info, super.key});

  final LetterInfo info;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        constraints: const BoxConstraints(maxHeight: 60, maxWidth: 60),
        decoration: BoxDecoration(
          color: info.status.cellColor(context),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: FittedBox(
            child: Text(
              info.letter.toUpperCase(),
              style: TextStyle(color: info.status.textColor(context)),
            ),
          ),
        ),
      ),
    );
  }
}
