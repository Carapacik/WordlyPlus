import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordly/src/core/extension/extensions.dart';
import 'package:wordly/src/feature/app/widget/dictionary_scope.dart';
import 'package:wordly/src/feature/components/widget/drawer.dart';
import 'package:wordly/src/feature/game/logic/game_bloc.dart';
import 'package:wordly/src/feature/game/model/game_mode.dart';
import 'package:wordly/src/feature/game/widget/game_result_dialog.dart';
import 'package:wordly/src/feature/game/widget/keyboard_by_language.dart';
import 'package:wordly/src/feature/game/widget/words_grid.dart';
import 'package:wordly/src/feature/level/widget/level_page.dart';
import 'package:wordly/src/feature/statistic/widget/statistic_page.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final bloc = context.read<GameBloc>();
      final state = bloc.state;
      if (state.isResultState) {
        unawaited(
          showGameResultDialog(
            context,
            state.secretWord,
            context.dependencies.gameRepository.currentDictionary(state.dictionary)[state.secretWord] ?? '',
            state.gameMode,
            isWin: state.maybeMap(win: (_) => true, orElse: false),
            onTimerEnd: GameMode.daily == state.gameMode ? () => bloc.add(GameEvent.resetBoard(state.gameMode)) : null,
            nextLevelPressed: () => bloc.add(const GameEvent.resetBoard(GameMode.lvl)),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<GameBloc, GameState>(
      listenWhen: (previous, current) =>
          previous.gameCompleted != current.gameCompleted &&
          previous.gameMode == current.gameMode &&
          previous.dictionary == current.dictionary &&
          current.isResultState,
      listener: (context, state) {
        if (state.isResultState) {
          unawaited(
            showGameResultDialog(
              context,
              state.secretWord,
              context.dependencies.gameRepository.currentDictionary(state.dictionary)[state.secretWord] ?? '',
              state.gameMode,
              isWin: state.maybeMap(win: (_) => true, orElse: false),
              onTimerEnd: GameMode.daily == state.gameMode
                  ? () {
                      Navigator.of(context).pop();
                      context.read<GameBloc>().add(GameEvent.resetBoard(state.gameMode));
                    }
                  : null,
              nextLevelPressed: () {
                Navigator.of(context).pop();
                context.read<GameBloc>().add(const GameEvent.resetBoard(GameMode.lvl));
              },
            ),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: BlocBuilder<GameBloc, GameState>(
            builder: (context, state) => Text(
              state.gameMode == GameMode.daily ? context.r.daily : context.r.levelNumber(state.lvlNumber ?? 1),
            ),
          ),
          actions: [
            BlocBuilder<GameBloc, GameState>(
              builder: (context, state) {
                if (state.gameMode == GameMode.daily) {
                  return IconButton(
                    tooltip: context.r.viewStatistic,
                    icon: const Icon(Icons.leaderboard),
                    onPressed: () async {
                      await Navigator.of(context).push(
                        MaterialPageRoute<void>(
                          builder: (context) => StatisticPage(
                            dictionary: DictionaryScope.of(context, listen: false).dictionary,
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return IconButton(
                    tooltip: context.r.viewLevels,
                    icon: const Icon(Icons.apps),
                    onPressed: () async {
                      await Navigator.of(context).push(
                        MaterialPageRoute<void>(
                          builder: (context) => LevelPage(
                            dictionary: DictionaryScope.of(context, listen: false).dictionary,
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ],
        ),
        drawer: const CustomDrawer(),
        body: const GameBody(),
      ),
    );
  }
}

class GameBody extends StatelessWidget {
  const GameBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Column(
        children: [
          Center(child: WordsGrid()),
          Center(child: KeyboardByLanguage()),
        ],
      ),
    );
  }
}
