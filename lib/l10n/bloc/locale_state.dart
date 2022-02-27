// ignore_for_file: public_member_api_docs
part of 'locale_bloc.dart';

class LocaleState extends Equatable {
  const LocaleState({
    this.locale = const Locale('en'),
  });

  final Locale locale;

  LocaleState copyWith({
    Locale? locale,
  }) {
    return LocaleState(locale: locale ?? this.locale);
  }

  @override
  List<Object?> get props => [locale];
}
