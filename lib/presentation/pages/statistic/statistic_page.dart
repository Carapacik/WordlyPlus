import 'package:auth_repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordle/bloc/app/app_bloc.dart';
import 'package:wordle/presentation/pages/login/login_page.dart';
import 'package:wordle/presentation/pages/main/main_page.dart';
import 'package:wordle/resources/r.dart';

class StatisticPage extends StatelessWidget {
  const StatisticPage({
    required this.authRepository,
    Key? key,
  }) : super(key: key);

  final AuthRepository authRepository;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        return state.status == AppStatus.authenticated
            ? const StatisticView()
            : LoginPage(authRepository: authRepository);
      },
    );
  }
}

class StatisticView extends StatelessWidget {
  const StatisticView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        foregroundColor: Theme.of(context).primaryColor,
        elevation: 0,
        title: Text(R.stringsOf(context).statistic),
        leading: IconButton(
          icon: Icon(Icons.adaptive.arrow_back),
          onPressed: () {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => const MainPage(),
              ),
              (r) => false,
            );
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => context.read<AppBloc>().add(
                  AppLogoutRequested(),
                ),
          ),
        ],
      ),
      body: Column(
        children: const [
          Center(
            child: Text("STAT PAGE"),
          )
        ],
      ),
    );
  }
}
