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
class ClaymorphismTheme extends SimpleTheme {
  /// {@macro simple_theme}
  const ClaymorphismTheme() : super();

  @override
  String get name => 'Claymorphism';

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
            backgroundDecoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.red,
                      Colors.amber,
                      Colors.deepOrange,
                      Colors.green
                    ])),)
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
  Responsive<Style> get pressedStyle => Responsive({
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

final claymorphsimBaseStyle = Style(
    alignment: Alignment.center,
    transformAlignment: Alignment.center,
    shadows: [
      ShapeShadow(
          blurRadius: 2,
          spreadRadius: -0.0,
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [
                0,
                0.5
              ],
              colors: [
                Colors.lightGreen.shade300,
                Colors.lightGreen.shade700
              ]),
          offset: Offset(0, 0)),
      ShapeShadow(
          blurRadius: 8,
          spreadRadius: -6,
          color: Color.fromARGB(255, 240, 255, 240),
          offset: Offset((-4), (-3)))
    ],
    shapeBorder: RectangleShapeBorder(
        borderRadius:
        DynamicBorderRadius.all(DynamicRadius.circular(20.toPXLength)),
        border:
        DynamicBorderSide(width: 0.2, color: Colors.lightGreen.shade700)),
    childAlignment: Alignment.center);
