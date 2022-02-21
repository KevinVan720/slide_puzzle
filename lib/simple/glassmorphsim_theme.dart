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
class GlassmorphismTheme extends SimpleTheme {
  /// {@macro simple_theme}
  const GlassmorphismTheme() : super();

  @override
  String get name => 'Glassmorphism';

  @override
  bool get hasTimer => false;

  @override
  DynamicTextStyle get nameTextStyle =>
      DynamicTextStyle(color: PuzzleColors.grey1);

  @override
  DynamicTextStyle get titleTextStyle => DynamicTextStyle(color: Colors.green);

  @override
  DynamicTextStyle get defaultTextStyle =>
      DynamicTextStyle(color: PuzzleColors.primary7);

  @override
  Responsive<Style> get backgroundStyle => Responsive({
        allScreen: Style(
          backgroundDecoration: BoxDecoration(
              //      image: DecorationImage(
              //             fit: BoxFit.fill,
              //           image: NetworkImage(
              //              "https://images.unsplash.com/photo-1604776159603-cacfe8f4b46f?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1334&q=80")),
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                Colors.red,
                Colors.amber,
                Colors.deepOrange,
                Colors.green
              ])),
        )
      });

  @override
  Responsive<Style> get buttonStyle => Responsive({
        smallScreen: glassmorphsimBaseStyle.copyWith(
          width: 72.0.toPXLength,
          height: 72.0.toPXLength,
        ),
        middleScreen: glassmorphsimBaseStyle.copyWith(
          width: 100.0.toPXLength,
          height: 100.0.toPXLength,
        ),
        largeScreen: glassmorphsimBaseStyle.copyWith(
          width: 112.0.toPXLength,
          height: 112.0.toPXLength,
        )
      });

  @override
  Responsive<Style> get hoverStyle => Responsive({
        smallScreen: glassmorphsimBaseStyle.copyWith(
          width: 72.0.toPXLength,
          height: 72.0.toPXLength,
        ),
        middleScreen: glassmorphsimBaseStyle.copyWith(
          width: 100.0.toPXLength,
          height: 100.0.toPXLength,
        ),
        largeScreen: glassmorphsimBaseStyle.copyWith(
          width: 112.0.toPXLength,
          height: 112.0.toPXLength,
        )
      });

  @override
  Responsive<Style> get pressedStyle => Responsive({
        smallScreen: glassmorphsimBaseStyle.copyWith(
          width: 72.0.toPXLength,
          height: 72.0.toPXLength,
          shapeBorder: RectangleShapeBorder(
              border: DynamicBorderSide(
                  width: 1,
                  begin: 50.toPercentLength,
                  end: 60.toPercentLength,
                  gradient: LinearGradient(colors: [
                    Colors.white.withOpacity(0.01),
                    Colors.white.withOpacity(0.01)
                  ])),
              borderRadius: DynamicBorderRadius.all(
                  DynamicRadius.circular(20.toPXLength))),
        ),
        middleScreen: glassmorphsimBaseStyle.copyWith(
          width: 100.0.toPXLength,
          height: 100.0.toPXLength,
          shapeBorder: RectangleShapeBorder(
              border: DynamicBorderSide(
                  width: 1,
                  begin: 50.toPercentLength,
                  end: 60.toPercentLength,
                  gradient: LinearGradient(colors: [
                    Colors.white.withOpacity(0.01),
                    Colors.white.withOpacity(0.01)
                  ])),
              borderRadius: DynamicBorderRadius.all(
                  DynamicRadius.circular(20.toPXLength))),
        ),
        largeScreen: glassmorphsimBaseStyle.copyWith(
          width: 112.0.toPXLength,
          height: 112.0.toPXLength,
          shapeBorder: RectangleShapeBorder(
              border: DynamicBorderSide(
                  width: 1,
                  begin: 50.toPercentLength,
                  end: 60.toPercentLength,
                  gradient: LinearGradient(colors: [
                    Colors.white.withOpacity(0.01),
                    Colors.white.withOpacity(0.01)
                  ])),
              borderRadius: DynamicBorderRadius.all(
                  DynamicRadius.circular(20.toPXLength))),
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

final glassmorphsimBaseStyle = Style(
    //padding: EdgeInsets.symmetric(vertical: 10),
    alignment: Alignment.center,
    childAlignment: Alignment.center,
    shapeBorder: RectangleShapeBorder(
        border: DynamicBorderSide(
            width: 3,
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0, 0.2],
                colors: [Colors.white70, Colors.white.withOpacity(0.05)])),
        borderRadius:
            DynamicBorderRadius.all(DynamicRadius.circular(20.toPXLength))),
    backgroundDecoration: BoxDecoration(color: Colors.white38),
    backdropFilter: ImageFilter.blur(sigmaX: 24, sigmaY: 24),
    textStyle: DynamicTextStyle(
      letterSpacing: 0.1.toPXLength,
      fontSize: Dimension.min(300.toPercentLength, 28.toPXLength),
      fontWeight: FontWeight.w900,
      color: Colors.white,
    ),
    mouseCursor: SystemMouseCursors.click);
