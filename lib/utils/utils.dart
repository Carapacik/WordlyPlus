import 'dart:ui';

import 'package:auth_repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:wordle/data/repositories/statistic_repository.dart';

String durationToString(Duration duration) {
  String twoDigits(int n) => n.toString().padLeft(2, "0");
  final String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
  final String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
  return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
}

Locale getLocaleFromString(final String locale) {
  switch (locale) {
    case "ru":
      return const Locale("ru");
    case "en":
    default:
      return const Locale("en");
  }
}

Future<void> getStatistic() async {
  Statistic statistic;
  if (FirebaseAuth.instance.currentUser != null) {
    statistic = await AuthRepository().getStatistic();
  } else {
    statistic =
        await StatisticRepository.getInstance().getItem() ?? Statistic(uid: '');
  }
  GetIt.I.registerLazySingleton<Statistic>(() => statistic);
}
