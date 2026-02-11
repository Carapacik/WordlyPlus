import 'dart:async';

import 'package:wordly/src/core/common/common.dart';
import 'package:wordly/src/feature/settings/settings.dart';

abstract interface class SettingsService {
  /// Emits settings whenever they change.
  Stream<Settings> get stream;

  /// Current in-memory settings.
  Settings get current;

  /// Update settings transactionally and persist them.
  Future<void> update(Settings Function(Settings current) transform);
}

final class SettingsServiceImpl implements SettingsService {
  SettingsServiceImpl._(this._repository, this._current);

  /// Create a new [SettingsServiceImpl] with the given [repository].
  static Future<SettingsServiceImpl> create({required SettingsRepository repository}) async {
    final Settings current = await repository.read();
    return SettingsServiceImpl._(repository, current);
  }

  final SettingsRepository _repository;
  final _controller = StreamController<Settings>.broadcast();
  final _mutex = MutexLock();
  Settings _current;

  @override
  Stream<Settings> get stream => _controller.stream;

  @override
  Settings get current => _current;

  @override
  Future<void> update(Settings Function(Settings settings) transform) => _mutex.runLocked(() async {
    final Settings updated = transform(current);
    await _repository.save(updated);
    _current = updated;
    _controller.add(updated);
  });
}
