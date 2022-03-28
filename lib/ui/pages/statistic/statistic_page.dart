import 'package:flutter/material.dart';
import 'package:wordly/resources/typography.dart';
import 'package:wordly/utils/utils.dart';

class StatisticPage extends StatelessWidget {
  const StatisticPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          R.stringsOf(context).statistic.toUpperCase(),
          style: AppTypography.b30,
        ),
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        foregroundColor: Theme.of(context).primaryColor,
      ),
      body: Responsive(
        mobile: Center(
          child: Text("Empty"),
        ),
      ),
    );
  }
}
