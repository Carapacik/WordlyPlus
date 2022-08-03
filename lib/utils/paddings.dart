import 'package:flutter/widgets.dart';

double horizontalPadding(BuildContext context) {
  final width = MediaQuery.of(context).size.width;
  return width > 500 ? (width - 500) / 2 + 72 : 12;
}

double bottomPadding(BuildContext context) {
  return MediaQuery.of(context).size.height -
      56 -
      MediaQuery.of(context).padding.top;
}
