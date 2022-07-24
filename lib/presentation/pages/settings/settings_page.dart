import 'package:flutter/material.dart';
import 'package:wordly/presentation/widgets/widgets.dart';
import 'package:wordly/resources/resources.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: context.r.settings),
      body: ConstraintScreen(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(),
        ),
      ),
    );
  }
}
