// ignore_for_file: public_member_api_docs

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'locale_event.dart';
part 'locale_state.dart';

class LocaleBloc extends Bloc<LocaleEvent, LocaleState> {
  LocaleBloc() : super(const LocaleState()) {
    on<LocaleChange>(_onLocaleChange);
  }

  void _onLocaleChange(
    LocaleChange event,
    Emitter<LocaleState> emit,
  ) {
    emit(
      LocaleState(locale: event.locale),
    );
  }
}
