import 'package:auth_repository/auth_repository.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as m;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordle/bloc/app/app_bloc.dart';
import 'package:wordle/presentation/pages/statistic/statistic_page.dart';
import 'package:wordle/utils/platform.dart';

class AdaptiveScaffold extends StatelessWidget {
  const AdaptiveScaffold({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    if (PlatformType.isCupertino()) {
      return CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          middle: Text("Wordle"),
        ),
        child: child,
      );
    } else if (PlatformType.isFluent()) {
      return NavigationView(
        appBar: const NavigationAppBar(
          title: Text("Wordle"),
        ),
        content: child,
      );
    }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Wordle"),
        actions: [
          m.IconButton(
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  final authRepository = AuthRepository();
                  authRepository.user.first;
                  return RepositoryProvider.value(
                    value: authRepository,
                    child: BlocProvider(
                      create: (context) =>
                          AppBloc(authRepository: authRepository),
                      child: const StatisticPage(),
                    ),
                  );
                },
              ),
            ),
            icon: Icon(Icons.leaderboard),
          ),
          m.IconButton(
            onPressed: () {},
            icon: Icon(Icons.settings),
          ),
        ],
      ),
      body: child,
    );
  }
}
