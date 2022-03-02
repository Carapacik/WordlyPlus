import 'package:flutter/material.dart';
import 'package:wordle/presentation/widgets/adaptive_scaffold.dart';
import 'package:wordle/utils/responsive.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AdaptiveScaffold(
      child: Responsive(
        mobile: Text("Wordle"),
      ),
    );
  }
}
