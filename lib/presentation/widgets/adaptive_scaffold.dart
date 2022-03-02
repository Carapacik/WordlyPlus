import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wordle/utils/platform.dart';

class AdaptiveScaffold extends StatelessWidget {
  const AdaptiveScaffold({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    if (PlatformType.isCupertino()) {
      return CupertinoPageScaffold(child: child);
    } else if (PlatformType.isFluent()) {
      return NavigationView(content: child);
    }
    return Scaffold(body: child);
  }
}
