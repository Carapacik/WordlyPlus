import 'package:flutter/material.dart';
import 'package:wordly/src/core/common/extensions/context_extension.dart';

class ChangeColorResult {
  const ChangeColorResult({this.colorMode = ColorMode.casual, this.otherColors});

  final ColorMode colorMode;
  final (Color, Color, Color)? otherColors;
}

enum ColorMode {
  casual,
  highContrast,
  other;

  String localized(BuildContext context) => switch (this) {
    ColorMode.casual => context.l10n.casual,
    ColorMode.highContrast => context.l10n.highContrast,
    ColorMode.other => context.l10n.other,
  };
}
