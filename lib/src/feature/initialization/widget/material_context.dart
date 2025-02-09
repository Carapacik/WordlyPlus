import 'package:flutter/material.dart';
import 'package:wordly/src/core/constant/localization/localization.dart';
import 'package:wordly/src/core/utils/extensions/extensions.dart';
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
  static final _globalKey = GlobalKey(debugLabel: 'MaterialContext');

  @override
  Widget build(BuildContext context) {
    final settings = SettingsScope.settingsOf(context);
    final mediaQueryData = MediaQuery.of(context);

    final theme = settings.appTheme;
    final lightTheme = theme.buildThemeData(ThemeMode.light);
    final darkTheme = theme.buildThemeData(ThemeMode.dark);

    final themeMode = theme.themeMode;
    final locale = settings.locale ?? Localization.computeDefaultLocale();

    return MaterialApp(
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: themeMode,
      locale: locale,
      localizationsDelegates: Localization.localizationDelegates,
      supportedLocales: Localization.supportedLocales,
      onGenerateTitle: (context) => context.l10n.appTitle,
      home: const GamePage(),
      builder: (context, child) => MediaQuery(
        key: _globalKey,
        data: mediaQueryData.copyWith(
          textScaler: TextScaler.linear(
            mediaQueryData.textScaler.scale(settings.textScale ?? 1).clamp(0.5, 2),
          ),
        ),
        child: child!,
      ),
    );
  }
}
