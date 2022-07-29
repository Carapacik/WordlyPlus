import 'package:flutter/material.dart';
import 'package:wordly/presentation/widgets/widgets.dart';
import 'package:wordly/resources/resources.dart';

class TutorialPage extends StatelessWidget {
  const TutorialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: context.r.how_to_play),
      drawer: const CustomDrawer(),
      body: Center(child: Text(context.r.how_to_play)),
    );
  }
}
