import 'dart:ui';

import 'package:flutter/services.dart';

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

Future<void> copyToClipboard(final String text) async {
  await Clipboard.setData(ClipboardData(text: text));
}
