import 'package:flutter/material.dart';
import 'package:wordly/src/core/extension/extensions.dart';

enum WordError {
  notFound,
  tooShort;

  String localizedText(BuildContext context) {
    switch (this) {
      case WordError.notFound:
        return context.r.word_not_found;
      case WordError.tooShort:
        return context.r.word_too_short;
    }
  }
}
