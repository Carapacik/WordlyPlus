import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordle/bloc/settings/settings_cubit.dart';

class FullScreenDialog extends StatelessWidget {
  const FullScreenDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColorLight,
        title: const Text('Full-screen Dialog'),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: Navigator.of(context).pop,
            icon: const Icon(Icons.remove),
          ),
        ],
      ),
      body: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (BuildContext context, state) {
          return SwitchListTile(
            title: const Text('Темная тема'),
            value: state.isDarkThemeOn,
            onChanged: (bool value) {
              BlocProvider.of<SettingsCubit>(context).toggleTheme(value: value);
            },
          );
        },
      ),
    );
  }
}
