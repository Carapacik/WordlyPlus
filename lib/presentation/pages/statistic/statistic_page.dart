import 'dart:math';

import 'package:auth_repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordle/bloc/app/app_bloc.dart';
import 'package:wordle/presentation/pages/login/login_page.dart';
import 'package:wordle/presentation/pages/main/main_page.dart';
import 'package:wordle/resources/app_colors.dart';
import 'package:wordle/resources/app_text_styles.dart';
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
        children: [
          Text(
            R.stringsOf(context).statistic,
            style: AppTextStyles.b20,
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              StatItem(
                value: 4,
                title: 'Played',
              ),
              StatItem(
                value: 100,
                title: 'Win %',
              ),
              StatItem(
                value: 1,
                title: 'Current\nStreak',
              ),
              StatItem(
                value: 2,
                title: 'Max\nStreak',
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 25,
              bottom: 10,
            ),
            child: Text(
              'Guess distribution'.toUpperCase(),
              style: AppTextStyles.b20,
            ),
          ),
          const AllAttemptStat(
            guessDistribution: [0, 0, 1, 2, 0, 1],
          ),
        ],
      ),
    );
  }
}

class StatItem extends StatelessWidget {
  const StatItem({
    required this.value,
    required this.title,
    Key? key,
  }) : super(key: key);

  final int value;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value.toString(),
          style: AppTextStyles.b25,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          title,
          style: AppTextStyles.n14,
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}

class AllAttemptStat extends StatelessWidget {
  const AllAttemptStat({
    required this.guessDistribution,
    Key? key,
  }) : super(key: key);

  final List<int> guessDistribution;

  @override
  Widget build(BuildContext context) {
    final List<double> widths = [];
    final int maximum = guessDistribution.reduce(max);
    for (final i in guessDistribution) {
      final double screen = MediaQuery.of(context).size.width * 0.75;
      final width = screen * i / maximum;
      if (width == 0) {
        widths.add(screen*0.07);
      } else {
        widths.add(width);
      }
    }
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      shrinkWrap: true,
      primary: false,
      itemBuilder: (context, index) {
        return AttemptBar(
          attemptNumber: index + 1,
          numberOfWins: guessDistribution[index],
          width: widths[index],
        );
      },
      separatorBuilder: (context, index) => const SizedBox(
        height: 5,
      ),
      itemCount: widths.length,
    );
  }
}

class AttemptBar extends StatelessWidget {
  const AttemptBar({
    required this.attemptNumber,
    required this.numberOfWins,
    required this.width,
    Key? key,
  }) : super(key: key);

  final int attemptNumber;
  final int numberOfWins;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          attemptNumber.toString(),
          style: AppTextStyles.n14,
        ),
        const SizedBox(
          width: 7,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3),
            color: AppColors.darkGrey,
          ),
          width: width,
          child: Padding(
            padding: const EdgeInsets.only(right: 5),
            child: Text(
              numberOfWins.toString(),
              style: AppTextStyles.m16.copyWith(color: Colors.white),
              textAlign: TextAlign.right,
            ),
          ),
        ),
      ],
    );
  }
}
