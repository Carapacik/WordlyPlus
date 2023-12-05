import 'package:flutter/material.dart';
import 'package:wordly/src/core/utils/extensions/extensions.dart';

class ChangeColorResult {
  const ChangeColorResult({this.colorMode = ColorMode.casual, this.otherColors});

  final ColorMode colorMode;
  final (Color, Color, Color)? otherColors;
}

enum ColorMode {
  casual,
  highContrast,
  other;

  String localized(BuildContext context) {
    switch (this) {
      case ColorMode.casual:
        return context.r.casual;
      case ColorMode.highContrast:
        return context.r.highContrast;
      case ColorMode.other:
        return context.r.other;
    }
  }
}
