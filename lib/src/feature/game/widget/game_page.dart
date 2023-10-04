import 'package:flutter/material.dart';
import 'package:wordly/src/core/extension/extensions.dart';
import 'package:wordly/src/feature/app/widget/dictionary_scope.dart';
import 'package:wordly/src/feature/components/widget/drawer.dart';
import 'package:wordly/src/feature/game/widget/keyboard_by_language.dart';
import 'package:wordly/src/feature/game/widget/words_grid.dart';
import 'package:wordly/src/feature/statistic/widget/statistic_page.dart';

class GamePage extends StatelessWidget {
  const GamePage({super.key});

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
                      dictionaryKey: DictionaryScope.of(context, listen: false).dictionary.languageCode,
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
