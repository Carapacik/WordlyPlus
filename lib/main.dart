import 'dart:async';

import 'package:wordly/src/core/utils/logger.dart';
import 'package:wordly/src/feature/initialization/logic/app_runner.dart';

Future<void> main() async {
  final logger = DeveloperLogger();
  await runZonedGuarded(
    () => AppRunner(logger).initializeAndRun(),
    logger.logZoneError,
  );
}
