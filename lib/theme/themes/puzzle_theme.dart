import 'package:animated_styled_widget/animated_styled_widget.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:responsive_property/responsive_property.dart';
import 'package:very_good_slide_puzzle/layout/layout.dart';
import 'package:very_good_slide_puzzle/models/models.dart';
import 'package:very_good_slide_puzzle/theme/theme.dart';

enum TileAnimationType {
  grid,
  move,
}

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

  bool get useCupertinoIndicator;

  Curve get tileMoveAnimationCurve;

  Duration get tileMoveAnimationDuration;

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

  /// Styles related to the popup menu of this theme.
  Responsive<Style> get popupMenuStyle;

  Responsive<Style> get popupMenuTileStyle;

  Responsive<Style> get popupMenuButtonStyle;

  Responsive<Style> get popupMenuHoverStyle;

  Responsive<Style> get popupMenuPressedStyle;

  Responsive<Style> get popupMenuTitleStyle;

  Responsive<Style> get popupMenuSliderThumbStyle;

  Responsive<Style?> get popupMenuSliderThumbHoverStyle;

  Responsive<Style?> get popupMenuSliderThumbPressedStyle;

  Responsive<Style> get popupMenuSliderTrackStyle;

  Responsive<Style?> get popupMenuSliderActiveTrackStyle;

  Responsive<Style?> get popupMenuSliderTooltipStyle;

  bool get isPopupMenuSliderThumbContained;

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

  /// The inactive menu style.
  DynamicTextStyle get menuInactiveStyle;

  /// The puzzle layout delegate of this theme.
  ///
  /// Used for building sections of the puzzle UI.
  PuzzleLayoutDelegate get layoutDelegate;

  String get tilePressSoundAsset;

  @override
  List<Object?> get props => [
        name,
        hasTimer,
        tileMoveAnimationCurve,
        tileMoveAnimationDuration,
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
        menuInactiveStyle,
        layoutDelegate,
        tilePressSoundAsset,
        popupMenuStyle,
        popupMenuTileStyle,
        popupMenuButtonStyle,
        popupMenuHoverStyle,
        popupMenuPressedStyle,
        popupMenuTitleStyle,
        popupMenuSliderThumbStyle,
        popupMenuSliderThumbHoverStyle,
        popupMenuSliderThumbPressedStyle,
        popupMenuSliderTrackStyle,
        popupMenuSliderActiveTrackStyle,
        popupMenuSliderTooltipStyle,
        isPopupMenuSliderThumbContained,
        useCupertinoIndicator,
      ];
}
