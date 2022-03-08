import 'dart:convert';

import 'package:wordle/data/models/daily_result.dart';
import 'package:wordle/data/repositories/save_reactive_repository.dart';
import 'package:wordle/data/shared_preferences_data.dart';

class SettingsRepository extends SaveReactiveRepository<DailyResult> {
  factory SettingsRepository.getInstance() => _instance ??=
      SettingsRepository._internal(SharedPreferenceData.getInstance());

  SettingsRepository._internal(this.spData);

  static SettingsRepository? _instance;

  final SharedPreferenceData spData;

  @override
  DailyResult convertFromString(String rawItem) =>
      DailyResult.fromJson(json.decode(rawItem) as Map<String, dynamic>);

  @override
  String convertToString(DailyResult item) => json.encode(item.toJson());

  @override
  Future<String?> getRawData() => spData.getDailyResult();

  @override
  Future<bool> setRawData(String item) => spData.saveDailyResult(item);
}
