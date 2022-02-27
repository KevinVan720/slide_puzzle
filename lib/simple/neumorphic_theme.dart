import 'package:animated_styled_widget/animated_styled_widget.dart';

import 'package:flutter/material.dart';
import 'package:responsive_property/responsive_property.dart';
import 'package:very_good_slide_puzzle/colors/colors.dart';
import 'package:very_good_slide_puzzle/layout/layout.dart';
import 'package:very_good_slide_puzzle/simple/simple.dart';

/// {@template simple_theme}
/// The simple puzzle theme.
/// {@endtemplate}
class NeumorphicTheme extends SimpleTheme {
  /// {@macro simple_theme}
  const NeumorphicTheme() : super();

  @override
  Map<Locale, String> get name =>
      {const Locale("en"): 'Neumorphism', const Locale("zh"): "拟态"};

  @override
  bool get hasTimer => false;

  @override
  DynamicTextStyle get nameTextStyle => const DynamicTextStyle(
        color: PuzzleColors.grey1,
        fontFamily: "BalooThambi2",
      );

  @override
  DynamicTextStyle get titleTextStyle => const DynamicTextStyle(
        color: PuzzleColors.green50,
        fontFamily: "BalooThambi2",
        fontWeight: FontWeight.bold,
      );

  @override
  DynamicTextStyle get defaultTextStyle => const DynamicTextStyle(
        color: PuzzleColors.grey1,
        fontFamily: "BalooThambi2",
      );

  @override
  Responsive<Style> get backgroundStyle => Responsive({
        allScreen: Style(
            backgroundDecoration: const BoxDecoration(color: Color(0xFFE0E0E0)))
      });

  @override
  Responsive<Style> get buttonStyle => Responsive({
        smallScreen: neumorphicBaseStyle.copyWith(
          width: 52.0.toPXLength,
          height: 52.0.toPXLength,
          shapeBorder: RectangleShapeBorder(
            borderRadius:
                DynamicBorderRadius.all(DynamicRadius.circular(15.toPXLength)),
          ),
        ),
        middleScreen: neumorphicBaseStyle.copyWith(
          width: 80.0.toPXLength,
          height: 80.0.toPXLength,
          textStyle: DynamicTextStyle(
            letterSpacing: 2.toPXLength,
            fontSize: 24.toPXLength,
            fontWeight: FontWeight.w700,
            fontFamily: "BalooThambi2",
            color: Colors.grey,
          ),
        ),
        largeScreen: neumorphicBaseStyle.copyWith(
          width: 100.0.toPXLength,
          height: 100.0.toPXLength,
          textStyle: DynamicTextStyle(
            letterSpacing: 2.toPXLength,
            fontSize: 28.toPXLength,
            fontWeight: FontWeight.w700,
            fontFamily: "BalooThambi2",
            color: Colors.grey,
          ),
        )
      });

  @override
  Responsive<Style> get hoverStyle => Responsive({
        smallScreen: neumorphicBaseStyle.copyWith(
          width: 52.0.toPXLength,
          height: 52.0.toPXLength,
          shapeBorder: RectangleShapeBorder(
            borderRadius:
                DynamicBorderRadius.all(DynamicRadius.circular(15.toPXLength)),
          ),
          shadows: [
            ShapeShadow(
                blurRadius: 6,
                spreadRadius: -1,
                color: Colors.grey.shade400,
                offset: const Offset(4, 4)),
            const ShapeShadow(
                blurRadius: 6,
                spreadRadius: -1,
                color: Color(0xFFFDFDFD),
                offset: Offset(-4, -4)),
          ],
        ),
        middleScreen: neumorphicBaseStyle.copyWith(
          width: 80.0.toPXLength,
          height: 80.0.toPXLength,
          shadows: [
            ShapeShadow(
                blurRadius: 6,
                spreadRadius: -1,
                color: Colors.grey.shade400,
                offset: const Offset(4, 4)),
            const ShapeShadow(
                blurRadius: 6,
                spreadRadius: -1,
                color: Color(0xFFFDFDFD),
                offset: Offset(-4, -4)),
          ],
          textStyle: DynamicTextStyle(
            letterSpacing: 2.toPXLength,
            fontSize: 24.toPXLength,
            fontWeight: FontWeight.w700,
            fontFamily: "BalooThambi2",
            color: Colors.grey,
          ),
        ),
        largeScreen: neumorphicBaseStyle.copyWith(
          width: 100.0.toPXLength,
          height: 100.0.toPXLength,
          shadows: [
            ShapeShadow(
                blurRadius: 6,
                spreadRadius: -1,
                color: Colors.grey.shade400,
                offset: const Offset(4, 4)),
            const ShapeShadow(
                blurRadius: 6,
                spreadRadius: -1,
                color: Color(0xFFFDFDFD),
                offset: Offset(-4, -4)),
          ],
          textStyle: DynamicTextStyle(
            letterSpacing: 2.toPXLength,
            fontSize: 28.toPXLength,
            fontWeight: FontWeight.w700,
            fontFamily: "BalooThambi2",
            color: Colors.grey,
          ),
        )
      });

