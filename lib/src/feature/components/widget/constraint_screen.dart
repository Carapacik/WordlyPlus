import 'package:flutter/material.dart';

const maxMobileWidth = 800.0;

class ConstraintScreen extends StatelessWidget {
  const ConstraintScreen({required this.child, this.safeAreaBottom = true, super.key});

  final bool safeAreaBottom;
  final Widget child;

  @override
  Widget build(BuildContext context) => SafeArea(
    bottom: safeAreaBottom,
    child: Align(
      alignment: Alignment.topCenter,
      child: ConstrainedBox(constraints: const BoxConstraints(maxWidth: maxMobileWidth), child: child),
    ),
  );
}
