import 'package:flutter/material.dart';
import 'package:wordly/resources/typography.dart';
import 'package:wordly/ui/pages/statistic/statistic_page.dart';
import 'package:wordly/utils/utils.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            ListTile(
              title: Text("Daily mode"),
              onTap: () {},
            ),
            ListTile(
              title: Text("Levels mode"),
              onTap: () {},
            ),
            ListTile(
              title: Text("How to play"),
              onTap: () {},
            ),
            Spacer(),
            ListTile(
              title: Text("Settings"),
              onTap: () {},
            ),
          ],
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          R.stringsOf(context).wordle.toUpperCase(),
          style: AppTypography.b30,
        ),
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        foregroundColor: Theme.of(context).primaryColor,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const StatisticPage(),
                ),
              );
            },
            icon: const Icon(Icons.leaderboard),
          ),
        ],
      ),
    );
  }
}
