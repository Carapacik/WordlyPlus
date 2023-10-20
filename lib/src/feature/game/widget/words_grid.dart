import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordly/src/feature/game/logic/game_bloc.dart';
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
                letter: state.board.length > index ? state.board[index] : const LetterInfo(letter: ''),
              ),
            );
          },
        ),
      ),
    );
  }
}

class GridTile extends StatelessWidget {
  const GridTile({required this.letter, super.key});

  final LetterInfo letter;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        constraints: const BoxConstraints(maxHeight: 60, maxWidth: 60),
        decoration: BoxDecoration(
          color: letter.status.color,
          borderRadius: BorderRadius.circular(6),
          border: letter.status == LetterStatus.unknown
              ? Border.all(
                  width: 3,
                  color: Colors.grey,
                )
              : Border.all(
                  width: 3,
                  color: Colors.transparent,
                ),
        ),
        child: FittedBox(
          child: Text(letter.letter.toUpperCase()),
        ),
      ),
    );
  }
}
