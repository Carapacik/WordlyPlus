import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordly/src/core/extension/extensions.dart';
import 'package:wordly/src/feature/game/logic/game_bloc.dart';
import 'package:wordly/src/feature/game/model/game_mode.dart';
import 'package:wordly/src/feature/game/widget/game_page.dart';
import 'package:wordly/src/feature/settings/widget/setting_page.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: DecoratedBox(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.horizontal(right: Radius.circular(16)),
          color: Colors.white,
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                title: Text(context.r.daily, style: context.theme.tmb),
                onTap: () async {
                  Scaffold.of(context).closeDrawer();
                  final navigator = Navigator.of(context);
                  final bloc = context.read<GameBloc>()..add(const GameEvent.changeGameMode(GameMode.daily));
                  await Future<void>.delayed(const Duration(milliseconds: 250));
                  await navigator.pushAndRemoveUntil(
                    PageRouteBuilder<void>(
                      pageBuilder: (context, _, __) => BlocProvider.value(
                        value: bloc,
                        child: const GamePage(),
                      ),
                      transitionDuration: Duration.zero,
                      reverseTransitionDuration: Duration.zero,
                    ),
                    (route) => false,
                  );
                },
              ),
              ListTile(
                title: Text(context.r.levels, style: context.theme.tmb),
                onTap: () async {
                  Scaffold.of(context).closeDrawer();
                  final navigator = Navigator.of(context);
                  final bloc = context.read<GameBloc>()..add(const GameEvent.changeGameMode(GameMode.lvl));
                  await Future<void>.delayed(const Duration(milliseconds: 250));
                  await navigator.pushAndRemoveUntil(
                    PageRouteBuilder<void>(
                      pageBuilder: (context, _, __) => BlocProvider.value(
                        value: bloc,
                        child: const GamePage(),
                      ),
                      transitionDuration: Duration.zero,
                      reverseTransitionDuration: Duration.zero,
                    ),
                    (route) => false,
                  );
                },
              ),
              ListTile(
                title: Text(context.r.tutorial, style: context.theme.tmb),
                onTap: () async {
                  Scaffold.of(context).closeDrawer();
                  final navigator = Navigator.of(context);
                  final bloc = context.read<GameBloc>();
                  // await navigator.push(
                  //   MaterialPageRoute<void>(
                  //     builder: (context) => const TutorialPage(),
                  //   ),
                  // );
                },
              ),
              ListTile(
                title: Text(context.r.settings, style: context.theme.tmb),
                onTap: () async {
                  Scaffold.of(context).closeDrawer();
                  final navigator = Navigator.of(context);
                  final bloc = context.read<GameBloc>();
                  await navigator.push(
                    MaterialPageRoute<void>(
                      builder: (context) => BlocProvider.value(
                        value: bloc,
                        child: const SettingsPage(),
                      ),
                    ),
                  );
                },
              ),
              ListTile(
                title: Text(context.r.about, style: context.theme.tmb),
                onTap: () async {
                  Scaffold.of(context).closeDrawer();
                  final navigator = Navigator.of(context);
                  // await navigator.push(
                  //   MaterialPageRoute<void>(
                  //     builder: (context) => const CreditsPage(),
                  //   ),
                  // );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
