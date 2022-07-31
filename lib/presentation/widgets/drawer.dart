import 'package:flutter/material.dart';
import 'package:wordly/presentation/pages/credits/credits_page.dart';
import 'package:wordly/presentation/pages/game/game_page.dart';
import 'package:wordly/presentation/pages/settings/settings_page.dart';
import 'package:wordly/presentation/pages/tutorial/tutorial_page.dart';
import 'package:wordly/resources/resources.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: context.theme.backgroundColor),
      width: 200,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: Text(context.r.daily, style: context.theme.tm),
              onTap: () async {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute<void>(
                    builder: (context) => const GamePage(),
                  ),
                  (route) => false,
                );
              },
            ),
            ListTile(
              title: Text(context.r.levels, style: context.theme.tm),
              onTap: () async {
                await Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute<void>(
                    builder: (context) => const GamePage(daily: false),
                  ),
                  (route) => false,
                );
              },
            ),
            ListTile(
              title: Text(context.r.how_to_play, style: context.theme.tm),
              onTap: () async {
                await Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (context) => const TutorialPage(),
                  ),
                );
              },
            ),
            ListTile(
              title: Text(context.r.settings, style: context.theme.tm),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (context) {
                      return const SettingsPage();
                    },
                  ),
                );
              },
            ),
            const Spacer(),
            ListTile(
              title: Text(context.r.about, style: context.theme.tm),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (context) => const CreditsPage(),
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
