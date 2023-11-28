import 'package:flutter/material.dart';
import 'package:wordly/src/core/resources/resources.dart';
import 'package:wordly/src/core/utils/extensions/extensions.dart';
import 'package:wordly/src/feature/components/widget/constraint_screen.dart';
import 'package:wordly/src/feature/components/widget/not_played.dart';
import 'package:wordly/src/feature/game/model/game_result.dart';
import 'package:wordly/src/feature/level/widget/level_dialog.dart';

class LevelPage extends StatefulWidget {
  const LevelPage({required this.dictionary, super.key});

  final Locale dictionary;

  @override
  State<LevelPage> createState() => _LevelPageState();
}

class _LevelPageState extends State<LevelPage> {
  List<GameResult>? _levels;

  @override
  void initState() {
    super.initState();
    _levels = context.dependencies.levelRepository.loadLevelFromCache(widget.dictionary);
  }

  @override
  Widget build(BuildContext context) {
    return Title(
      color: Colors.black,
      title: context.r.levels,
      child: Scaffold(
        appBar: AppBar(title: Text(context.r.levels), centerTitle: true),
        body: ConstraintScreen(
          child: Builder(
            builder: (context) {
              if (_levels == null) {
                return const HaveNotPlayed();
              }
              return GridView.builder(
                padding: const EdgeInsets.all(20),
                itemCount: _levels!.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemBuilder: (context, index) => _LevelItem(
                  level: _levels![index],
                  dictionary: widget.dictionary,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class _LevelItem extends StatelessWidget {
  const _LevelItem({required this.level, required this.dictionary});

  final GameResult level;
  final Locale dictionary;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Material(
        clipBehavior: Clip.hardEdge,
        borderRadius: BorderRadius.circular(8),
        color: level.isWin == null
            ? AppColors.grey
            : level.isWin!
                ? AppColors.green
                : AppColors.red,
        child: InkWell(
          onTap: () async {
            if (level.isWin != null) {
              await showLevelDialog(
                context,
                word: level.secretWord,
                isWin: level.isWin!,
                meaning: context.dependencies.gameRepository.currentDictionary(dictionary)[level.secretWord] ?? '',
              );
            }
          },
          child: Center(
            child: Text(
              '${level.lvlNumber}\n${level.secretWord}',
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
