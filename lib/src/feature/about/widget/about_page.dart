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
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            context.r.about,
            style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 32),
          ),
        ),
      ),
    );
  }
}
