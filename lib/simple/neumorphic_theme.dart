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
class NeumorphicSimpleTheme extends SimpleTheme {
  /// {@macro simple_theme}
  const NeumorphicSimpleTheme() : super();

  @override
  String get name => 'Neumorphic';

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
            backgroundDecoration: BoxDecoration(color: Color(0xFFE0E0E0)))
      });

  @override
  Responsive<Style> get buttonStyle => Responsive({
        smallScreen: neumorphicBaseStyle.copyWith(
          width: 52.0.toPXLength,
          height: 52.0.toPXLength,
        ),
        middleScreen: neumorphicBaseStyle.copyWith(
          width: 80.0.toPXLength,
          height: 80.0.toPXLength,
        ),
        largeScreen: neumorphicBaseStyle.copyWith(
          width: 100.0.toPXLength,
          height: 100.0.toPXLength,
        )
      });

  @override
  Responsive<Style> get hoverStyle => Responsive({
    smallScreen: neumorphicBaseStyle.copyWith(
      width: 52.0.toPXLength,
      height: 52.0.toPXLength,
      shadows: [
        ShapeShadow(
            blurRadius: 6,
            spreadRadius: -1,
            color: Colors.grey.shade400,
            offset: Offset(4,4 )),
        ShapeShadow(
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
            offset: Offset(4,4 )),
        ShapeShadow(
            blurRadius: 6,
            spreadRadius: -1,
            color: Color(0xFFFDFDFD),
            offset: Offset(-4, -4)),
      ],
    ),
    largeScreen: neumorphicBaseStyle.copyWith(
      width: 100.0.toPXLength,
      height: 100.0.toPXLength,
      shadows: [
        ShapeShadow(
            blurRadius: 6,
            spreadRadius: -1,
            color: Colors.grey.shade400,
            offset: Offset(4,4 )),
        ShapeShadow(
            blurRadius: 6,
            spreadRadius: -1,
            color: Color(0xFFFDFDFD),
            offset: Offset(-4, -4)),
      ],
    )
  });

  @override
  Responsive<Style> get pressedStyle => Responsive({
    smallScreen: neumorphicBaseStyle.copyWith(
      width: 52.0.toPXLength,
      height: 52.0.toPXLength,
      shadows: [],
      insetShadows: [
        ShapeShadow(
            blurRadius: 10,
            spreadRadius: -3,
            color: Colors.grey.shade400,
            offset: Offset(10, 10)),
        ShapeShadow(
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
            offset: Offset(10, 10)),
        ShapeShadow(
            blurRadius: 10,
            spreadRadius: -3,
            color: Color(0xFFFEFEFE),
            offset: Offset(-10, -10)),
      ],
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
            offset: Offset(10, 10)),
        ShapeShadow(
            blurRadius: 10,
            spreadRadius: -3,
            color: Color(0xFFFEFEFE),
            offset: Offset(-10, -10)),
      ],
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

final neumorphicBaseStyle = Style(
    alignment: Alignment.center,
    childAlignment: Alignment.center,
    //margin: EdgeInsets.all(6),
    //padding: EdgeInsets.all(6),
    backgroundDecoration: BoxDecoration(
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
          offset: Offset(8, 8)),
      ShapeShadow(
          blurRadius: 15,
          spreadRadius: -3,
          color: Color(0xFFFDFDFD),
          offset: Offset(-8, -8)),
    ],
    textStyle: DynamicTextStyle(
      letterSpacing: 2.toPXLength,
      fontSize: 20.toPXLength,
      fontWeight: FontWeight.w700,
      color: Colors.grey,
    ),
    textAlign: TextAlign.center,
    mouseCursor: SystemMouseCursors.click);
