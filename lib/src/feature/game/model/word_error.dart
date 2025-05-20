import 'package:flutter/material.dart';
import 'package:wordly/src/core/common/extensions/context_extension.dart';

enum WordError {
  notFound,
  tooShort;

  String localizedText(BuildContext context) => switch (this) {
    WordError.notFound => context.l10n.wordNotFound,
    WordError.tooShort => context.l10n.wordTooShort,
  };
}
