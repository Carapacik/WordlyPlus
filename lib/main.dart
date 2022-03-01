import 'dart:io' show Platform;

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:wordle/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    debugPrint("Web");
  } else if (Platform.isIOS || Platform.isMacOS) {
    debugPrint("Platform.isIOS || Platform.isMacOS");
  } else if (Platform.isWindows || Platform.isLinux) {
    debugPrint("Platform.isWindows || Platform.isLinux");
  } else {
    debugPrint("Platform.isAndroid || Platform.isFuchsia");
  }
  runApp(const App());
}
