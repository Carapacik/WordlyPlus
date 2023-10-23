import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordly/src/core/extension/extensions.dart';
import 'package:wordly/src/feature/app/widget/dictionary_scope.dart';
import 'package:wordly/src/feature/components/widget/drawer.dart';
import 'package:wordly/src/feature/game/logic/game_bloc.dart';
import 'package:wordly/src/feature/game/widget/keyboard_by_language.dart';
import 'package:wordly/src/feature/game/widget/words_grid.dart';
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
      // TODO(Carapacik): dialog
      final state = context.read<GameBloc>().state;
      if (state.maybeMap(win: (_) => true, orElse: false)) {
        unawaited(
          showDialog<void>(
            context: context,
            builder: (context) => const Dialog(
              child: Text('WIN'),
            ),
          ),
        );
        return;
      }
      if (state.maybeMap(loss: (_) => true, orElse: false)) {
        unawaited(
          showDialog<void>(
            context: context,
            builder: (context) => const Dialog(
              child: Text('LOSS'),
            ),
          ),
        );
        return;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          if (true)
            IconButton(
              tooltip: context.r.view_statistic,
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
            )
          else
            IconButton(
              tooltip: context.r.view_levels,
              icon: const Icon(Icons.apps),
              onPressed: () {},
            ),
        ],
      ),
      drawer: const CustomDrawer(),
      body: const GameBody(),
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
