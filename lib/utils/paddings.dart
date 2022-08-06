import 'package:flutter/widgets.dart';

double horizontalPadding(BuildContext context) {
  final width = MediaQuery.of(context).size.width;
  return width > 500 ? (width - 500) / 2 + 72 : 16;
}

double bottomPadding(BuildContext context) =>
    MediaQuery.of(context).size.height -
    70 -
    MediaQuery.of(context).padding.top;
