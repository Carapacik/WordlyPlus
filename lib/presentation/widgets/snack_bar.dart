import 'package:flutter/material.dart';
import 'package:wordly/resources/resources.dart';
import 'package:wordly/utils/utils.dart';

void showFloatingSnackBar(
  final BuildContext context, {
  required String message,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: context.theme.bl.copyWith(
          color: context.dynamicColor(light: Colors.white, dark: Colors.black),
        ),
        textAlign: TextAlign.center,
      ),
      backgroundColor: context.dynamicColor(
        light: Colors.black,
        dark: Colors.white,
      ),
      duration: const Duration(milliseconds: 600),
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.fromLTRB(
        horizontalPadding(context),
        6,
        horizontalPadding(context),
        bottomPadding(context),
      ),
      dismissDirection: DismissDirection.up,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
  );
}
