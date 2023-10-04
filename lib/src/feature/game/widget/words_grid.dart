import 'package:flutter/material.dart';

class WordsGrid extends StatelessWidget {
  const WordsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 350),
        child: GridView.builder(
          itemCount: 30,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          primary: false,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
          ),
          itemBuilder: (_, index) => const GridTile(),
        ),
      ),
    );
  }
}

class GridTile extends StatelessWidget {
  const GridTile({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        constraints: const BoxConstraints(maxHeight: 60, maxWidth: 60),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            width: 3,
            color: Colors.grey,
          ),
        ),
        child: FittedBox(
          child: Text('A'),
        ),
      ),
    );
  }
}
