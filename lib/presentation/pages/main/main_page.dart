import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:wordly/bloc/main/main_cubit.dart';
import 'package:wordly/bloc/settings/settings_cubit.dart';
import 'package:wordly/data/models/dictionary_languages.dart';
import 'package:wordly/data/models/flushbar_types.dart';
import 'package:wordly/domain/level_repository.dart';
import 'package:wordly/presentation/pages/levels/levels_page.dart';
import 'package:wordly/presentation/pages/main/widgets/keyboard_en.dart';
import 'package:wordly/presentation/pages/main/widgets/keyboard_ru.dart';
import 'package:wordly/presentation/pages/main/widgets/word_grid.dart';
import 'package:wordly/presentation/pages/statistic/statistic_page.dart';
import 'package:wordly/presentation/widgets/widgets.dart';
import 'package:wordly/utils/utils.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      checkResultDialog(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final levelRepository = GetIt.I<LevelRepository>();
    return BlocConsumer<MainCubit, MainState>(
      listener: (context, state) async {
        if (state is TopMessageState) {
          switch (state.type) {
            case SnackbarType.notFound:
              await showSnackBar(
                context,
                message: R.stringsOf(context).word_not_found,
              );
              break;
            case SnackbarType.notCorrectLength:
              await showSnackBar(
                context,
                message: R.stringsOf(context).word_too_short,
              );
              break;
          }
        } else if (state is WinGameState) {
          await checkResultDialog(context, isWin: true);
        } else if (state is LoseGameState) {
          await checkResultDialog(context, isWin: false);
        }
      },
      buildWhen: (_, currentState) =>
          currentState is MainInitial || currentState is GridUpdateState,
      builder: (context, state) => BlocBuilder<SettingsCubit, SettingsState>(
        buildWhen: (previous, current) =>
            previous.dictionaryLanguage != current.dictionaryLanguage,
        builder: (context, state) => Scaffold(
          drawer: const CustomDrawer(),
          appBar: CustomAppBar(
            title: levelRepository.isLevelMode
                ? R.stringsOf(context).level_number(
                      number: levelRepository.levelData.lastLevel,
                    )
                : R.stringsOf(context).wordle.toUpperCase(),
            actions: [
              if (levelRepository.isLevelMode)
                IconButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (context) => const LevelsPage(),
                      ),
                    );
                  },
                  tooltip: R.stringsOf(context).view_levels,
                  icon: const Icon(Icons.apps),
                )
              else
                IconButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (_) => const StatisticPage(),
                      ),
                    );
                  },
                  tooltip: R.stringsOf(context).view_statistic,
                  icon: const Icon(Icons.leaderboard),
                ),
            ],
          ),
          body: ConstraintScreen(
            child: Column(
              children: [
                const SizedBox(height: 8),
                const WordsGrid(),
                const Spacer(),
                state.dictionaryLanguage.keyboard,
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

extension _DictionaryLanguageKeyboard on DictionaryLanguages {
  Widget get keyboard {
    switch (this) {
      case DictionaryLanguages.ru:
        return const KeyboardRu();
      case DictionaryLanguages.en:
        return const KeyboardEn();
    }
  }
}
