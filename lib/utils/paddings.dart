import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:wordly/utils/constants.dart';

double get horizontalPadding => _screenSize.width > mobileWidth
    ? (_screenSize.width - mobileWidth) / 2 + 72
    : 20;

double get bottomPadding =>
    _screenSize.height - _verticalSafeAreaPadding - kToolbarHeight;

Size get _screenSize => ui.window.physicalSize / ui.window.devicePixelRatio;

double get _verticalSafeAreaPadding {
  final ss = (ui.window.padding.top + ui.window.padding.bottom) /
      ui.window.devicePixelRatio;
  print(ss);
  return ss;
}
