import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordle/bloc/settings/settings_cubit.dart';
import 'package:wordle/presentation/pages/main/main_page.dart';
import 'package:wordle/theme.dart';
import 'package:wordle/utils/platform.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (PlatformType.isCupertino()) {
      return CupertinoApp();
    } else if (PlatformType.isFluent()) {
      return FluentApp();
    }
    return BlocProvider<SettingsCubit>(
      create: (_) => SettingsCubit(),
      child: BlocBuilder<SettingsCubit, SwitchState>(
        builder: (BuildContext context, settingsState) {
          return MaterialApp(
            theme: settingsState.isDarkThemeOn
                ? themes[AppTheme.darkTheme]
                : themes[AppTheme.lightTheme],
            home: const MainPage(),
          );
        },
      ),
    );
  }
}
