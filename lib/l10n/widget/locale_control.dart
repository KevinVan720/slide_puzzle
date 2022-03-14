import 'package:animated_styled_widget/animated_styled_widget.dart';
import 'package:decorated_icon/decorated_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localized_locales/flutter_localized_locales.dart';
import 'package:gap/gap.dart';
import 'package:very_good_slide_puzzle/l10n/l10n.dart';
import 'package:very_good_slide_puzzle/layout/layout.dart';
import 'package:very_good_slide_puzzle/theme/theme.dart';
import 'package:very_good_slide_puzzle/typography/text_styles.dart';

/// {@template audio_control}
/// Displays and allows to update the current locale of the puzzle.
/// {@endtemplate}
class LocalePopup extends StatelessWidget {
  /// {@macro audio_control}
  const LocalePopup({Key? key}) : super(key: key);

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

    List<Shadow>? _iconShadow = theme.menuActiveStyle.shadows;

    return PopupMenuButton<Locale>(
      padding: EdgeInsets.zero,
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
          small: (_, __) => DecoratedIcon(
            Icons.language,
            size: 24,
            color: theme.menuActiveStyle.color,
            shadows: _iconShadow
                ?.map((e) => Shadow(
                    color: e.color, offset: e.offset, blurRadius: e.blurRadius))
                .toList(),
          ),
          medium: (_, __) => DecoratedIcon(
            Icons.language,
            size: 32,
            color: theme.menuActiveStyle.color,
            shadows: _iconShadow
                ?.map((e) => Shadow(
                    color: e.color, offset: e.offset, blurRadius: e.blurRadius))
                .toList(),
          ),
          large: (_, __) => DecoratedIcon(
            Icons.language,
            size: 36,
            color: theme.menuActiveStyle.color,
            shadows: _iconShadow
                ?.map((e) => Shadow(
                    color: e.color, offset: e.offset, blurRadius: e.blurRadius))
                .toList(),
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

class LocaleSelectList extends StatelessWidget {
  const LocaleSelectList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localeState = context.select((LocaleBloc bloc) => bloc.state);
    final theme = context.select((ThemeBloc bloc) => bloc.state.theme);

    ///the puzzle shuffle button gets the same style as the tiles buttons, except for the size and padding.

    //List<Shadow>? _iconShadow = theme.menuActiveStyle.shadows;

    return Column(
      children: [
        AnimatedStyledContainer(
            duration: PuzzleThemeAnimationDuration.backgroundColorChange,
            curve: Curves.easeInOut,
            style: theme.popupMenuTitleStyle.resolve(context)!,
            child: Builder(
              builder: (context) => Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(context.l10n.localeControl),
                  /*Gap(10),
                  DecoratedIcon(
                    Icons.language,
                    size: 16,
                    color: theme.menuActiveStyle.color,
                    shadows: _iconShadow
                        ?.map((e) => Shadow(
                            color: e.color,
                            offset: e.offset,
                            blurRadius: e.blurRadius))
                        .toList(),
                  ),*/
                ],
              ),
            )),
        ...AppLocalizations.supportedLocales
            .map((locale) => StyledButton(
                  style: locale == localeState.locale
                      ? theme.popupMenuPressedStyle.resolve(context)!
                      : theme.popupMenuButtonStyle.resolve(context)!,
                  hoveredStyle: theme.popupMenuHoverStyle.resolve(context),
                  pressedStyle: theme.popupMenuPressedStyle.resolve(context),
                  onPressed: locale == localeState.locale
                      ? null
                      : () {
                          context
                              .read<LocaleBloc>()
                              .add(LocaleChange(locale: locale));
                        },
                  child: Text(
                    _getLocaleDisplayName(context, locale),
                  ),
                ))
            .toList()
      ],
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
