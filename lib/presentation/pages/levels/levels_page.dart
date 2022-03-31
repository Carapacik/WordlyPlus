import 'package:flutter/material.dart';
import 'package:wordly/presentation/widgets/widgets.dart';
import 'package:wordly/resources/resources.dart';
import 'package:wordly/utils/utils.dart';

class LevelsPage extends StatelessWidget {
  const LevelsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: R.stringsOf(context).wordle.toUpperCase(),
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
