import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localized_locales/flutter_localized_locales.dart';
import 'package:very_good_slide_puzzle/l10n/l10n.dart';
import 'package:very_good_slide_puzzle/theme/theme.dart';
import 'package:very_good_slide_puzzle/layout/layout.dart';
import 'package:very_good_slide_puzzle/typography/text_styles.dart';

/// {@template audio_control}
/// Displays and allows to update the current locale of the puzzle.
/// {@endtemplate}
class LocaleControl extends StatelessWidget {
  /// {@macro audio_control}
  const LocaleControl({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localeState = context.select((LocaleBloc bloc) => bloc.state);
    final theme = context.select((ThemeBloc bloc) => bloc.state.theme);

    final selectedStyle = theme.menuActiveStyle.toTextStyle(
        screenSize: MediaQuery.of(context).size,
        parentFontSize: DefaultTextStyle.of(context).style.fontSize ?? 24.0);
    final unselectedStyle = theme.menuInactiveStyle.toTextStyle(
        screenSize: MediaQuery.of(context).size,
        parentFontSize: DefaultTextStyle.of(context).style.fontSize ?? 24.0);

    return PopupMenuButton<Locale>(
      padding: EdgeInsets.zero,
      color: theme.popupMenuBackgroundColor,
      onSelected: (value) {
        context.read<LocaleBloc>().add(LocaleChange(locale: value));
      },
      itemBuilder: (context) => AppLocalizations.supportedLocales
          .map((locale) => PopupMenuItem<Locale>(
                value: locale,
                child: Text(
                  _getLocaleDisplayName(context, locale),
                ),
                textStyle: (localeState.locale == locale
                        ? selectedStyle
                        : unselectedStyle)
                    .merge(PuzzleTextStyle.bodySmall),
              ))
          .toList(),
      child: AnimatedSwitcher(
        duration: PuzzleThemeAnimationDuration.backgroundColorChange,
        child: ResponsiveLayoutBuilder(
          small: (_, __) => Icon(
            Icons.language,
            size: 24,
            color: theme.menuActiveStyle.color,
          ),
          medium: (_, __) => Icon(
            Icons.language,
            size: 33,
            color: theme.menuActiveStyle.color,
          ),
          large: (_, __) => Icon(
            Icons.language,
            size: 33,
            color: theme.menuActiveStyle.color,
          ),
        ),
      ),
    );
  }

  String _getLocaleDisplayName(BuildContext context, Locale locale) {
    final localeCode = locale.toString();
    final localeName = LocaleNames.of(context)?.nameOf(localeCode);
    if (localeName != null) {
      final localeNativeName =
          LocaleNamesLocalizationsDelegate.nativeLocaleNames[localeCode];
      return localeName;
    } else {
      // gsw, fil, and es_419 aren't in flutter_localized_countries' dataset
      // so we handle them separately
      switch (localeCode) {
        case 'gsw':
          return 'Schwiizertüütsch';
        case 'fil':
          return 'Filipino';
        case 'es_419':
          return 'español (Latinoamérica)';
      }
    }
    return localeCode;
  }
}
