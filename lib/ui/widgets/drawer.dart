import 'package:flutter/material.dart';
import 'package:wordly/resources/typography.dart';
import 'package:wordly/ui/pages/settings/settings_page.dart';
import 'package:wordly/ui/widgets/widgets.dart';
import 'package:wordly/utils/utils.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            ListTile(
              title: Text(
                R.stringsOf(context).daily,
                style: AppTypography.b20,
              ),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                R.stringsOf(context).level,
                style: AppTypography.b20,
              ),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                R.stringsOf(context).how_to_play,
                style: AppTypography.b20,
              ),
              onTap: () async {
                await showHowToPlayDialog(context);
              },
            ),
            ListTile(
              title: Text(
                R.stringsOf(context).settings,
                style: AppTypography.b20,
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const SettingsPage(),
                  ),
                );
              },
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
