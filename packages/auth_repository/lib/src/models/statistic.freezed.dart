// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'statistic.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Statistic _$StatisticFromJson(Map<String, dynamic> json) {
  return Data.fromJson(json);
}

/// @nodoc
class _$StatisticTearOff {
  const _$StatisticTearOff();

  Data call(
      {int win = 0,
      int loses = 0,
      int maxStreak = 0,
      required String uid,
      double winRate = 0,
      Tries tries = const Tries()}) {
    return Data(
      win: win,
      loses: loses,
      maxStreak: maxStreak,
      uid: uid,
      winRate: winRate,
      tries: tries,
    );
  }

  Statistic fromJson(Map<String, Object?> json) {
    return Statistic.fromJson(json);
  }
}

/// @nodoc
const $Statistic = _$StatisticTearOff();

/// @nodoc
mixin _$Statistic {
  int get win => throw _privateConstructorUsedError;
  int get loses => throw _privateConstructorUsedError;
  int get maxStreak => throw _privateConstructorUsedError;
  String get uid => throw _privateConstructorUsedError;
  double get winRate => throw _privateConstructorUsedError;
  Tries get tries => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StatisticCopyWith<Statistic> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatisticCopyWith<$Res> {
  factory $StatisticCopyWith(Statistic value, $Res Function(Statistic) then) =
      _$StatisticCopyWithImpl<$Res>;
  $Res call(
      {int win,
      int loses,
      int maxStreak,
      String uid,
      double winRate,
      Tries tries});

  $TriesCopyWith<$Res> get tries;
}

/// @nodoc
class _$StatisticCopyWithImpl<$Res> implements $StatisticCopyWith<$Res> {
  _$StatisticCopyWithImpl(this._value, this._then);

  final Statistic _value;
  // ignore: unused_field
  final $Res Function(Statistic) _then;

  @override
  $Res call({
    Object? win = freezed,
    Object? loses = freezed,
    Object? maxStreak = freezed,
    Object? uid = freezed,
    Object? winRate = freezed,
    Object? tries = freezed,
  }) {
    return _then(_value.copyWith(
      win: win == freezed
          ? _value.win
          : win // ignore: cast_nullable_to_non_nullable
              as int,
      loses: loses == freezed
          ? _value.loses
          : loses // ignore: cast_nullable_to_non_nullable
              as int,
      maxStreak: maxStreak == freezed
          ? _value.maxStreak
          : maxStreak // ignore: cast_nullable_to_non_nullable
              as int,
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      winRate: winRate == freezed
          ? _value.winRate
          : winRate // ignore: cast_nullable_to_non_nullable
              as double,
      tries: tries == freezed
          ? _value.tries
          : tries // ignore: cast_nullable_to_non_nullable
              as Tries,
    ));
  }

  @override
  $TriesCopyWith<$Res> get tries {
    return $TriesCopyWith<$Res>(_value.tries, (value) {
      return _then(_value.copyWith(tries: value));
    });
  }
}

/// @nodoc
abstract class $DataCopyWith<$Res> implements $StatisticCopyWith<$Res> {
  factory $DataCopyWith(Data value, $Res Function(Data) then) =
      _$DataCopyWithImpl<$Res>;
  @override
  $Res call(
      {int win,
      int loses,
      int maxStreak,
      String uid,
      double winRate,
      Tries tries});

  @override
  $TriesCopyWith<$Res> get tries;
}

/// @nodoc
class _$DataCopyWithImpl<$Res> extends _$StatisticCopyWithImpl<$Res>
    implements $DataCopyWith<$Res> {
  _$DataCopyWithImpl(Data _value, $Res Function(Data) _then)
      : super(_value, (v) => _then(v as Data));

  @override
  Data get _value => super._value as Data;

  @override
  $Res call({
    Object? win = freezed,
    Object? loses = freezed,
    Object? maxStreak = freezed,
    Object? uid = freezed,
    Object? winRate = freezed,
    Object? tries = freezed,
  }) {
    return _then(Data(
      win: win == freezed
          ? _value.win
          : win // ignore: cast_nullable_to_non_nullable
              as int,
      loses: loses == freezed
          ? _value.loses
          : loses // ignore: cast_nullable_to_non_nullable
              as int,
      maxStreak: maxStreak == freezed
          ? _value.maxStreak
          : maxStreak // ignore: cast_nullable_to_non_nullable
              as int,
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      winRate: winRate == freezed
          ? _value.winRate
          : winRate // ignore: cast_nullable_to_non_nullable
              as double,
      tries: tries == freezed
          ? _value.tries
          : tries // ignore: cast_nullable_to_non_nullable
              as Tries,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$Data implements Data {
  _$Data(
      {this.win = 0,
      this.loses = 0,
      this.maxStreak = 0,
      required this.uid,
      this.winRate = 0,
      this.tries = const Tries()});

  factory _$Data.fromJson(Map<String, dynamic> json) => _$$DataFromJson(json);

  @JsonKey()
  @override
  final int win;
  @JsonKey()
  @override
  final int loses;
  @JsonKey()
  @override
  final int maxStreak;
  @override
  final String uid;
  @JsonKey()
  @override
  final double winRate;
  @JsonKey()
  @override
  final Tries tries;

  @override
  String toString() {
    return 'Statistic(win: $win, loses: $loses, maxStreak: $maxStreak, uid: $uid, winRate: $winRate, tries: $tries)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Data &&
            const DeepCollectionEquality().equals(other.win, win) &&
            const DeepCollectionEquality().equals(other.loses, loses) &&
            const DeepCollectionEquality().equals(other.maxStreak, maxStreak) &&
            const DeepCollectionEquality().equals(other.uid, uid) &&
            const DeepCollectionEquality().equals(other.winRate, winRate) &&
            const DeepCollectionEquality().equals(other.tries, tries));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(win),
      const DeepCollectionEquality().hash(loses),
      const DeepCollectionEquality().hash(maxStreak),
      const DeepCollectionEquality().hash(uid),
      const DeepCollectionEquality().hash(winRate),
      const DeepCollectionEquality().hash(tries));

  @JsonKey(ignore: true)
  @override
  $DataCopyWith<Data> get copyWith =>
      _$DataCopyWithImpl<Data>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DataToJson(this);
  }
}

abstract class Data implements Statistic {
  factory Data(
      {int win,
      int loses,
      int maxStreak,
      required String uid,
      double winRate,
      Tries tries}) = _$Data;

  factory Data.fromJson(Map<String, dynamic> json) = _$Data.fromJson;

  @override
  int get win;
  @override
  int get loses;
  @override
  int get maxStreak;
  @override
  String get uid;
  @override
  double get winRate;
  @override
  Tries get tries;
  @override
  @JsonKey(ignore: true)
  $DataCopyWith<Data> get copyWith => throw _privateConstructorUsedError;
}
