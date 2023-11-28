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
    ..write('\n');
  for (final e in _splitBy5Symbols(result.$3)) {
    sb
      ..write(e)
      ..write('\n');
  }
  sb
    ..write('\n')
    ..write(context.r.checkResult)
    ..write('\n')
    ..write(
      kIsWeb
          ? webLink
          : Platform.isAndroid
              ? androidLink
              : webLink,
    );
  return sb.toString();
}

List<String> _splitBy5Symbols(String string) {
  final list = <String>[];
  final sb = StringBuffer();
  for (var i = 0; i < string.length; i++) {
    sb.write(string[i]);
    if ((i + 1) % 5 == 0) {
      list.add(sb.toString());
      sb.clear();
    }
  }
  return list;
}
