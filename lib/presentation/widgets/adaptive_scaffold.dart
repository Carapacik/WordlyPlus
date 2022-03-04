import 'dart:ui';

import 'package:auth_repository/auth_repository.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as m;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wordle/bloc/app/app_bloc.dart';
import 'package:wordle/presentation/pages/statistic/statistic_page.dart';
import 'package:wordle/resources/r.dart';
import 'package:wordle/presentation/widgets/settings_dialog.dart';
import 'package:wordle/resources/app_colors.dart';
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
        navigationBar: CupertinoNavigationBar(
          middle: Text(R.stringsOf(context).wordle.toUpperCase()),
        ),
        child: child,
      );
    } else if (PlatformType.isFluent()) {
      return NavigationView(
        appBar: NavigationAppBar(
          title: Text(R.stringsOf(context).wordle),
        ),
        content: child,
      );
    }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          R.stringsOf(context).wordle,
          style: GoogleFonts.mulish(fontSize: 32, fontWeight: FontWeight.w800),
        ),
        actions: [
            GestureDetector(
              onTap: () {
                m.showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
                      child: Dialog(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(24.0)),
                        ),
                        child: _buildDialogBody(context),
                      ),
                  );
                },
              );
            },
            child: const Icon(Icons.help_outline),
          ),
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
            icon: const Icon(Icons.leaderboard),
          ),
          m.IconButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) => const FullScreenDialog(),
                fullscreenDialog: true,
              ),
            ),
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: child,
    );
  }
}

Widget _buildDialogBody(BuildContext context) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 36, horizontal: 20),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          alignment: Alignment.center,
          width: double.infinity,
          child: Text(
            R.stringsOf(context).how_to_play,
            style: GoogleFonts.mulish(
              fontSize: 32,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          R.stringsOf(context).how_to_play,
          style: GoogleFonts.mulish(
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: AppColors.grey,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  R.stringsOf(context).example_letter,
                  style: GoogleFonts.mulish(
                    fontSize: 26,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Text(
              R.stringsOf(context).letter_incorrect,
              style: GoogleFonts.mulish(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: AppColors.yellow,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  R.stringsOf(context).example_letter,
                  style: GoogleFonts.mulish(
                    fontSize: 26,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Flexible(
              child: Text(
                R.stringsOf(context).letter_incorrect_spot,
                style: GoogleFonts.mulish(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: AppColors.green,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  R.stringsOf(context).example_letter,
                  style: GoogleFonts.mulish(
                    fontSize: 26,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Flexible(
              child: Text(
                R.stringsOf(context).letter_correct,
                style: GoogleFonts.mulish(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}