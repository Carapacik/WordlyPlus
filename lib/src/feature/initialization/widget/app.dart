import 'package:flutter/material.dart';
import 'package:wordly/src/core/utils/layout/layout.dart';
import 'package:wordly/src/feature/initialization/logic/composition_root.dart';
import 'package:wordly/src/feature/initialization/widget/bloc_scope.dart';
import 'package:wordly/src/feature/initialization/widget/dependencies_scope.dart';
import 'package:wordly/src/feature/initialization/widget/material_context.dart';
import 'package:wordly/src/feature/settings/widget/settings_scope.dart';

/// {@template app}
/// [App] is an entry point to the application.
///
/// If a scope doesn't depend on any inherited widget returned by
/// [MaterialApp] or [WidgetsApp], like [Directionality] or [Theme],
/// and it should be available in the whole application, it can be
/// placed here.
/// {@endtemplate}
class App extends StatelessWidget {
  /// {@macro app}
  const App({required this.result, super.key});

  /// The result from the [CompositionRoot].
  final CompositionResult result;

  @override
  Widget build(BuildContext context) => DependenciesScope(
        dependencies: result.dependencies,
        child: const SettingsScope(
          child: BlocScope(child: WindowSizeScope(child: MaterialContext())),
        ),
      );
}
