import 'package:flutter/material.dart';

double horizontalPadding(BuildContext context) {
  final width = MediaQuery.of(context).size.width;
  return width > 500 ? (width - 500) / 2 + 72 : 20;
}

double bottomPadding(BuildContext context) =>
    MediaQuery.of(context).size.height -
    MediaQuery.of(context).padding.top -
    MediaQuery.of(context).padding.bottom -
    kToolbarHeight;
