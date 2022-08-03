import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordly/bloc/game/game_bloc.dart';
import 'package:wordly/bloc/levels/levels_bloc.dart';
import 'package:wordly/bloc/statistic/statistic_bloc.dart';
import 'package:wordly/presentation/pages/game/widgets/keyboard_by_language.dart';
import 'package:wordly/presentation/pages/game/widgets/word_grid.dart';
import 'package:wordly/presentation/pages/levels/levels_page.dart';
import 'package:wordly/presentation/pages/statistic/statistic_page.dart';
import 'package:wordly/presentation/widgets/widgets.dart';
import 'package:wordly/resources/resources.dart';
import 'package:wordly/utils/utils.dart';

class GamePage extends StatefulWidget {
  const GamePage({this.daily = true, super.key});

  final bool daily;

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  late final FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RawKeyboardListener(
      autofocus: true,
      focusNode: _focusNode,
      onKey: (event) {
        if (event is RawKeyDownEvent) {
          onKeyTap(context, event);
          return;
        }
      },
      child: BlocListener<GameBloc, GameState>(
        listener: (context, state) {
          final error = state.whenOrNull(error: (error) => error);
          if (error != null) {
            showFloatingSnackBar(context, message: error.getName(context));
          }
          final gameResult = state.whenOrNull(complete: (result) => result);
          if (gameResult != null) {
            showGameResultDialog(context, result: gameResult);
          }
        },
        child: Scaffold(
          drawer: const CustomDrawer(),
          appBar: CustomAppBar(
            title: widget.daily ? context.r.daily : context.r.levels,
            actions: [
              if (widget.daily)
                IconButton(
                  tooltip: context.r.view_statistic,
                  icon: const Icon(Icons.leaderboard),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (_) => BlocProvider<StatisticBloc>(
                          create: (context) => StatisticBloc(),
                          child: const StatisticPage(),
                        ),
                      ),
                    );
                  },
                )
              else
                IconButton(
                  tooltip: context.r.view_levels,
                  icon: const Icon(Icons.apps),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (_) => BlocProvider<LevelsBloc>(
                          create: (context) => LevelsBloc(),
                          child: const LevelsPage(),
                        ),
                      ),
                    );
                  },
                ),
            ],
          ),
          body: SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 8),
                const WordGrid(),
                const Spacer(),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 500),
                  child: const KeyboardByLanguage(),
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
