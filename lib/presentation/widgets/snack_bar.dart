import 'package:flutter/material.dart';
import 'package:wordly/resources/resources.dart';

void showFloatingSnackBar(
  final BuildContext context, {
  required String message,
}) {
  final width = MediaQuery.of(context).size.width;
  final double horizontalPadding = width > 500 ? (width - 500) / 2 + 72 : 12;
  final height = MediaQuery.of(context).size.height;
  final double bottomPadding = height - 56 - MediaQuery.of(context).padding.top;
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
        horizontalPadding,
        12,
        horizontalPadding,
        bottomPadding,
      ),
      dismissDirection: DismissDirection.up,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
  );
}
