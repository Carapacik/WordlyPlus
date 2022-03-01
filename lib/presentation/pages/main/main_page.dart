import 'package:flutter/material.dart';
import 'package:wordle/presentation/widgets/settings_dialog.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Wordle',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
        ),
        actions: [
          IconButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) => FullScreenDialog(),
                fullscreenDialog: true,
              ),
            ),
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: const Text("MainPage"),
    );
  }
}
