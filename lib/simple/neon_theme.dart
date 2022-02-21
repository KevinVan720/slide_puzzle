import 'dart:ui';

import 'package:animated_styled_widget/animated_styled_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:very_good_slide_puzzle/colors/colors.dart';
import 'package:very_good_slide_puzzle/layout/layout.dart';
import 'package:very_good_slide_puzzle/simple/simple.dart';
import 'package:very_good_slide_puzzle/theme/themes/themes.dart';
import 'package:responsive_property/responsive_property.dart';
import 'package:flutter/material.dart';

/// {@template simple_theme}
/// The simple puzzle theme.
/// {@endtemplate}
class NeonSimpleTheme extends SimpleTheme {
  /// {@macro simple_theme}
  const NeonSimpleTheme() : super();

  @override
  String get name => 'Neon';

  @override
  bool get hasTimer => false;

  @override
  DynamicTextStyle get nameTextStyle =>
      DynamicTextStyle(color: PuzzleColors.grey1);

  @override
  DynamicTextStyle get titleTextStyle =>
      DynamicTextStyle(color: Colors.green);

  @override
  DynamicTextStyle get defaultTextStyle =>
      DynamicTextStyle(color: PuzzleColors.primary7);

  @override
  Responsive<Style> get backgroundStyle => Responsive({
        allScreen: Style(
            backgroundDecoration: BoxDecoration(color: PuzzleColors.black2))
      });

  @override
  Responsive<Style> get buttonStyle => Responsive({
        smallScreen: neonBaseStyle.copyWith(
          width: 72.0.toPXLength,
          height: 72.0.toPXLength,
          shapeBorder: RoundedRectangleShapeBorder(
              borderRadius: DynamicBorderRadius.all(
                  DynamicRadius.circular(15.toPXLength)),
              borderSides: RectangleBorderSides.only(
                  top: DynamicBorderSide(
                      gradient: LinearGradient(colors: [
                        Colors.cyanAccent.shade100,
                        Colors.purpleAccent.shade100
                      ]),
                      width: 6),
                  bottom: DynamicBorderSide(
                      gradient:
                          LinearGradient(colors: [Colors.cyan, Colors.purple]),
                      width: 12),
                  left: DynamicBorderSide(
                      color: Colors.cyanAccent.shade200, width: 6),
                  right: DynamicBorderSide(
                      color: Colors.purpleAccent, width: 12))),
        ),
        middleScreen: neonBaseStyle.copyWith(
          width: 100.0.toPXLength,
          height: 100.0.toPXLength,
          shapeBorder: RoundedRectangleShapeBorder(
              borderRadius: DynamicBorderRadius.all(
                  DynamicRadius.circular(15.toPXLength)),
              borderSides: RectangleBorderSides.only(
                  top: DynamicBorderSide(
                      gradient: LinearGradient(colors: [
                        Colors.cyanAccent.shade100,
                        Colors.purpleAccent.shade100
                      ]),
                      width: 8),
                  bottom: DynamicBorderSide(
                      gradient:
                          LinearGradient(colors: [Colors.cyan, Colors.purple]),
                      width: 16),
                  left: DynamicBorderSide(
                      color: Colors.cyanAccent.shade200, width: 8),
                  right: DynamicBorderSide(
                      color: Colors.purpleAccent, width: 16))),
        ),
        largeScreen: neonBaseStyle.copyWith(
          width: 112.0.toPXLength,
          height: 112.0.toPXLength,
          shapeBorder: RoundedRectangleShapeBorder(
              borderRadius: DynamicBorderRadius.all(
                  DynamicRadius.circular(15.toPXLength)),
              borderSides: RectangleBorderSides.only(
                  top: DynamicBorderSide(
                      gradient: LinearGradient(colors: [
                        Colors.cyanAccent.shade100,
                        Colors.purpleAccent.shade100
                      ]),
                      width: 10),
                  bottom: DynamicBorderSide(
                      gradient:
                          LinearGradient(colors: [Colors.cyan, Colors.purple]),
                      width: 20),
                  left: DynamicBorderSide(
                      color: Colors.cyanAccent.shade200, width: 10),
                  right: DynamicBorderSide(
                      color: Colors.purpleAccent, width: 20))),
        )
      });

