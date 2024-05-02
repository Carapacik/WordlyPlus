import 'package:flutter/material.dart';
import 'package:wordly/src/core/utils/extensions/extensions.dart';

enum WordError {
  notFound,
  tooShort;

  String localizedText(BuildContext context) {
    switch (this) {
      case WordError.notFound:
        return context.l10n.wordNotFound;
      case WordError.tooShort:
        return context.l10n.wordTooShort;
    }
  }
}
