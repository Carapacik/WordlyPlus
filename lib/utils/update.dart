import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:in_app_update/in_app_update.dart';

Future<void> checkForAndroidUpdate() async {
  if (kIsWeb) {
    return;
  }
  if (!Platform.isAndroid) {
    return;
  }
  try {
    final updateInfo = await InAppUpdate.checkForUpdate();
    if (updateInfo.updateAvailability == UpdateAvailability.updateAvailable) {
      await InAppUpdate.performImmediateUpdate();
    }
  } on Exception {
    // Error
  }
}
