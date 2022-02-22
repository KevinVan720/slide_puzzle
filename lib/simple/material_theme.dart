import 'dart:ui';
import 'package:flutter/material.dart';

import 'package:animated_styled_widget/animated_styled_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:neon/neon.dart';
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
            backgroundDecoration: BoxDecoration(color: PuzzleColors.grey5)),
      });

  @override
  Responsive<Style> get buttonStyle =>
      Responsive({
        smallScreen: defaultBaseStyle.copyWith(
          width: 72.0.toPXLength,
          height: 72.0.toPXLength,
          textStyle: DynamicTextStyle(
            letterSpacing: 1.toPXLength,
            fontSize:  28.toPXLength,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),

          backgroundDecoration: BoxDecoration(color: PuzzleColors.primary6),
        ),
        middleScreen: defaultBaseStyle.copyWith(
      width: 100.0.toPXLength,
      height: 100.0.toPXLength,
          textStyle: DynamicTextStyle(
            letterSpacing: 1.toPXLength,
            fontSize:  32.toPXLength,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
      backgroundDecoration: BoxDecoration(color: PuzzleColors.primary6),
      ),
        largeScreen: defaultBaseStyle.copyWith(
          width: 112.0.toPXLength,
          height: 112.0.toPXLength,
          textStyle: DynamicTextStyle(
            letterSpacing: 1.toPXLength,
            fontSize:  36.toPXLength,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
          backgroundDecoration: BoxDecoration(color: PuzzleColors.primary6),
        ),
      });

  @override
  Responsive<Style> get hoverStyle =>
      Responsive({
        smallScreen: defaultBaseStyle.copyWith(
          width: 72.0.toPXLength,
          height: 72.0.toPXLength,
          textStyle: DynamicTextStyle(
            letterSpacing: 1.toPXLength,
            fontSize:  28.toPXLength,
            fontWeight: FontWeight.w900,
            color: Colors.grey.shade50,
          ),
          backgroundDecoration: BoxDecoration(color: PuzzleColors.primary5),
        ),
        middleScreen: defaultBaseStyle.copyWith(
          width: 100.0.toPXLength,
          height: 100.0.toPXLength,
          textStyle: DynamicTextStyle(
            letterSpacing: 1.toPXLength,
            fontSize:  32.toPXLength,
            fontWeight: FontWeight.w900,
            color: Colors.grey.shade50,
          ),
          backgroundDecoration: BoxDecoration(color: PuzzleColors.primary5),
        ),
        largeScreen: defaultBaseStyle.copyWith(
          width: 112.0.toPXLength,
          height: 112.0.toPXLength,
          textStyle: DynamicTextStyle(
            letterSpacing: 1.toPXLength,
            fontSize:  36.toPXLength,
            fontWeight: FontWeight.w900,
            color: Colors.grey.shade50,
          ),
          backgroundDecoration: BoxDecoration(color: PuzzleColors.primary5),
        ),
      });

  @override
  Responsive<Style> get pressedStyle =>
      Responsive({
        smallScreen: defaultBaseStyle.copyWith(
          width: 72.0.toPXLength,
          height: 72.0.toPXLength,
          textStyle: DynamicTextStyle(
            letterSpacing: 1.toPXLength,
            fontSize:  28.toPXLength,
            fontWeight: FontWeight.w900,
            color: Colors.grey.shade50,
          ),
          backgroundDecoration: BoxDecoration(color: PuzzleColors.primary4),
        ),
        middleScreen: defaultBaseStyle.copyWith(
          width: 100.0.toPXLength,
          height: 100.0.toPXLength,
          textStyle: DynamicTextStyle(
            letterSpacing: 1.toPXLength,
            fontSize:  32.toPXLength,
            fontWeight: FontWeight.w900,
            color: Colors.grey.shade50,
          ),
          backgroundDecoration: BoxDecoration(color: PuzzleColors.primary4),
        ),
        largeScreen: defaultBaseStyle.copyWith(
          width: 112.0.toPXLength,
          height: 112.0.toPXLength,
          textStyle: DynamicTextStyle(
            letterSpacing: 1.toPXLength,
            fontSize:  36.toPXLength,
            fontWeight: FontWeight.w900,
            color: Colors.grey.shade50,
          ),
          backgroundDecoration: BoxDecoration(color: PuzzleColors.primary4),
        ),
      });

  @override
  bool get isLogoColored => true;

  @override
  DynamicTextStyle get menuActiveStyle => DynamicTextStyle(color: PuzzleColors.black,fontWeight: FontWeight.w800);

  @override
  Color get menuUnderlineColor => PuzzleColors.primary6;

  @override
  DynamicTextStyle get menuInactiveStyle => DynamicTextStyle(color: PuzzleColors.grey2,);

  @override
  String get audioControlOnAsset => 'assets/images/audio_control/simple_on.png';

  @override
  String get audioControlOffAsset =>
      'assets/images/audio_control/simple_off.png';

  @override
  PuzzleLayoutDelegate get layoutDelegate => const SimplePuzzleLayoutDelegate();

}

final defaultBaseStyle = Style(
    alignment: Alignment.center,
    childAlignment: Alignment.center,
    backgroundDecoration: BoxDecoration(color: PuzzleColors.primary6),
    shapeBorder: const RoundedRectangleShapeBorder(
        borderRadius: DynamicBorderRadius.all(const DynamicRadius.circular(
            const Length(10, unit: LengthUnit.px)))),
    mouseCursor: SystemMouseCursors.click);
