import 'package:flutter/material.dart';
import 'package:wordly/src/core/utils/extensions/extensions.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Title(
      color: Colors.black,
      title: context.r.about,
      child: Scaffold(
        appBar: AppBar(title: Text(context.r.about), centerTitle: true),
      ),
    );
  }
}
