import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordly/bloc/settings/settings_cubit.dart';
import 'package:wordly/resources/colors.dart';
import 'package:wordly/resources/typography.dart';
import 'package:wordly/ui/pages/settings/widgets/language_selector.dart';
import 'package:wordly/ui/pages/settings/widgets/toggle_list_tile.dart';
import 'package:wordly/utils/utils.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          R.stringsOf(context).settings.toUpperCase(),
          style: AppTypography.b30,
        ),
        elevation: 0,
        backgroundColor: theme.scaffoldBackgroundColor,
        foregroundColor: theme.primaryColor,
        actions: [
          IconButton(
            onPressed: Navigator.of(context).pop,
            icon: const Icon(Icons.close),
            color: theme.primaryColor,
          ),
        ],
      ),
      body: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, state) {
          final settingsCubit = BlocProvider.of<SettingsCubit>(context);
          return Center(
            child: Responsive(
              mobile: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 8),
                  ToggleListTile(
                    text: R.stringsOf(context).dark_mode,
                    value: state.isDark,
                    onChanged: (value) =>
                        settingsCubit.toggleTheme(value: value),
                    isHighContrast: state.isHighContrast,
                  ),
                  const Divider(color: AppColors.greyTrack),
                  ToggleListTile(
                    text: R.stringsOf(context).high_contrast_mode,
                    value: state.isHighContrast,
                    onChanged: (value) =>
                        settingsCubit.toggleHighContrast(value: value),
                    isHighContrast: state.isHighContrast,
                  ),
                  const Divider(color: AppColors.greyTrack),
                  LanguageSelector(
                    text: R.stringsOf(context).app_language,
                    value: state.localeLanguage.name,
                    onChanged: (value) =>
                        settingsCubit.changeLocaleLanguage(value: value!),
                    isHighContrast: state.isHighContrast,
                  ),
                  const Divider(color: AppColors.greyTrack),
                  LanguageSelector(
                    text: R.stringsOf(context).dictionary_language,
                    value: state.dictionaryLanguage.name,
                    onChanged: (value) =>
                        settingsCubit.changeDictionaryLanguage(value: value!),
                    isHighContrast: state.isHighContrast,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
