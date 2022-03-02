import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as m;
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
      return CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          middle: Text("Wordle"),
        ),
        child: child,
      );
    } else if (PlatformType.isFluent()) {
      return NavigationView(
        appBar: const NavigationAppBar(
          title: Text("Wordle"),
        ),
        content: child,
      );
    }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Wordle"),
        actions: [
          m.IconButton(
            onPressed: () {},
            icon: Icon(Icons.leaderboard),
          ),
          m.IconButton(
            onPressed: () {},
            icon: Icon(Icons.settings),
          ),
        ],
      ),
      body: child,
    );
  }
}
