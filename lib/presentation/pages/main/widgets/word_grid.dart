import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:wordly/bloc/main/main_cubit.dart';
import 'package:wordly/bloc/settings/settings_cubit.dart';
import 'package:wordly/data/models/letter_entering.dart';
import 'package:wordly/data/models/letter_status.dart';
import 'package:wordly/data/repositories/dictionary_repository.dart';
import 'package:wordly/resources/resources.dart';

class WordsGrid extends StatelessWidget {
  const WordsGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      buildWhen: (previous, current) =>
          previous.dictionaryLanguage != current.dictionaryLanguage,
      builder: (context, state) {
        return BlocBuilder<MainCubit, MainState>(
          buildWhen: (_, currentState) => currentState is GridUpdateState,
          builder: (_, state) {
            final dictionaryRepository = GetIt.I<DictionaryRepository>();
            return ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width > 400
                    ? 400
                    : double.infinity,
              ),
              child: GridView.count(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                shrinkWrap: true,
                primary: false,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                crossAxisCount: 5,
                children: List.generate(30, (index) {
                  final letterEntering =
                      dictionaryRepository.getLetterStatusByIndex(index);
                  return _GridItem(letterEntering: letterEntering);
                }),
              ),
            );
          },
        );
      },
    );
  }
}

class _GridItem extends StatelessWidget {
  const _GridItem({
    Key? key,
    required this.letterEntering,
  }) : super(key: key);

  final LetterEntering letterEntering;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      buildWhen: (previous, current) =>
          previous.isHighContrast != current.isHighContrast,
      builder: (context, state) {
        return AspectRatio(
          aspectRatio: 1,
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: letterEntering.letterStatus
                  .itemColor(context, isHighContrast: state.isHighContrast),
              border: letterEntering.letterStatus == LetterStatus.unknown
                  ? Border.all(
                      width: 3,
                      color: Theme.of(context).cardColor,
                    )
                  : null,
            ),
            child: Text(
              letterEntering.letter.toUpperCase(),
              style: AppTypography.b30.copyWith(
                color: letterEntering.letterStatus != LetterStatus.unknown
                    ? Colors.black
                    : null,
              ),
            ),
          ),
        );
      },
    );
  }
}
