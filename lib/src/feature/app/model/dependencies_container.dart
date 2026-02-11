import 'package:package_info_plus/package_info_plus.dart';
import 'package:wordly/src/feature/app/model/application_config.dart';
import 'package:wordly/src/feature/game/domain/repositories/game_repository.dart';
import 'package:wordly/src/feature/level/level.dart';
import 'package:wordly/src/feature/settings/settings.dart';
import 'package:wordly/src/feature/statistic/statistic.dart';

class DependenciesContainer {
  const DependenciesContainer({
    required this.config,
    required this.packageInfo,
    required this.settingsContainer,
    required this.statisticsRepository,
    required this.levelRepository,
    required this.gameRepository,
  });

  final ApplicationConfig config;
  final PackageInfo packageInfo;
  final SettingsContainer settingsContainer;

  final IStatisticsRepository statisticsRepository;
  final ILevelRepository levelRepository;
  final IGameRepository gameRepository;
}
