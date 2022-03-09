import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordle/bloc/main/main_cubit.dart';
import 'package:wordle/bloc/settings/settings_cubit.dart';
import 'package:wordle/resources/app_colors.dart';
import 'package:wordle/resources/app_text_styles.dart';
import 'package:wordle/resources/r.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: _theme.primaryColorLight,
        foregroundColor: _theme.primaryColor,
        title: Text(
          R.stringsOf(context).settings.toUpperCase(),
          style: AppTextStyles.m16,
        ),
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: Navigator.of(context).pop,
            icon: const Icon(Icons.close),
            color: _theme.primaryColor,
          ),
        ],
      ),
      body: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, state) {
          final settingsCubit = BlocProvider.of<SettingsCubit>(context);
          return Column(
            children: [
              _SwitchListTile(
                text: R.stringsOf(context).dark_mode,
                value: state.isDarkThemeOn,
                onChanged: (value) => settingsCubit.toggleTheme(value: value),
                isHighContrast: state.isHighContrast,
              ),
              const Divider(color: AppColors.greyTrack),
              _SwitchListTile(
                text: R.stringsOf(context).high_contrast_mode,
                value: state.isHighContrast,
                onChanged: (value) =>
                    settingsCubit.toggleContrast(value: value),
                isHighContrast: state.isHighContrast,
              ),
              const Divider(color: AppColors.greyTrack),
              _LanguageSelector(
                text: R.stringsOf(context).app_language,
                value: state.language,
                onChanged: (value) =>
                    settingsCubit.changeLanguage(value: value!),
                isHighContrast: state.isHighContrast,
              ),
              const Divider(color: AppColors.greyTrack),
              BlocBuilder<MainCubit, MainState>(
                buildWhen: (_, currentState) =>
                    currentState is ChangeDictionaryState,
                builder: (context, mainState) {
                  final mainCubit = BlocProvider.of<MainCubit>(context);
                  return _LanguageSelector(
                    text: R.stringsOf(context).dictionary_language,
                    value: mainState is! ChangeDictionaryState
                        ? "en"
                        : mainState.dictionary,
                    onChanged: (value) async {
                      mainCubit.changeDictionary(value: value!);
                      await mainCubit.clearGameArea(value);
                    },
                    isHighContrast: state.isHighContrast,
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}

class _LanguageSelector extends StatelessWidget {
  const _LanguageSelector({
    Key? key,
    required this.text,
    required this.value,
    required this.onChanged,
    required this.isHighContrast,
  }) : super(key: key);

  final String text;
  final String value;
  final ValueChanged<String?> onChanged;
  final bool isHighContrast;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 16),
        Text(
          text,
          style: AppTextStyles.m16,
        ),
        const Spacer(),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: isHighContrast
                ? AppColors.highContrastOrange
                : Theme.of(context).hintColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              alignment: Alignment.bottomCenter,
              value: value,
              borderRadius: BorderRadius.circular(10),
              items: const [
                DropdownMenuItem(
                  value: "ru",
                  child: Text("🇷🇺 RU"),
                ),
                DropdownMenuItem(
                  value: "en",
                  child: Text("🇺🇸 EN"),
                ),
              ],
              onChanged: onChanged,
            ),
          ),
        ),
        const SizedBox(width: 16),
      ],
    );
  }
}

class _SwitchListTile extends StatelessWidget {
  const _SwitchListTile({
    Key? key,
    required this.text,
    this.onChanged,
    required this.value,
    required this.isHighContrast,
  }) : super(key: key);

  final String text;
  final ValueChanged<bool>? onChanged;
  final bool value;
  final bool isHighContrast;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile.adaptive(
      inactiveTrackColor: AppColors.greyTrack,
      activeTrackColor:
          isHighContrast ? AppColors.highContrastOrange : AppColors.greenDark,
      activeColor: Colors.white,
      title: Text(
        text,
        style: AppTextStyles.m16,
      ),
      value: value,
      onChanged: onChanged,
    );
  }
}
