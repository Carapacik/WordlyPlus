import 'package:flutter/material.dart';
import 'package:wordly/presentation/widgets/widgets.dart';
import 'package:wordly/resources/resources.dart';
import 'package:wordly/utils/utils.dart';

class LevelMenuPage extends StatelessWidget {
  const LevelMenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: R.stringsOf(context).levels,
      ),
      body: Center(
        child: Text(
          R.stringsOf(context).coming_soon,
          style: AppTypography.b25,
        ),
      ),
    );
  }
}
