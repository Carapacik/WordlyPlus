import 'package:flutter/material.dart';

class ConstraintScreen extends StatelessWidget {
  const ConstraintScreen({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Align(
          alignment: Alignment.topCenter,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 400),
            child: child,
          ),
        ),
      );
}
