import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wordly/src/core/utils/extensions/extensions.dart';
import 'package:wordly/src/feature/app/logic/dictionary_bloc.dart';
import 'package:wordly/src/feature/initialization/widget/dependencies_scope.dart';

/// {@template theme_controller}
/// A controller that holds and operates the app dictionary.
/// {@endtemplate}
abstract interface class DictionaryController {
  /// Get the current dictionary.
  Locale get dictionary;

  /// Set the dictionary to [dictionary].
  void setDictionary(Locale dictionary);
}

/// [DictionaryScope] is responsible for handling dictionary-related stuff.
///
/// Provides a [DictionaryController] to hold and operate the app dictionary.
///
/// The [DictionaryController] can be obtained using the static method [of], which
/// returns the [DictionaryController] of the closest [DictionaryScope] ancestor.
///
/// The [DictionaryScope] is implemented as a [StatefulWidget] with a [State] that
/// implements the [DictionaryController] interface. The [State] subscribes to the
/// [DictionaryBloc] to listen for changes in the dictionary state, and updates the
/// [DictionaryController] with the new dictionary when it changes.
class DictionaryScope extends StatefulWidget {
  /// Creates a new [DictionaryScope] with the given child widget.
  const DictionaryScope({
    required this.child,
    super.key,
  });

  /// The child widget.
  final Widget child;

  /// Returns the [DictionaryController] of the closest [DictionaryScope] ancestor.
  ///
  /// If [listen] is true (the default), the returned [DictionaryController] will
  /// rebuild the widget when the dictionary changes. If [listen] is false, the
  /// returned [DictionaryController] will not rebuild the widget when the dictionary
  /// changes.
  static DictionaryController of(
    BuildContext context, {
    bool listen = true,
  }) =>
      context.inhOf<_DictionaryInherited>(listen: listen).controller;

  @override
  State<DictionaryScope> createState() => _DictionaryScopeState();
}

/// The [State] of the [DictionaryScope] widget.
///
/// Implements the [DictionaryController] interface to hold and operate the app
/// dictionary.
class _DictionaryScopeState extends State<DictionaryScope> implements DictionaryController {
  late DictionaryState _state;

  late final DictionaryBloc _bloc;

  StreamSubscription<void>? _subscription;

  /// Listener for changes in the dictionary state.
  ///
  /// Updates the [_state] with the new dictionary state, and rebuilds the widget.
  void _listener(DictionaryState state) {
    if (_state == state) {
      return;
    }

    setState(() => _state = state);
  }

  @override
  void initState() {
    _bloc = DictionaryBloc(
      dictionaryRepository: DependenciesScope.of(context).dictionaryRepository,
    );

    _state = _bloc.state;

    _subscription = _bloc.stream.listen(_listener);
    super.initState();
  }

  @override
  void dispose() {
    unawaited(_bloc.close());
    unawaited(_subscription?.cancel());
    super.dispose();
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<Locale>('dictionary', dictionary));
  }

  @override
  void setDictionary(Locale dictionary) => _bloc.add(
        DictionaryEvent.update(dictionary),
      );

  @override
  Locale get dictionary => _state.dictionary;

  @override
  Widget build(BuildContext context) => _DictionaryInherited(
        controller: this,
        state: _state,
        child: widget.child,
      );
}

/// An [InheritedWidget] that holds the [DictionaryController] and the current
/// dictionary state.
class _DictionaryInherited extends InheritedWidget {
  const _DictionaryInherited({
    required this.controller,
    required this.state,
    required super.child,
  });

  /// The [DictionaryController] to hold and operate the app dictionary.
  final DictionaryController controller;

  /// The current dictionary state.
  final DictionaryState state;

  @override
  bool updateShouldNotify(covariant _DictionaryInherited oldWidget) => oldWidget.state != state;
}
