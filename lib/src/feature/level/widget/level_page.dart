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
  late Future<List<GameResult>?> _getLevelsFuture;

  @override
  void initState() {
    super.initState();
    // ignore: discarded_futures
    _getLevelsFuture = context.dependencies.levelRepository.getLevels(widget.dictionary);
  }

  @override
  Widget build(BuildContext context) {
    return Title(
      color: Colors.black,
      title: context.l10n.levels,
      child: Scaffold(
        backgroundColor: context.theme.extension<BackgroundCustomColors>()?.background,
        appBar: AppBar(
          centerTitle: true,
          title: Text(context.l10n.levels, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 32)),
        ),
        body: ConstraintScreen(
          child: FutureBuilder(
            future: _getLevelsFuture,
            builder: (context, snapshot) {
              if (!snapshot.hasData || snapshot.data == null) {
                return const HaveNotPlayed();
              }
              final levels = snapshot.requireData;
              return GridView.builder(
                padding: const EdgeInsets.all(20),
                itemCount: levels!.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemBuilder: (context, index) => _LevelItem(level: levels[index], dictionary: widget.dictionary),
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
        color:
            level.isWin == null
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
              '${level.lvlNumber}\n${level.secretWord.toUpperCase()}',
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
        ),
      ),
    );
  }
}
