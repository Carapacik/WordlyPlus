import 'package:freezed_annotation/freezed_annotation.dart';

part 'board_data.freezed.dart';
part 'board_data.g.dart';

@freezed
class BoardData with _$BoardData {
  const factory BoardData({
    List<String>? enBoard,
    List<String>? ruBoard,
  }) = _BoardData;

  factory BoardData.fromJson(Map<String, dynamic> json) =>
      _$BoardDataFromJson(json);
}