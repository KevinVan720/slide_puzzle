import 'package:animated_styled_widget/animated_styled_widget.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:responsive_property/responsive_property.dart';
import 'package:very_good_slide_puzzle/layout/layout.dart';
import 'package:very_good_slide_puzzle/theme/theme.dart';

/// {@template puzzle_theme}
/// Template for creating custom puzzle UI.
/// {@endtemplate}
abstract class PuzzleTheme extends Equatable {
  /// {@macro puzzle_theme}
  const PuzzleTheme();

  /// The display name of this theme.
  Map<Locale, String> get name;

  /// Whether this theme displays the puzzle timer.
  bool get hasTimer;

  /// The text style of [name].
  DynamicTextStyle get nameTextStyle;

  /// The text style of the puzzle title.
  DynamicTextStyle get titleTextStyle;

  /// The default text style of this theme.
  DynamicTextStyle get defaultTextStyle;

  ///
  Responsive<double> get tileSize;

  ///
  Responsive<double> get tileGapSize;

  /// The background style of this theme.
  Responsive<Style> get backgroundStyle;

  /// The board background style of this theme.
  Responsive<Style> get boardBackgroundStyle;

  /// The button style of this theme.
  Responsive<Style> get buttonStyle;

  /// The hover style of this theme.
  Responsive<Style> get hoverStyle;

  /// The pressed style of this theme.
  Responsive<Style> get pressedStyle;

  /// Whether Flutter logo is colored or white.
  ///
  /// Applied to the color of [AppFlutterLogo] displayed
  /// in the top left corner of the header.
  bool get isLogoColored;

  /// The active menu style.
  DynamicTextStyle get menuActiveStyle;

  /// The underline menu color.
  ///
  /// Applied to the underline of the currently active
  /// theme in menu, on a small layout.
  Color get menuUnderlineColor;

  /// The background color of popup menus.
  Color get popupMenuBackgroundColor;

  /// The inactive menu style.
  DynamicTextStyle get menuInactiveStyle;

  /// The puzzle layout delegate of this theme.
  ///
  /// Used for building sections of the puzzle UI.
  PuzzleLayoutDelegate get layoutDelegate;

  @override
  List<Object?> get props => [
        name,
        hasTimer,
        nameTextStyle,
        titleTextStyle,
        tileSize,
        tileGapSize,
        boardBackgroundStyle,
        backgroundStyle,
        defaultTextStyle,
        buttonStyle,
        hoverStyle,
        pressedStyle,
        isLogoColored,
        menuActiveStyle,
        menuUnderlineColor,
        popupMenuBackgroundColor,
        menuInactiveStyle,
        layoutDelegate,
      ];
}
