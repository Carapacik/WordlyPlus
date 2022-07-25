import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordly/bloc/dictionary/dictionary_bloc.dart';
import 'package:wordly/bloc/locale/locale_bloc.dart';
import 'package:wordly/bloc/theme/theme_bloc.dart';
import 'package:wordly/presentation/pages/settings/widgets/language_selector.dart';
import 'package:wordly/presentation/pages/settings/widgets/toggle_list_tile.dart';
import 'package:wordly/presentation/widgets/widgets.dart';
import 'package:wordly/resources/resources.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: context.r.settings),
      body: ConstraintScreen(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            children: [
              const SizedBox(height: 8),
              ToggleListTile(
                text: context.r.dark_mode,
                value: context.read<ThemeBloc>().state.theme.brightness ==
                    Brightness.dark,
                onChanged: (value) {
                  context.read<ThemeBloc>().add(
                        const ThemeEvent.toggleTheme(),
                      );
                },
              ),
              const Divider(color: AppColors.grey),
              ToggleListTile(
                text: context.r.high_contrast_mode,
                value: context.read<ThemeBloc>().state.isHighContrast,
                onChanged: (value) {
                  context.read<ThemeBloc>().add(
                        const ThemeEvent.toggleHighContrast(),
                      );
                },
              ),
              const Divider(color: AppColors.grey),
              LanguageSelector(
                text: context.r.app_language,
                value: context.read<LocaleBloc>().state.locale,
                onChanged: (value) {
                  context.read<LocaleBloc>().add(
                        LocaleEvent.localeChanged(locale: value!),
                      );
                },
              ),
              const Divider(color: AppColors.grey),
              LanguageSelector(
                text: context.r.dictionary_language,
                value: context.read<DictionaryBloc>().state.dictionary,
                onChanged: (value) {
                  context.read<DictionaryBloc>().add(
                        DictionaryEvent.dictionaryChanged(dictionary: value!),
                      );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
