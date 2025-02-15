import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordly/src/core/constant/localization/localization.dart';
import 'package:wordly/src/core/utils/extensions/extensions.dart';
import 'package:wordly/src/feature/components/widget/constraint_screen.dart';
import 'package:wordly/src/feature/game/bloc/game_bloc.dart';
import 'package:wordly/src/feature/settings/bloc/app_settings_bloc.dart';
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
    final settings = SettingsScope.settingsOf(context);
    return Title(
      color: Colors.black,
      title: context.l10n.settings,
      child: Scaffold(
        backgroundColor: context.theme.extension<BackgroundCustomColors>()?.background,
        appBar: AppBar(
          centerTitle: true,
          title: Text(context.l10n.settings, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 32)),
        ),
        body: ConstraintScreen(
          child: Column(
            children: [
              ListItemSelector<Locale>(
                title: context.l10n.appDictionary,
                currentValue: (
                  settings.dictionary ?? Localization.computeDefaultLocale(withDictionary: true),
                  _localeName(settings.dictionary),
                ),
                items: [(const Locale('ru'), context.l10n.ru), (const Locale('en'), context.l10n.en)],
                onChange: (d) {
                  final appSettingsBloc = SettingsScope.of(context, listen: false);
                  final appSettings = SettingsScope.settingsOf(context, listen: false);
                  appSettingsBloc.add(
                    AppSettingsEvent.updateAppSettings(appSettings: appSettings.copyWith(dictionary: d)),
                  );
                  context.read<GameBloc>().add(GameEvent.changeDictionary(d));
                },
              ),
              ListItemSelector<Locale>(
                title: context.l10n.appLanguage,
                currentValue: (
                  settings.locale ?? Localization.computeDefaultLocale(withDictionary: true),
                  _localeName(settings.locale),
                ),
                items: [(const Locale('ru'), context.l10n.ru), (const Locale('en'), context.l10n.en)],
                onChange: (l) {
                  final appSettingsBloc = SettingsScope.of(context, listen: false);
                  final appSettings = SettingsScope.settingsOf(context, listen: false);
                  appSettingsBloc.add(AppSettingsEvent.updateAppSettings(appSettings: appSettings.copyWith(locale: l)));
                },
              ),
              ListItemSelector<ThemeMode>(
                title: context.l10n.themeMode,
                currentValue: (settings.appTheme.themeMode, _themeName(settings.appTheme.themeMode)),
                items: [
                  (ThemeMode.system, context.l10n.themeSystem),
                  (ThemeMode.dark, context.l10n.themeDark),
                  (ThemeMode.light, context.l10n.themeLight),
                ],
                onChange: (tm) {
                  final appSettingsBloc = SettingsScope.of(context, listen: false);
                  final appSettings = SettingsScope.settingsOf(context, listen: false);
                  appSettingsBloc.add(
                    AppSettingsEvent.updateAppSettings(
                      appSettings: appSettings.copyWith(appTheme: appSettings.appTheme.copyWith(themeMode: tm)),
                    ),
                  );
                },
              ),
              MergeSemantics(
                child: ListTileTheme.merge(
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                    title: Text(
                      context.l10n.colorMode,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    trailing: Text(
                      SettingsScope.settingsOf(context).appTheme.colorMode.localized(context),
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    onTap: () async {
                      final appSettingsBloc = SettingsScope.of(context, listen: false);
                      final appSettings = SettingsScope.settingsOf(context, listen: false);
                      final navigator = Navigator.of(context);
                      final previousTheme = appSettings.appTheme;
                      final result = await navigator.push(
                        MaterialPageRoute<ChangeColorResult>(
                          builder:
                              (context) => ChangeColorPage(
                                dictionary:
                                    appSettings.dictionary ?? Localization.computeDefaultLocale(withDictionary: true),
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
                      appSettingsBloc.add(
                        AppSettingsEvent.updateAppSettings(
                          appSettings: appSettings.copyWith(
                            appTheme: appSettings.appTheme.copyWith(
                              colorMode: result.colorMode,
                              otherColors: result.otherColors,
                            ),
                          ),
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

  String _localeName(Locale? locale) {
    final locales = {'en': context.l10n.en, 'ru': context.l10n.ru};
    return locales[(locale ?? Localization.computeDefaultLocale(withDictionary: true)).languageCode] ?? context.l10n.en;
  }

  String _themeName(ThemeMode mode) {
    final themeModes = {
      ThemeMode.system: context.l10n.themeSystem,
      ThemeMode.dark: context.l10n.themeDark,
      ThemeMode.light: context.l10n.themeLight,
    };
    return themeModes[mode] ?? context.l10n.themeSystem;
  }
}