  @override
  Responsive<Style> get hoverStyle => Responsive({
    smallScreen: neonBaseStyle.copyWith(
      width: 72.0.toPXLength,
      height: 72.0.toPXLength,
      shapeBorder: RoundedRectangleShapeBorder(
          borderRadius: DynamicBorderRadius.all(
              DynamicRadius.circular(15.toPXLength)),
          borderSides: RectangleBorderSides.only(
              top: DynamicBorderSide(
                  gradient: LinearGradient(colors: [
                    Colors.cyanAccent.shade100,
                    Colors.purpleAccent.shade100
                  ]),
                  width: 5),
              bottom: DynamicBorderSide(
                  gradient:
                  LinearGradient(colors: [Colors.cyan, Colors.purple]),
                  width: 10),
              left: DynamicBorderSide(
                  color: Colors.cyanAccent.shade200, width: 5),
              right: DynamicBorderSide(
                  color: Colors.purpleAccent, width: 10))),
    ),
    middleScreen: neonBaseStyle.copyWith(
      width: 100.0.toPXLength,
      height: 100.0.toPXLength,
      shapeBorder: RoundedRectangleShapeBorder(
          borderRadius: DynamicBorderRadius.all(
              DynamicRadius.circular(15.toPXLength)),
          borderSides: RectangleBorderSides.only(
              top: DynamicBorderSide(
                  gradient: LinearGradient(colors: [
                    Colors.cyanAccent.shade100,
                    Colors.purpleAccent.shade100
                  ]),
                  width: 7),
              bottom: DynamicBorderSide(
                  gradient:
                  LinearGradient(colors: [Colors.cyan, Colors.purple]),
                  width: 14),
              left: DynamicBorderSide(
                  color: Colors.cyanAccent.shade200, width: 7),
              right: DynamicBorderSide(
                  color: Colors.purpleAccent, width: 14))),
    ),
    largeScreen: neonBaseStyle.copyWith(
      width: 112.0.toPXLength,
      height: 112.0.toPXLength,
      shapeBorder: RoundedRectangleShapeBorder(
          borderRadius: DynamicBorderRadius.all(
              DynamicRadius.circular(15.toPXLength)),
          borderSides: RectangleBorderSides.only(
              top: DynamicBorderSide(
                  gradient: LinearGradient(colors: [
                    Colors.cyanAccent.shade100,
                    Colors.purpleAccent.shade100
                  ]),
                  width: 9),
              bottom: DynamicBorderSide(
                  gradient:
                  LinearGradient(colors: [Colors.cyan, Colors.purple]),
                  width: 18),
              left: DynamicBorderSide(
                  color: Colors.cyanAccent.shade200, width: 9),
              right: DynamicBorderSide(
                  color: Colors.purpleAccent, width: 18))),
    )
  });

  @override
  Responsive<Style> get pressedStyle => Responsive({
    smallScreen: neonBaseStyle.copyWith(
      width: 72.0.toPXLength,
      height: 72.0.toPXLength,
      shapeBorder: RoundedRectangleShapeBorder(
          borderRadius: DynamicBorderRadius.all(
              DynamicRadius.circular(15.toPXLength)),
          borderSides: RectangleBorderSides.only(
              top: DynamicBorderSide(
                  gradient: LinearGradient(colors: [
                    Colors.cyanAccent.shade100,
                    Colors.purpleAccent.shade100
                  ]),
                  width: 3),
              bottom: DynamicBorderSide(
                  gradient:
                  LinearGradient(colors: [Colors.cyan, Colors.purple]),
                  width: 6),
              left: DynamicBorderSide(
                  color: Colors.cyanAccent.shade200, width: 3),
              right: DynamicBorderSide(
                  color: Colors.purpleAccent, width: 6))),
    ),
    middleScreen: neonBaseStyle.copyWith(
      width: 100.0.toPXLength,
      height: 100.0.toPXLength,
      shapeBorder: RoundedRectangleShapeBorder(
          borderRadius: DynamicBorderRadius.all(
              DynamicRadius.circular(15.toPXLength)),
          borderSides: RectangleBorderSides.only(
              top: DynamicBorderSide(
                  gradient: LinearGradient(colors: [
                    Colors.cyanAccent.shade100,
                    Colors.purpleAccent.shade100
                  ]),
                  width: 5),
              bottom: DynamicBorderSide(
                  gradient:
                  LinearGradient(colors: [Colors.cyan, Colors.purple]),
                  width: 10),
              left: DynamicBorderSide(
                  color: Colors.cyanAccent.shade200, width: 5),
              right: DynamicBorderSide(
                  color: Colors.purpleAccent, width: 10))),
    ),
    largeScreen: neonBaseStyle.copyWith(
      width: 112.0.toPXLength,
      height: 112.0.toPXLength,
      shapeBorder: RoundedRectangleShapeBorder(
          borderRadius: DynamicBorderRadius.all(
              DynamicRadius.circular(15.toPXLength)),
          borderSides: RectangleBorderSides.only(
              top: DynamicBorderSide(
                  gradient: LinearGradient(colors: [
                    Colors.cyanAccent.shade100,
                    Colors.purpleAccent.shade100
                  ]),
                  width: 7),
              bottom: DynamicBorderSide(
                  gradient:
                  LinearGradient(colors: [Colors.cyan, Colors.purple]),
                  width: 14),
              left: DynamicBorderSide(
                  color: Colors.cyanAccent.shade200, width: 7),
              right: DynamicBorderSide(
                  color: Colors.purpleAccent, width: 14))),
    )
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

final neonBaseStyle = Style(
    alignment: Alignment.center,
    childAlignment: Alignment.center,
    padding: EdgeInsets.all(3),
    backgroundDecoration: BoxDecoration(
        gradient:
            LinearGradient(colors: [Colors.cyanAccent, Colors.purpleAccent])),
    shadows: [
      ShapeShadow(
          blurRadius: 25,
          gradient:
              LinearGradient(colors: [Colors.cyanAccent, Colors.purpleAccent]),
          offset: Offset(0, 0)),
    ],
    textStyle: DynamicTextStyle(
      letterSpacing: 1.toPXLength,
      fontSize: Dimension.min(300.toPercentLength, 28.toPXLength),
      fontWeight: FontWeight.w900,
      color: Colors.white,
    ),
    textAlign: TextAlign.center,
    //shaderGradient:
    //    LinearGradient(colors: [Colors.purpleAccent, Colors.cyanAccent]),
    mouseCursor: SystemMouseCursors.click);
