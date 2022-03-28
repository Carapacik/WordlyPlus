import 'package:flutter/material.dart';
import 'package:wordly/ui/pages/settings/settings_page.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            ListTile(
              title: const Text("Daily mode"),
              onTap: () {},
            ),
            ListTile(
              title: const Text("Level mode"),
              onTap: () {},
            ),
            ListTile(
              title: const Text("How to play"),
              onTap: () {},
            ),
            const Spacer(),
            ListTile(
              title: const Text("Settings"),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const SettingsPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
