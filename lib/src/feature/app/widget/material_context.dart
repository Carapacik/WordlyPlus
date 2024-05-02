import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordly/src/core/constant/localization/localization.dart';
import 'package:wordly/src/core/utils/extensions/context_extension.dart';
import 'package:wordly/src/feature/game/bloc/game_bloc.dart';
import 'package:wordly/src/feature/game/widget/game_page.dart';
import 'package:wordly/src/feature/settings/widget/settings_scope.dart';

/// {@template material_context}
/// [MaterialContext] is an entry point to the material context.
///
/// This widget sets locales, themes and routing.
/// {@endtemplate}
class MaterialContext extends StatelessWidget {
  /// {@macro material_context}
  const MaterialContext({super.key});

  // This global key is needed for [MaterialApp]
  // to work properly when Widgets Inspector is enabled.
  static final _globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final theme = SettingsScope.themeOf(context).theme;
    final locale = SettingsScope.localeOf(context).locale;
    final dictionary = SettingsScope.dictionaryOf(context).dictionary;

    return BlocProvider(
      create: (context) => GameBloc(
        gameRepository: context.dependencies.gameRepository,
        statisticsRepository: context.dependencies.statisticsRepository,
        levelRepository: context.dependencies.levelRepository,
        dictionary: dictionary,
        savedResult: context.dependencies.gameRepository.getDaily(dictionary, DateTime.now().toUtc()),
      ),
      child: MaterialApp(
        theme: theme.lightTheme,
        darkTheme: theme.darkTheme,
        themeMode: theme.mode,
        localizationsDelegates: Localization.localizationDelegates,
        supportedLocales: Localization.supportedLocales,
        locale: locale,
        onGenerateTitle: (context) => context.l10n.appTitle,
        home: const GamePage(),
        builder: (context, child) => MediaQuery.withNoTextScaling(key: _globalKey, child: child!),
      ),
    );
  }
}