  @override
  Responsive<Style> get pressedStyle => Responsive({
        smallScreen: neumorphicBaseStyle.copyWith(
          width: 52.0.toPXLength,
          height: 52.0.toPXLength,
          shapeBorder: RectangleShapeBorder(
            borderRadius:
                DynamicBorderRadius.all(DynamicRadius.circular(15.toPXLength)),
          ),
          shadows: [],
          insetShadows: [
            ShapeShadow(
                blurRadius: 10,
                spreadRadius: -3,
                color: Colors.grey.shade400,
                offset: const Offset(10, 10)),
            const ShapeShadow(
                blurRadius: 10,
                spreadRadius: -3,
                color: Color(0xFFFEFEFE),
                offset: Offset(-10, -10)),
          ],
        ),
        middleScreen: neumorphicBaseStyle.copyWith(
          width: 80.0.toPXLength,
          height: 80.0.toPXLength,
          shadows: [],
          insetShadows: [
            ShapeShadow(
                blurRadius: 10,
                spreadRadius: -3,
                color: Colors.grey.shade400,
                offset: const Offset(10, 10)),
            const ShapeShadow(
                blurRadius: 10,
                spreadRadius: -3,
                color: Color(0xFFFEFEFE),
                offset: Offset(-10, -10)),
          ],
          textStyle: DynamicTextStyle(
            letterSpacing: 2.toPXLength,
            fontSize: 24.toPXLength,
            fontWeight: FontWeight.w700,
            fontFamily: "BalooThambi2",
            color: Colors.grey,
          ),
        ),
        largeScreen: neumorphicBaseStyle.copyWith(
          width: 100.0.toPXLength,
          height: 100.0.toPXLength,
          shadows: [],
          insetShadows: [
            ShapeShadow(
                blurRadius: 10,
                spreadRadius: -3,
                color: Colors.grey.shade400,
                offset: const Offset(10, 10)),
            const ShapeShadow(
                blurRadius: 10,
                spreadRadius: -3,
                color: Color(0xFFFEFEFE),
                offset: Offset(-10, -10)),
          ],
          textStyle: DynamicTextStyle(
            letterSpacing: 2.toPXLength,
            fontSize: 28.toPXLength,
            fontWeight: FontWeight.w700,
            fontFamily: "BalooThambi2",
            color: Colors.grey,
          ),
        )
      });

  @override
  bool get isLogoColored => true;

  @override
  DynamicTextStyle get menuActiveStyle => const DynamicTextStyle(
      color: PuzzleColors.black, fontWeight: FontWeight.bold);

  @override
  Color get menuUnderlineColor => PuzzleColors.grey1;

  @override
  Color get popupMenuBackgroundColor => Colors.grey.shade100;

  @override
  DynamicTextStyle get menuInactiveStyle =>
      const DynamicTextStyle(color: PuzzleColors.grey2);

  @override
  String get audioControlOnAsset => 'assets/images/audio_control/simple_on.png';

  @override
  String get audioControlOffAsset =>
      'assets/images/audio_control/simple_off.png';

  @override
  PuzzleLayoutDelegate get layoutDelegate => const SimplePuzzleLayoutDelegate();
}

final neumorphicBaseStyle = Style(
    alignment: Alignment.center,
    childAlignment: Alignment.center,
    //margin: EdgeInsets.all(6),
    //padding: EdgeInsets.all(6),
    backgroundDecoration: const BoxDecoration(
      color: Color(0xFFE0E0E0),
    ),
    shapeBorder: RectangleShapeBorder(
      borderRadius:
          DynamicBorderRadius.all(DynamicRadius.circular(30.toPXLength)),
    ),
    shadows: [
      ShapeShadow(
          blurRadius: 15,
          spreadRadius: -3,
          color: Colors.grey.shade400,
          offset: const Offset(8, 8)),
      const ShapeShadow(
          blurRadius: 15,
          spreadRadius: -3,
          color: Color(0xFFFDFDFD),
          offset: Offset(-8, -8)),
    ],
    textStyle: DynamicTextStyle(
      letterSpacing: 2.toPXLength,
      fontSize: 20.toPXLength,
      fontWeight: FontWeight.w700,
      fontFamily: "BalooThambi2",
      color: Colors.grey,
    ),
    textAlign: TextAlign.center,
    mouseCursor: SystemMouseCursors.click);
