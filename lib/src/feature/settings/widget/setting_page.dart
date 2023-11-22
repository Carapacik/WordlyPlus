import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordly/src/core/utils/extensions/extensions.dart';
import 'package:wordly/src/feature/components/widget/constraint_screen.dart';
import 'package:wordly/src/feature/game/bloc/game_bloc.dart';
import 'package:wordly/src/feature/settings/model/change_color_result.dart';
import 'package:wordly/src/feature/settings/widget/change_color_page.dart';
import 'package:wordly/src/feature/settings/widget/list_item_selector.dart';
import 'package:wordly/src/feature/settings/widget/settings_scope.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Title(
      color: Colors.black,
      title: context.r.settings,
      child: Scaffold(
        appBar: AppBar(title: Text(context.r.settings)),
        body: ConstraintScreen(
          child: Column(
            children: [
              ListItemSelector<Locale>(
                title: context.r.appDictionary,
                currentValue: (SettingsScope.of(context).dictionary, _localeName(SettingsScope.of(context).dictionary)),
                items: [(const Locale('ru'), context.r.ru), (const Locale('en'), context.r.en)],
                onChange: (d) {
                  SettingsScope.dictionaryOf(context).setDictionary(d);
                  context.read<GameBloc>().add(GameEvent.changeDictionary(d));
                },
              ),
              ListItemSelector<Locale>(
                title: context.r.appLanguage,
                currentValue: (SettingsScope.of(context).locale, _localeName(SettingsScope.of(context).locale)),
                items: [(const Locale('ru'), context.r.ru), (const Locale('en'), context.r.en)],
                onChange: (l) => SettingsScope.localeOf(context).setLocale(l),
              ),
              ListItemSelector<ThemeMode>(
                title: context.r.themeMode,
                currentValue: (SettingsScope.of(context).theme.mode, _themeName(SettingsScope.of(context).theme.mode)),
                items: [
                  (ThemeMode.system, context.r.themeSystem),
                  (ThemeMode.dark, context.r.themeDark),
                  (ThemeMode.light, context.r.themeLight),
                ],
                onChange: (mode) {
                  final themeScope = SettingsScope.themeOf(context);
                  final previousTheme = themeScope.theme;
                  themeScope.setTheme(
                    previousTheme.copyWith(themeMode: mode),
                  );
                },
              ),
              MergeSemantics(
                child: ListTileTheme.merge(
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                    title: Text(context.r.colorMode, style: context.theme.bl),
                    trailing: Text(
                      SettingsScope.of(context).theme.colorMode.localized(context),
                      style: context.theme.bl,
                    ),
                    onTap: () async {
                      final themeScope = SettingsScope.of(context);
                      final previousTheme = themeScope.theme;
                      final result = await Navigator.of(context).push(
                        MaterialPageRoute<ChangeColorResult>(
                          builder: (context) => ChangeColorPage(
                            previousResult: ChangeColorResult(
                              colorMode: previousTheme.colorMode,
                              otherColors: previousTheme.otherColors,
                            ),
                          ),
                        ),
                      );
                      if (result == null) {
                        return;
                      }
                      themeScope.setTheme(
                        previousTheme.copyWith(
                          colorMode: result.colorMode,
                          otherColors: result.otherColors,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _localeName(Locale locale) {
    final locales = {
      const Locale('en'): context.r.en,
      const Locale('ru'): context.r.ru,
    };
    return locales[locale] ?? context.r.en;
  }

  String _themeName(ThemeMode mode) {
    final themeModes = {
      ThemeMode.system: context.r.themeSystem,
      ThemeMode.dark: context.r.themeDark,
      ThemeMode.light: context.r.themeLight,
    };
    return themeModes[mode] ?? context.r.themeSystem;
  }
}
