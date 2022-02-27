// ignore_for_file: public_member_api_docs

part of 'locale_bloc.dart';

abstract class LocaleEvent extends Equatable {
  const LocaleEvent();

  @override
  List<Object> get props => [];
}

class LocaleChange extends LocaleEvent {
  const LocaleChange({required this.locale});

  final Locale locale;

  @override
  List<Object> get props => [locale];
}
