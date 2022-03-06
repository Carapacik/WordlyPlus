import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

Future<void> showTopFlushBar(
  final BuildContext context, {
  required final String message,
}) async {
  Flushbar(
    message: message,
    duration: const Duration(milliseconds: 1200),
    flushbarStyle: FlushbarStyle.FLOATING,
    flushbarPosition: FlushbarPosition.TOP,
    backgroundColor: Theme.of(context).primaryColorDark,
    messageColor: Theme.of(context).primaryColorLight,
    margin: const EdgeInsets.all(16),
    padding: const EdgeInsets.all(24),
    borderRadius: BorderRadius.circular(8),
  ).show(context);
}
