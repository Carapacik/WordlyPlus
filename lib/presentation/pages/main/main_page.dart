import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:wordle/bloc/main/main_cubit.dart';
import 'package:wordle/data/data_singleton.dart';
import 'package:wordle/data/enums/message_types.dart';
import 'package:wordle/presentation/pages/main/widgets/main_content.dart';
import 'package:wordle/presentation/widgets/adaptive_scaffold.dart';
import 'package:wordle/resources/app_colors.dart';

// class MainPage extends StatelessWidget {
//   const MainPage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return AdaptiveScaffold(
//       child: Responsive(
//         mobile: Text("Wordle"),
//       ),
//     );
//   }
// }

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  static Page page() => const MaterialPage<void>(child: MainPage());

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance
        ?.addPostFrameCallback((_) => _showTimerIfNeeded());
  }

  @override
  Widget build(BuildContext context) {
    return AdaptiveScaffold(
      child: _buildBody(context),
    );
  }

  BlocProvider<MainCubit> _buildBody(BuildContext context) {
    return BlocProvider<MainCubit>(
      create: (BuildContext context) => MainCubit(),
      child: BlocConsumer<MainCubit, MainState>(
        listenWhen: (_, currState) => true,
        listener: (context, state) {
          final homeCubit = BlocProvider.of<MainCubit>(context);
          if (state is SnackBarMessage) {
            final SnackBarMessage message = state;
            _showMessage(message, context);
          } else if (state is WinGameState) {
            _makeWin(homeCubit);
          } else if (state is LoseGameState) {
            _makeLose(homeCubit);
          }
        },
        buildWhen: (_, currState) => currState is MainInitial,
        builder: (context, state) {
          return MainContent(
            key: UniqueKey(),
          );
        },
      ),
    );
  }

  void _showMessage(SnackBarMessage myMessage, BuildContext context) {
    switch (myMessage.type) {
      case MessageTypes.info:
        showTopSnackBar(
          context,
          CustomSnackBar.info(
            message: myMessage.message,
          ),
        );
        break;
      case MessageTypes.success:
        showTopSnackBar(
          context,
          CustomSnackBar.success(
            message: myMessage.message,
          ),
        );
        break;
      case MessageTypes.error:
        showTopSnackBar(
          context,
          CustomSnackBar.error(
            message: myMessage.message,
          ),
        );
        break;
    }
  }

  void _showTimerIfNeeded() async {
    final s = await DictionaryInteractor.getInstance().createWord();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey("last_game_word")) {
      if (prefs.getString("last_game_word") == s) {
        _showTimerDialog(prefs.getBool("last_game_result") ?? false);
      }
    }
  }

  void _makeWin(homeCubit) async {
    await _writeResults(true);
    await homeCubit.clearGameArea();
    _showTimerIfNeeded();
  }

  void _makeLose(homeCubit) async {
    await _writeResults(false);
    await homeCubit.clearGameArea();
    _showTimerIfNeeded();
  }

  Future _writeResults(bool isWin) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final lastWord = DictionaryInteractor.getInstance().secretWord;
    if (lastWord.isNotEmpty) {
      await prefs.setString('last_game_word', lastWord);
      await prefs.setBool('last_game_result', isWin);
    }
  }

  void _showTimerDialog(bool isWin) {
    final now = DateTime.now();
    final nextMidnight =
        DateTime(now.year, now.month, now.day).add(const Duration(days: 1));
    final int endTime = DateTime.now().millisecondsSinceEpoch +
        nextMidnight.difference(now).inMilliseconds;
    final CountdownTimerController _countDownController =
        CountdownTimerController(endTime: endTime, onEnd: _dismissTimerDialog);
    showDialog(
      barrierDismissible: false,
      context: context,
      barrierColor: Colors.transparent,
      builder: (BuildContext ctx) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Dialog(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(24.0)),
            ),
            backgroundColor: isWin ? AppColors.green : Colors.red,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 40.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Center(
                      child: Text(
                        isWin
                            ? "TextConstants.youWin"
                            : "TextConstants.youLose",
                        style: GoogleFonts.mulish(
                          fontSize: 32,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Center(
                      child: Text(
                        " TextConstants.nextWordle",
                        style: GoogleFonts.mulish(
                          fontSize: 25,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CountdownTimer(
                    controller: _countDownController,
                    widgetBuilder: (_, CurrentRemainingTime? time) {
                      if (time == null) {
                        return Container();
                      }
                      final duration = Duration(
                        hours: time.hours ?? 0,
                        minutes: time.min ?? 0,
                        seconds: time.sec ?? 0,
                      );

                      return Text(
                        _durationToString(duration),
                        style: GoogleFonts.mulish(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _dismissTimerDialog() async {
    await DictionaryInteractor.getInstance().createWord();
    Navigator.of(context, rootNavigator: true).pop();
  }

  String _durationToString(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    final String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    final String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }
}
