import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordle/bloc/main/main_cubit.dart';
import 'package:wordle/bloc/settings/settings_cubit.dart';
import 'package:wordle/resources/app_colors.dart';
import 'package:wordle/resources/r.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColorLight,
        title: Text(R.stringsOf(context).settings.toUpperCase()),
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: Navigator.of(context).pop,
            icon: const Icon(Icons.close),
            color: Theme.of(context).primaryColor,
          ),
        ],
      ),
      body: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, state) {
          final settingsCubit = BlocProvider.of<SettingsCubit>(context);
          return Column(
            children: [
              SwitchListTile.adaptive(
                inactiveTrackColor: AppColors.greyTrack,
                activeTrackColor: AppColors.greenTrack,
                activeColor: Colors.white,
                title: Text(
                  R.stringsOf(context).dark_mode,
                  style: Theme.of(context).textTheme.headline6,
                ),
                value: state.isDarkThemeOn,
                onChanged: (value) => settingsCubit.toggleTheme(value: value),
              ),
              const Divider(color: AppColors.greyTrack),
              SwitchListTile.adaptive(
                inactiveTrackColor: AppColors.greyTrack,
                activeTrackColor: AppColors.greenTrack,
                activeColor: Colors.white,
                title: Text(
                  R.stringsOf(context).high_contrast_mode,
                  style: Theme.of(context).textTheme.headline6,
                ),
                value: state.isHighContrast,
                onChanged: (value) =>
                    settingsCubit.toggleContrast(value: value),
              ),
              const Divider(color: AppColors.greyTrack),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text("Язык приложения"),
                  const SizedBox(width: 20),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: AppColors.green,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: state.language,
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
                        onChanged: (value) =>
                            settingsCubit.changeLanguage(value: value!),
                      ),
                    ),
                  ),
                ],
              ),
              const Divider(color: AppColors.greyTrack),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text("Язык словаря"),
                  const SizedBox(width: 20),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: AppColors.green,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: BlocBuilder<MainCubit, MainState>(
                      buildWhen: (_, currentState) =>
                          currentState is ChangeDictionaryState,
                      builder: (context, state) {
                        final mainCubit = BlocProvider.of<MainCubit>(context);
                        return DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: state is! ChangeDictionaryState
                                ? "en"
                                : state.dictionary,
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
                            onChanged: (value) async {
                              mainCubit.changeDictionary(value: value!);
                              await mainCubit.clearGameArea(value);
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
