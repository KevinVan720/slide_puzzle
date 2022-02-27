import 'dart:ui';

import 'package:animated_styled_widget/animated_styled_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_property/responsive_property.dart';
import 'package:very_good_slide_puzzle/colors/colors.dart';
import 'package:very_good_slide_puzzle/layout/layout.dart';
import 'package:very_good_slide_puzzle/simple/simple.dart';

/// {@template simple_theme}
/// The simple puzzle theme.
/// {@endtemplate}
class ClaymorphismTheme extends SimpleTheme {
  /// {@macro simple_theme}
  const ClaymorphismTheme() : super();

  @override
  Map<Locale, String> get name => {
        const Locale("en"): 'Claymorphism',
        const Locale("es"): 'Arcillamorfismo',
        const Locale("zh"): "黏土拟物"
      };

  @override
  bool get hasTimer => false;

  @override
  DynamicTextStyle get nameTextStyle =>
      const DynamicTextStyle(color: PuzzleColors.grey1);

  @override
  DynamicTextStyle get titleTextStyle => const DynamicTextStyle(
        color: PuzzleColors.green50,
        fontFamily: "BalooThambi2",
        fontWeight: FontWeight.bold,
      );

  @override
  DynamicTextStyle get defaultTextStyle => DynamicTextStyle(
        color: Colors.blue.shade900,
        fontFamily: "BalooThambi2",
      );

  @override
  Responsive<Style> get backgroundStyle => Responsive({
        allScreen: Style(
          backgroundDecoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                Colors.lightBlue.shade200,
                Colors.lightBlue.shade100,
                Colors.lightBlue.shade50,
                Colors.white,
              ],
                  stops: const [
                0,
                0.15,
                0.3,
                1
              ])),
        )
      });

  @override
  Responsive<Style> get buttonStyle => Responsive({
        smallScreen: claymorphsimBaseStyle.copyWith(
          width: 72.0.toPXLength,
          height: 72.0.toPXLength,
        ),
        middleScreen: claymorphsimBaseStyle.copyWith(
          width: 100.0.toPXLength,
          height: 100.0.toPXLength,
        ),
        largeScreen: claymorphsimBaseStyle.copyWith(
          width: 112.0.toPXLength,
          height: 112.0.toPXLength,
        )
      });

  @override
  Responsive<Style> get hoverStyle => Responsive({
        smallScreen: claymorphsimBaseStyle.copyWith(
          width: 72.0.toPXLength,
          height: 72.0.toPXLength,
          transform: SmoothMatrix4()..scale(0.97),
          shadows: [
            ShapeShadow(
                blurRadius: 6,
                spreadRadius: 2,
                color: Colors.blue.shade400.withOpacity(0.5),
                offset: const Offset(2, 2)),
          ],
        ),
        middleScreen: claymorphsimBaseStyle.copyWith(
          width: 100.0.toPXLength,
          height: 100.0.toPXLength,
          transform: SmoothMatrix4()..scale(0.97),
          shadows: [
            ShapeShadow(
                blurRadius: 6,
                spreadRadius: 2,
                color: Colors.blue.shade400.withOpacity(0.5),
                offset: const Offset(2, 2)),
          ],
        ),
        largeScreen: claymorphsimBaseStyle.copyWith(
          width: 112.0.toPXLength,
          height: 112.0.toPXLength,
          transform: SmoothMatrix4()..scale(0.97),
          shadows: [
            ShapeShadow(
                blurRadius: 6,
                spreadRadius: 2,
                color: Colors.blue.shade400.withOpacity(0.5),
                offset: const Offset(2, 2)),
          ],
        )
      });

  @override
  Responsive<Style> get pressedStyle => Responsive({
        smallScreen: claymorphsimBaseStyle.copyWith(
          width: 72.0.toPXLength,
          height: 72.0.toPXLength,
          transform: SmoothMatrix4()..scale(0.94),
          shadows: [
            ShapeShadow(
                blurRadius: 1,
                spreadRadius: 0,
                color: Colors.blue.shade400.withOpacity(0.5),
                offset: const Offset(1, 1)),
          ],
        ),
        middleScreen: claymorphsimBaseStyle.copyWith(
          width: 100.0.toPXLength,
          height: 100.0.toPXLength,
          transform: SmoothMatrix4()..scale(0.94),
          shadows: [
            ShapeShadow(
                blurRadius: 1,
                spreadRadius: 0,
                color: Colors.blue.shade400.withOpacity(0.5),
                offset: const Offset(1, 1)),
          ],
        ),
        largeScreen: claymorphsimBaseStyle.copyWith(
          width: 112.0.toPXLength,
          height: 112.0.toPXLength,
          transform: SmoothMatrix4()..scale(0.94),
          shadows: [
            ShapeShadow(
                blurRadius: 1,
                spreadRadius: 0,
                color: Colors.blue.shade400.withOpacity(0.5),
                offset: const Offset(1, 1)),
          ],
        )
      });

  @override
  bool get isLogoColored => true;

  @override
  DynamicTextStyle get menuActiveStyle => const DynamicTextStyle(
      color: PuzzleColors.black,
      fontWeight: FontWeight.w700,
      fontFamily: "BalooThambi2");

  @override
  Color get menuUnderlineColor => Colors.blue.shade900;

  @override
  Color get popupMenuBackgroundColor => Colors.lightBlue.shade100;

  @override
  DynamicTextStyle get menuInactiveStyle => const DynamicTextStyle(
      color: PuzzleColors.grey2, fontFamily: "BalooThambi2");

  @override
  String get audioControlOnAsset => 'assets/images/audio_control/simple_on.png';

  @override
  String get audioControlOffAsset =>
      'assets/images/audio_control/simple_off.png';

  @override
  PuzzleLayoutDelegate get layoutDelegate => const SimplePuzzleLayoutDelegate();
}

final claymorphsimBaseStyle = Style(
    alignment: Alignment.center,
    transformAlignment: Alignment.center,
    shadows: [
      ShapeShadow(
          blurRadius: 10,
          spreadRadius: 2,
          color: Colors.blue.shade400.withOpacity(0.5),
          offset: const Offset(4, 4)),
    ],
    insetShadows: [
      ShapeShadow(
          blurRadius: 10,
          color: Colors.white70.withOpacity(0.5),
          offset: const Offset((-3), (-3))),
      ShapeShadow(
          blurRadius: 2,
          spreadRadius: 1,
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: const [0, 0.5],
              colors: [Colors.lightBlue.shade300, Colors.lightBlue.shade700]),
          offset: const Offset(-3, -3)),
    ],
    textStyle: DynamicTextStyle(
      letterSpacing: 0.1.toPXLength,
      fontSize: 28.toPXLength,
      fontFamily: "BalooThambi2",
      fontWeight: FontWeight.w700,
      color: Colors.blue.shade900,
    ),
    shapeBorder: RectangleShapeBorder(
      borderRadius:
          DynamicBorderRadius.all(DynamicRadius.circular(50.toPXLength)),
    ),
    childAlignment: Alignment.center,
    mouseCursor: SystemMouseCursors.click);
