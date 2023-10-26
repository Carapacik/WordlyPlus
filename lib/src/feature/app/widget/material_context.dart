import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordly/src/core/localization/localization.dart';
import 'package:wordly/src/core/utils/extensions/extensions.dart';
import 'package:wordly/src/feature/app/widget/dictionary_scope.dart';
import 'package:wordly/src/feature/app/widget/locale_scope.dart';
import 'package:wordly/src/feature/app/widget/theme_scope.dart';
import 'package:wordly/src/feature/game/logic/game_bloc.dart';
import 'package:wordly/src/feature/game/widget/game_page.dart';

/// {@template material_context}
/// [MaterialContext] is an entry point to the material context.
///
/// This widget sets locales, themes and routing.
/// {@endtemplate}
class MaterialContext extends StatefulWidget {
  /// {@macro material_context}
  const MaterialContext({super.key});

  @override
  State<MaterialContext> createState() => _MaterialContextState();
}

class _MaterialContextState extends State<MaterialContext> {
  @override
  Widget build(BuildContext context) {
    final theme = ThemeScope.of(context).theme;
    final dictionary = DictionaryScope.of(context).dictionary;
    return BlocProvider(
      create: (context) => GameBloc(
        gameRepository: context.dependencies.gameRepository,
        statisticsRepository: context.dependencies.statisticsRepository,
        levelRepository: context.dependencies.levelRepository,
        dictionary: dictionary,
        savedResult: context.dependencies.gameRepository.loadDailyFromCache(dictionary, DateTime.now().toUtc()),
      ),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme.lightTheme,
        darkTheme: theme.darkTheme,
        themeMode: theme.mode,
        localizationsDelegates: Localization.localizationDelegates,
        supportedLocales: Localization.supportedLocales,
        locale: LocaleScope.of(context).locale,
        home: const GamePage(),
      ),
    );
  }
}
