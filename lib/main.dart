import 'dart:async';

import 'package:wordly/src/core/utils/logger.dart';
import 'package:wordly/src/feature/app/logic/app_runner.dart';

void main() => logger.runLogging(
      () => runZonedGuarded(
        () async => const AppRunner().initializeAndRun(),
        logger.logZoneError,
      ),
    );
