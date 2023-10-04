import 'package:flutter/material.dart';
import 'package:wordly/src/core/localization/localization.dart';
import 'package:wordly/src/feature/initialization/model/dependencies.dart';
import 'package:wordly/src/feature/initialization/widget/dependencies_scope.dart';

extension BuildContextX on BuildContext {
  Dependencies get dependencies => DependenciesScope.of(this);

  ThemeData get theme => Theme.of(this);

  Localization get r => Localization.of(this);
}
