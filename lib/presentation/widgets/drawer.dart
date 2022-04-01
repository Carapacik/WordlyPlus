import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordly/bloc/main/main_cubit.dart';
import 'package:wordly/presentation/pages/main/main_page.dart';
import 'package:wordly/presentation/pages/settings/settings_page.dart';
import 'package:wordly/presentation/widgets/widgets.dart';
import 'package:wordly/resources/resources.dart';
import 'package:wordly/utils/utils.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mainCubit = BlocProvider.of<MainCubit>(context);
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      width: 200,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: Text(
                R.stringsOf(context).daily,
                style: AppTypography.b20,
              ),
              onTap: () async {
                await mainCubit.loadDaily();
                await Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (context) => const MainPage(),
                  ),
                  (route) => false,
                );
              },
            ),
            ListTile(
              title: Text(
                R.stringsOf(context).levels,
                style: AppTypography.b20,
              ),
              onTap: () async {
                await mainCubit.loadLevels();
                await Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (context) => const MainPage(),
                  ),
                  (route) => false,
                );
              },
            ),
            ListTile(
              title: Text(
                R.stringsOf(context).how_to_play,
                style: AppTypography.b20,
              ),
              onTap: () async {
                Navigator.of(context).pop();
                await showHowToPlayDialog(context);
              },
            ),
            ListTile(
              title: Text(
                R.stringsOf(context).settings,
                style: AppTypography.b20,
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const SettingsPage(),
                  ),
                );
              },
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text(
                "v1.0.2",
                style: AppTypography.r14,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text(
                R.stringsOf(context).carapacik,
                style: AppTypography.r14,
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
