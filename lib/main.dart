import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:wordly/app.dart';
import 'package:wordly/bloc/main/main_cubit.dart';
import 'package:wordly/bloc/settings/settings_cubit.dart';
import 'package:wordly/data/models/board_data.dart';
import 'package:wordly/data/models/daily_result_data.dart';
import 'package:wordly/data/models/daily_statistic_data.dart';
import 'package:wordly/data/models/letter_entering.dart';
import 'package:wordly/data/models/level_data.dart';
import 'package:wordly/data/models/settings_data.dart';
import 'package:wordly/domain/daily_result_repository.dart';
import 'package:wordly/domain/daily_result_repository_imp.dart';
import 'package:wordly/domain/daily_statistic_repository.dart';
import 'package:wordly/domain/daily_statistic_repository_imp.dart';
import 'package:wordly/domain/settings_repository.dart';
import 'package:wordly/domain/settings_repository_imp.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  setPathUrlStrategy();
  await _initSingletons();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<SettingsCubit>(
          create: (_) =>
              SettingsCubit(GetIt.I<SettingsRepository>().settingsData),
        ),
        BlocProvider<MainCubit>(
          create: (_) => MainCubit(),
        ),
      ],
      child: const App(),
    ),
  );
}

Future<void> _initSingletons() async {
  await _initLocaleStorage();
  await _initDailyStatistic();
  await _initDailyResult();
  await _initSettings();
}

Future<void> _initLocaleStorage() async {
  String? directoryPath;
  if (!kIsWeb) {
    directoryPath = (await getApplicationSupportDirectory()).path;
  }
  final isar = await Isar.open(
    directory: directoryPath,
    schemas: [
      BoardDataSchema,
      DailyResultDataSchema,
      DailyStatisticDataSchema,
      LetterEnteringSchema,
      LevelDataSchema,
      SettingsDataSchema,
    ],
  );
  GetIt.I.registerLazySingleton<Isar>(() => isar);
}

Future<void> _initDailyStatistic() async {
  GetIt.I.registerSingleton<DailyStatisticRepository>(
    DailyStatisticRepositoryImp(),
  );
  await GetIt.I<DailyStatisticRepository>().initStatisticData();
}

Future<void> _initDailyResult() async {
  GetIt.I.registerSingleton<DailyResultRepository>(
    DailyResultRepositoryImp(),
  );
  await GetIt.I<DailyResultRepository>().initDailyResult();
}

Future<void> _initSettings() async {
  GetIt.I.registerSingleton<SettingsRepository>(
    SettingsRepositoryImp(),
  );
  await GetIt.I<SettingsRepository>().initSettings();
}
