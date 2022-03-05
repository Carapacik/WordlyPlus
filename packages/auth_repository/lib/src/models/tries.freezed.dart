// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'tries.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Tries _$TriesFromJson(Map<String, dynamic> json) {
  return _Tries.fromJson(json);
}

/// @nodoc
class _$TriesTearOff {
  const _$TriesTearOff();

  _Tries call(
      {int first = 0,
      int second = 0,
      int third = 0,
      int fourth = 0,
      int fifth = 0,
      int sixth = 0}) {
    return _Tries(
      first: first,
      second: second,
      third: third,
      fourth: fourth,
      fifth: fifth,
      sixth: sixth,
    );
  }

  Tries fromJson(Map<String, Object?> json) {
    return Tries.fromJson(json);
  }
}

/// @nodoc
const $Tries = _$TriesTearOff();

/// @nodoc
mixin _$Tries {
  int get first => throw _privateConstructorUsedError;
  int get second => throw _privateConstructorUsedError;
  int get third => throw _privateConstructorUsedError;
  int get fourth => throw _privateConstructorUsedError;
  int get fifth => throw _privateConstructorUsedError;
  int get sixth => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TriesCopyWith<Tries> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TriesCopyWith<$Res> {
  factory $TriesCopyWith(Tries value, $Res Function(Tries) then) =
      _$TriesCopyWithImpl<$Res>;
  $Res call(
      {int first, int second, int third, int fourth, int fifth, int sixth});
}

/// @nodoc
class _$TriesCopyWithImpl<$Res> implements $TriesCopyWith<$Res> {
  _$TriesCopyWithImpl(this._value, this._then);

  final Tries _value;
  // ignore: unused_field
  final $Res Function(Tries) _then;

  @override
  $Res call({
    Object? first = freezed,
    Object? second = freezed,
    Object? third = freezed,
    Object? fourth = freezed,
    Object? fifth = freezed,
    Object? sixth = freezed,
  }) {
    return _then(_value.copyWith(
      first: first == freezed
          ? _value.first
          : first // ignore: cast_nullable_to_non_nullable
              as int,
      second: second == freezed
          ? _value.second
          : second // ignore: cast_nullable_to_non_nullable
              as int,
      third: third == freezed
          ? _value.third
          : third // ignore: cast_nullable_to_non_nullable
              as int,
      fourth: fourth == freezed
          ? _value.fourth
          : fourth // ignore: cast_nullable_to_non_nullable
              as int,
      fifth: fifth == freezed
          ? _value.fifth
          : fifth // ignore: cast_nullable_to_non_nullable
              as int,
      sixth: sixth == freezed
          ? _value.sixth
          : sixth // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$TriesCopyWith<$Res> implements $TriesCopyWith<$Res> {
  factory _$TriesCopyWith(_Tries value, $Res Function(_Tries) then) =
      __$TriesCopyWithImpl<$Res>;
  @override
  $Res call(
      {int first, int second, int third, int fourth, int fifth, int sixth});
}

/// @nodoc
class __$TriesCopyWithImpl<$Res> extends _$TriesCopyWithImpl<$Res>
    implements _$TriesCopyWith<$Res> {
  __$TriesCopyWithImpl(_Tries _value, $Res Function(_Tries) _then)
      : super(_value, (v) => _then(v as _Tries));

  @override
  _Tries get _value => super._value as _Tries;

  @override
  $Res call({
    Object? first = freezed,
    Object? second = freezed,
    Object? third = freezed,
    Object? fourth = freezed,
    Object? fifth = freezed,
    Object? sixth = freezed,
  }) {
    return _then(_Tries(
      first: first == freezed
          ? _value.first
          : first // ignore: cast_nullable_to_non_nullable
              as int,
      second: second == freezed
          ? _value.second
          : second // ignore: cast_nullable_to_non_nullable
              as int,
      third: third == freezed
          ? _value.third
          : third // ignore: cast_nullable_to_non_nullable
              as int,
      fourth: fourth == freezed
          ? _value.fourth
          : fourth // ignore: cast_nullable_to_non_nullable
              as int,
      fifth: fifth == freezed
          ? _value.fifth
          : fifth // ignore: cast_nullable_to_non_nullable
              as int,
      sixth: sixth == freezed
          ? _value.sixth
          : sixth // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Tries implements _Tries {
  const _$_Tries(
      {this.first = 0,
      this.second = 0,
      this.third = 0,
      this.fourth = 0,
      this.fifth = 0,
      this.sixth = 0});

  factory _$_Tries.fromJson(Map<String, dynamic> json) =>
      _$$_TriesFromJson(json);

  @JsonKey()
  @override
  final int first;
  @JsonKey()
  @override
  final int second;
  @JsonKey()
  @override
  final int third;
  @JsonKey()
  @override
  final int fourth;
  @JsonKey()
  @override
  final int fifth;
  @JsonKey()
  @override
  final int sixth;

  @override
  String toString() {
    return 'Tries(first: $first, second: $second, third: $third, fourth: $fourth, fifth: $fifth, sixth: $sixth)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Tries &&
            const DeepCollectionEquality().equals(other.first, first) &&
            const DeepCollectionEquality().equals(other.second, second) &&
            const DeepCollectionEquality().equals(other.third, third) &&
            const DeepCollectionEquality().equals(other.fourth, fourth) &&
            const DeepCollectionEquality().equals(other.fifth, fifth) &&
            const DeepCollectionEquality().equals(other.sixth, sixth));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(first),
      const DeepCollectionEquality().hash(second),
      const DeepCollectionEquality().hash(third),
      const DeepCollectionEquality().hash(fourth),
      const DeepCollectionEquality().hash(fifth),
      const DeepCollectionEquality().hash(sixth));

  @JsonKey(ignore: true)
  @override
  _$TriesCopyWith<_Tries> get copyWith =>
      __$TriesCopyWithImpl<_Tries>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TriesToJson(this);
  }
}

abstract class _Tries implements Tries {
  const factory _Tries(
      {int first,
      int second,
      int third,
      int fourth,
      int fifth,
      int sixth}) = _$_Tries;

  factory _Tries.fromJson(Map<String, dynamic> json) = _$_Tries.fromJson;

  @override
  int get first;
  @override
  int get second;
  @override
  int get third;
  @override
  int get fourth;
  @override
  int get fifth;
  @override
  int get sixth;
  @override
  @JsonKey(ignore: true)
  _$TriesCopyWith<_Tries> get copyWith => throw _privateConstructorUsedError;
}
