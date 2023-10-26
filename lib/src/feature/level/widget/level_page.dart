import 'package:flutter/material.dart';
import 'package:wordly/src/core/extension/extensions.dart';
import 'package:wordly/src/feature/game/model/game_result.dart';

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
    return const Scaffold();
  }
}
