import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wordle/utils/platform.dart';

class AdaptiveApp extends StatelessWidget {
  const AdaptiveApp({
    Key? key,
    required this.home,
  }) : super(key: key);

  final Widget home;

  @override
  Widget build(BuildContext context) {
    if (PlatformType.isCupertino()) {
      return CupertinoApp(home: home);
    } else if (PlatformType.isFluent()) {
      return FluentApp(home: home);
    }
    return MaterialApp(home: home);
  }
}
