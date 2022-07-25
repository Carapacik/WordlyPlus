import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'locale_bloc.freezed.dart';
part 'locale_event.dart';
part 'locale_state.dart';

class LocaleBloc extends Bloc<LocaleEvent, LocaleState> {
  LocaleBloc(String locale) : super(LocaleState.changeLocale(locale: locale)) {
    on<_LocaleChangedEvent>(_onLocaleChanged);
  }

  void _onLocaleChanged(
    _LocaleChangedEvent event,
    Emitter<LocaleState> emit,
  ) {
    emit(LocaleState.changeLocale(locale: event.locale));
  }
}
