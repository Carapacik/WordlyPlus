import 'package:freezed_annotation/freezed_annotation.dart';

part 'daily_result.freezed.dart';
part 'daily_result.g.dart';

@freezed
class DailyResult with _$DailyResult {
  const factory DailyResult({
    @Default(true) bool isWin,
    String? word,
  }) = _DailyResult;

  factory DailyResult.fromJson(Map<String, dynamic> json) =>
      _$DailyResultFromJson(json);
}
