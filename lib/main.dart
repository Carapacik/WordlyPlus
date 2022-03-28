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
import 'package:wordly/domain/daily_statistic_repository.dart';
import 'package:wordly/domain/daily_statistic_repository_imp.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  setPathUrlStrategy();
  initSingletons();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<SettingsCubit>(
          create: (_) => SettingsCubit(),
        ),
        BlocProvider<MainCubit>(
          create: (_) => MainCubit(),
        ),
      ],
      child: const App(),
    ),
  );
}

Future<void> initSingletons() async {
  await initLocaleStorage();
  await initDailyStatistic();
  await initDailyResult();
}

Future<void> initLocaleStorage() async {
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
  GetIt.instance.registerLazySingleton<Isar>(() => isar);
}

Future<void> initDailyStatistic() async {
  GetIt.instance.registerSingleton<DailyStatisticRepository>(
    DailyStatisticRepositoryImp(),
  );
  await GetIt.I<DailyStatisticRepository>().getStatisticData();
}

Future<void> initDailyResult() async {}
