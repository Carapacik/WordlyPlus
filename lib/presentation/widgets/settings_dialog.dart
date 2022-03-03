import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordle/bloc/settings/settings_cubit.dart';
import 'package:wordle/resources/app_colors.dart';

class FullScreenDialog extends StatelessWidget {
  const FullScreenDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColorLight,
        title: Text(
          'SETTINGS',
          style: Theme.of(context).textTheme.headline1,
        ),
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
        builder: (BuildContext context, state) {
          return Theme(
            data: ThemeData(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
            ),
            child: Column(
              children: [
                SwitchListTile(
                  inactiveTrackColor: AppColors.greyTrack,
                  activeTrackColor: AppColors.greenTrack,
                  activeColor: Colors.white,
                  title: Text(
                    'Dark mode',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  value: state.isDarkThemeOn,
                  onChanged: (bool value) {
                    BlocProvider.of<SettingsCubit>(context)
                        .toggleTheme(value: value);
                  },
                ),
                const Divider(
                  color: AppColors.greyTrack,
                ),
                SwitchListTile(
                  inactiveTrackColor: AppColors.greyTrack,
                  activeTrackColor: AppColors.greenTrack,
                  activeColor: Colors.white,
                  title: Text(
                    'Change language',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  value: state.isEngLang,
                  onChanged: (bool value) {
                    BlocProvider.of<SettingsCubit>(context)
                        .toggleLanguage(value: value);
                  },
                ),
                const Divider(
                  color: AppColors.greyTrack,
                ),
                SwitchListTile(
                  inactiveTrackColor: AppColors.greyTrack,
                  activeTrackColor: AppColors.greenTrack,
                  activeColor: Colors.white,
                  title: Text(
                    'High contrast mode',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  value: state.isHighContrast,
                  onChanged: (bool value) {
                    BlocProvider.of<SettingsCubit>(context)
                        .toggleContrast(value: value);
                  },
                ),
                const Divider(
                  color: AppColors.greyTrack,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
