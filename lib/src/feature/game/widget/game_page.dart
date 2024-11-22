import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordly/src/core/constant/localization/localization.dart';
import 'package:wordly/src/core/utils/extensions/extensions.dart';
import 'package:wordly/src/core/utils/share.dart';
import 'package:wordly/src/feature/components/widget/drawer.dart';
import 'package:wordly/src/feature/game/bloc/game_bloc.dart';
import 'package:wordly/src/feature/game/model/game_mode.dart';
import 'package:wordly/src/feature/game/model/letter_info.dart';
import 'package:wordly/src/feature/game/widget/game_result_dialog.dart';
import 'package:wordly/src/feature/game/widget/keyboard_by_language.dart';
import 'package:wordly/src/feature/game/widget/words_grid.dart';
import 'package:wordly/src/feature/level/widget/level_page.dart';
import 'package:wordly/src/feature/settings/widget/settings_scope.dart';
import 'package:wordly/src/feature/statistic/widget/statistic_page.dart';
import 'package:wordly/src/feature/tutorial/widget/tutorial_page.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  late final FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final navigator = Navigator.of(context);
      final gameRepository = context.dependencies.gameRepository;
      final bloc = context.read<GameBloc>();
      final state = bloc.state;
      if (state.isResultState) {
        unawaited(
          showGameResultDialog(
            context,
            state.secretWord,
            context.dependencies.gameRepository.currentDictionary(state.dictionary)[state.secretWord] ?? '',
            state.gameMode,
            isWin: state.maybeMap(win: (_) => true, orElse: () => false),
            onTimerEnd: GameMode.daily == state.gameMode ? () => bloc.add(GameEvent.resetBoard(state.gameMode)) : null,
            shareString: shareString(context, state.buildResultString),
            nextLevelPressed: () => bloc.add(const GameEvent.resetBoard(GameMode.lvl)),
          ),
        );
      }
      final isFirstEnter = await gameRepository.isFirstEnter;
      if (isFirstEnter) {
        unawaited(gameRepository.setFirstEnter());
        unawaited(
          navigator.push(
            MaterialPageRoute<void>(
              builder: (context) => const TutorialPage(),
              fullscreenDialog: true,
            ),
          ),
        );
        return;
      }
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardListener(
      focusNode: _focusNode,
      autofocus: true,
      onKeyEvent: (event) {
        if (event is KeyDownEvent) {
          context.read<GameBloc>().add(GameEvent.listenKeyEvent(event));
        }
      },
      child: Scaffold(
        backgroundColor: context.theme.extension<BackgroundCustomColors>()?.background,
        appBar: AppBar(
          centerTitle: true,
          title: BlocBuilder<GameBloc, GameState>(
            builder: (context, state) => Text(
              state.gameMode == GameMode.daily ? context.l10n.daily : context.l10n.levelNumber(state.lvlNumber ?? 1),
              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 32),
            ),
          ),
          actions: [
            BlocBuilder<GameBloc, GameState>(
              builder: (context, state) {
                if (state.gameMode == GameMode.daily) {
                  return IconButton(
                    tooltip: context.l10n.viewStatistic,
                    icon: const Icon(Icons.leaderboard_outlined),
                    onPressed: () async {
                      await Navigator.of(context).push(
                        MaterialPageRoute<void>(
                          builder: (context) => StatisticPage(
                            dictionary: SettingsScope.settingsOf(context).dictionary ??
                                Localization.computeDefaultLocale(withDictionary: true),
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return IconButton(
                    tooltip: context.l10n.viewLevels,
                    icon: const Icon(Icons.apps),
                    onPressed: () async {
                      await Navigator.of(context).push(
                        MaterialPageRoute<void>(
                          builder: (context) => LevelPage(
                            dictionary: SettingsScope.settingsOf(context).dictionary ??
                                Localization.computeDefaultLocale(withDictionary: true),
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
    final useSpacer = MediaQuery.sizeOf(context).height > 800;
    return BlocListener<GameBloc, GameState>(
      listenWhen: (previous, current) =>
          (previous.gameCompleted != current.gameCompleted &&
              previous.gameMode == current.gameMode &&
              previous.dictionary == current.dictionary &&
              current.isResultState) ||
          current.isErrorState,
      listener: (context, state) {
        if (state.isResultState) {
          final bloc = context.read<GameBloc>();
          unawaited(
            showGameResultDialog(
              context,
              state.secretWord,
              context.dependencies.gameRepository.currentDictionary(state.dictionary)[state.secretWord] ?? '',
              state.gameMode,
              isWin: state.maybeMap(win: (_) => true, orElse: () => false),
              onTimerEnd: GameMode.daily == state.gameMode
                  ? () {
                      Navigator.of(context).pop();
                      bloc.add(GameEvent.resetBoard(state.gameMode));
                    }
                  : null,
              shareString: shareString(context, state.buildResultString),
              nextLevelPressed: () {
                Navigator.of(context).pop();
                bloc.add(const GameEvent.resetBoard(GameMode.lvl));
              },
            ),
          );
          return;
        }
        if (state.isErrorState) {
          final error = state.mapOrNull(error: (s) => s.error);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: LetterStatus.unknown.cellColor(context),
              content: Text(
                error?.localizedText(context) ?? '',
                style: TextStyle(color: LetterStatus.unknown.textColor(context), fontSize: 16),
                textAlign: TextAlign.center,
              ),
              duration: const Duration(seconds: 2),
              behavior: SnackBarBehavior.floating,
              dismissDirection: DismissDirection.up,
              width: 350,
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
          );
        }
      },
      child: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 12),
            const Center(child: WordsGrid()),
            if (useSpacer) const Spacer(),
            const Center(child: KeyboardByLanguage()),
            if (useSpacer) const Spacer(),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
