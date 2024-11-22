import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordly/src/core/utils/extensions/extensions.dart';
import 'package:wordly/src/feature/game/bloc/game_bloc.dart';
import 'package:wordly/src/feature/settings/widget/settings_scope.dart';

class BlocScope extends StatelessWidget {
  const BlocScope({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final dictionary = SettingsScope.settingsOf(context).dictionary;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GameBloc(
            gameRepository: context.dependencies.gameRepository,
            statisticsRepository: context.dependencies.statisticsRepository,
            levelRepository: context.dependencies.levelRepository,
            dictionary: dictionary,
            savedResult: context.dependencies.gameRepository.savedResult,
          ),
        ),
      ],
      child: child,
    );
  }
}
