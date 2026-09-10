abstract base class const PersistedColumn<T extends Object>() {
  Future<T?> read();

  Future<void> set(T value);

  Future<void> remove();

  Future<void> setIfNullRemove(T? value) => value == null ? remove() : set(value);
}
