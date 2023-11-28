import 'dart:io';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:wordly/src/core/constants/constants.dart';
import 'package:wordly/src/core/utils/extensions/extensions.dart';

String? shareString(BuildContext context, (bool, int, String)? result) {
  if (result == null) {
    return null;
  }
  final sb = StringBuffer()
    ..write(result.$1 ? context.r.checkResultWin(result.$2) : context.r.checkResultLose(result.$2))
    ..write(result.$3)
    ..write(context.r.checkResult)
    ..write(
      kIsWeb
          ? webLink
          : Platform.isAndroid
              ? androidLink
              : webLink,
    );
  return sb.toString();
}
