import 'dart:ui';
import 'package:flutter/material.dart';

import 'package:animated_styled_widget/animated_styled_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:very_good_slide_puzzle/colors/colors.dart';
import 'package:very_good_slide_puzzle/layout/layout.dart';
import 'package:very_good_slide_puzzle/simple/simple.dart';
import 'package:very_good_slide_puzzle/theme/themes/themes.dart';
import 'package:responsive_property/responsive_property.dart';


/// {@template simple_theme}
/// The simple puzzle theme.
/// {@endtemplate}
class MaterialTheme extends SimpleTheme {
  /// {@macro simple_theme}
  const MaterialTheme() : super();

  @override
  String get name => 'Material';

  @override
  bool get hasTimer => false;

  @override
  DynamicTextStyle get nameTextStyle =>
      DynamicTextStyle(color: PuzzleColors.grey1);

  @override
  DynamicTextStyle get titleTextStyle =>
      DynamicTextStyle(color: PuzzleColors.greenPrimary);

  @override
  DynamicTextStyle get defaultTextStyle =>
      DynamicTextStyle(color: PuzzleColors.primary5);

  @override
  Responsive<Style> get backgroundStyle => Responsive({
        allScreen: Style(
            backgroundDecoration: BoxDecoration(color: PuzzleColors.black2),
            textStyle: DynamicTextStyle(
              letterSpacing: 1.toPXLength,
              fontSize: Dimension.min(300.toPercentLength, 28.toPXLength),
              fontWeight: FontWeight.w900,
              color: Colors.white,
            ))
      });

  @override
  Responsive<Style> get buttonStyle =>
      Responsive({
        smallScreen: defaultBaseStyle.copyWith(
          width: 72.0.toPXLength,
          height: 72.0.toPXLength,
          backgroundDecoration: BoxDecoration(color: PuzzleColors.primary6),
        ),
        middleScreen: defaultBaseStyle.copyWith(
      width: 100.0.toPXLength,
      height: 100.0.toPXLength,
      backgroundDecoration: BoxDecoration(color: PuzzleColors.primary6),
      ),
        largeScreen: defaultBaseStyle.copyWith(
          width: 112.0.toPXLength,
          height: 112.0.toPXLength,
          backgroundDecoration: BoxDecoration(color: PuzzleColors.primary6),
        ),
      });

  @override
  Responsive<Style> get hoverStyle =>
      Responsive({
        smallScreen: defaultBaseStyle.copyWith(
          width: 72.0.toPXLength,
          height: 72.0.toPXLength,
          backgroundDecoration: BoxDecoration(color: PuzzleColors.primary7),
        ),
        middleScreen: defaultBaseStyle.copyWith(
          width: 100.0.toPXLength,
          height: 100.0.toPXLength,
          backgroundDecoration: BoxDecoration(color: PuzzleColors.primary7),
        ),
        largeScreen: defaultBaseStyle.copyWith(
          width: 112.0.toPXLength,
          height: 112.0.toPXLength,
          backgroundDecoration: BoxDecoration(color: PuzzleColors.primary7),
        ),
      });

  @override
  Responsive<Style> get pressedStyle =>
      Responsive({
        smallScreen: defaultBaseStyle.copyWith(
          width: 72.0.toPXLength,
          height: 72.0.toPXLength,
          backgroundDecoration: BoxDecoration(color: PuzzleColors.primary8),
        ),
        middleScreen: defaultBaseStyle.copyWith(
          width: 100.0.toPXLength,
          height: 100.0.toPXLength,
          backgroundDecoration: BoxDecoration(color: PuzzleColors.primary8),
        ),
        largeScreen: defaultBaseStyle.copyWith(
          width: 112.0.toPXLength,
          height: 112.0.toPXLength,
          backgroundDecoration: BoxDecoration(color: PuzzleColors.primary8),
        ),
      });

  @override
  bool get isLogoColored => true;

  @override
  Color get menuActiveColor => PuzzleColors.grey1;

  @override
  Color get menuUnderlineColor => PuzzleColors.primary6;

  @override
  Color get menuInactiveColor => PuzzleColors.grey2;

  @override
  String get audioControlOnAsset => 'assets/images/audio_control/simple_on.png';

  @override
  String get audioControlOffAsset =>
      'assets/images/audio_control/simple_off.png';

  @override
  PuzzleLayoutDelegate get layoutDelegate => const SimplePuzzleLayoutDelegate();

  @override
  List<Object?> get props => [
        name,
        audioControlOnAsset,
        audioControlOffAsset,
        hasTimer,
        nameTextStyle,
        titleTextStyle,
        backgroundStyle,
        defaultTextStyle,
        buttonStyle,
        hoverStyle,
        pressedStyle,
        isLogoColored,
        menuActiveColor,
        menuUnderlineColor,
        menuInactiveColor,
        layoutDelegate,
      ];
}

final defaultBaseStyle = Style(
    alignment: Alignment.center,
    childAlignment: Alignment.center,
    backgroundDecoration: BoxDecoration(color: PuzzleColors.primary6),
    textStyle: DynamicTextStyle(
      letterSpacing: 1.toPXLength,
      fontSize: Dimension.min(300.toPercentLength, 28.toPXLength),
      fontWeight: FontWeight.w900,
      color: Colors.white,
    ),
    mouseCursor: SystemMouseCursors.click);
