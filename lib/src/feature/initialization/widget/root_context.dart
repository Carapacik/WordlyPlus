import 'package:flutter/material.dart';
import 'package:wordly/src/core/common/layout/window_size.dart';
import 'package:wordly/src/feature/initialization/logic/composition_root.dart';
import 'package:wordly/src/feature/initialization/widget/bloc_scope.dart';
import 'package:wordly/src/feature/initialization/widget/dependencies_scope.dart';
import 'package:wordly/src/feature/initialization/widget/material_context.dart';
import 'package:wordly/src/feature/settings/widget/settings_scope.dart';

/// {@template app}
/// [RootContext] is an entry point to the application.
///
/// If a scope doesn't depend on any inherited widget returned by
/// [MaterialApp] or [WidgetsApp], like [Directionality] or [Theme],
/// and it should be available in the whole application, it can be
/// placed here.
/// {@endtemplate}
class RootContext extends StatelessWidget {
  /// {@macro app}
  const RootContext({required this.compositionResult, super.key});

  /// The result from the CompositionRoot, required to launch the application.
  final CompositionResult compositionResult;

  @override
  Widget build(BuildContext context) {
    return DependenciesScope(
      dependencies: compositionResult.dependencies,
      child: const BlocScope(
        child: SettingsScope(child: WindowSizeScope(child: MaterialContext())),
      ),
    );
  }
}
