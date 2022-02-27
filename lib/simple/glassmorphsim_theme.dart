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
class GlassmorphismTheme extends SimpleTheme {
  /// {@macro simple_theme}
  const GlassmorphismTheme() : super();

  @override
  Map<Locale, String> get name => {
        const Locale("en"): 'Glassmorphism',
        const Locale("es"): 'Morfismo de vidrio',
        const Locale("zh"): "毛玻璃"
      };

  @override
  bool get hasTimer => false;

  @override
  DynamicTextStyle get nameTextStyle =>
      const DynamicTextStyle(color: PuzzleColors.grey5);

  @override
  DynamicTextStyle get titleTextStyle => DynamicTextStyle(
          letterSpacing: 2.toPXLength,
          color: PuzzleColors.white,
          fontWeight: FontWeight.w900,
          shadows: [
            const Shadow(
                blurRadius: 6, color: PuzzleColors.grey2, offset: Offset(5, 5)),
          ]);

  @override
  DynamicTextStyle get defaultTextStyle =>
      const DynamicTextStyle(color: PuzzleColors.primary9);

  @override
  Responsive<Style> get backgroundStyle => Responsive({
        allScreen: Style(
            backgroundDecoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(
                  "https://images.unsplash.com/photo-1604776159603-cacfe8f4b46f?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1334&q=80")),
        ))
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
          shadows: [
            ShapeShadow(
                spreadRadius: 2,
                blurRadius: 5,
                color: Colors.black.withOpacity(0.02),
                offset: const Offset(5, 5)),
          ],
          shapeBorder: RectangleShapeBorder(
              border: DynamicBorderSide(
                  width: 1.8,
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: const [
                        0,
                        0.2
                      ],
                      colors: [
                        Colors.white70,
                        Colors.white.withOpacity(0.05)
                      ])),
              borderRadius: DynamicBorderRadius.all(
                  DynamicRadius.circular(20.toPXLength))),
        ),
        middleScreen: glassmorphsimBaseStyle.copyWith(
          width: 100.0.toPXLength,
          height: 100.0.toPXLength,
          shadows: [
            ShapeShadow(
                spreadRadius: 2,
                blurRadius: 5,
                color: Colors.black.withOpacity(0.02),
                offset: const Offset(5, 5)),
          ],
          shapeBorder: RectangleShapeBorder(
              border: DynamicBorderSide(
                  width: 1.8,
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: const [
                        0,
                        0.2
                      ],
                      colors: [
                        Colors.white70,
                        Colors.white.withOpacity(0.05)
                      ])),
              borderRadius: DynamicBorderRadius.all(
                  DynamicRadius.circular(20.toPXLength))),
        ),
        largeScreen: glassmorphsimBaseStyle.copyWith(
          width: 112.0.toPXLength,
          height: 112.0.toPXLength,
          shadows: [
            ShapeShadow(
                spreadRadius: 2,
                blurRadius: 5,
                color: Colors.black.withOpacity(0.02),
                offset: const Offset(5, 5)),
          ],
          shapeBorder: RectangleShapeBorder(
              border: DynamicBorderSide(
                  width: 1.8,
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: const [
                        0,
                        0.2
                      ],
                      colors: [
                        Colors.white70,
                        Colors.white.withOpacity(0.05)
                      ])),
              borderRadius: DynamicBorderRadius.all(
                  DynamicRadius.circular(20.toPXLength))),
        )
      });

  @override
  Responsive<Style> get pressedStyle => Responsive({
        smallScreen: glassmorphsimBaseStyle.copyWith(
          width: 72.0.toPXLength,
          height: 72.0.toPXLength,
          shadows: [],
          shapeBorder: RectangleShapeBorder(
              border: DynamicBorderSide(
                  width: 1.8,
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
          shadows: [],
          shapeBorder: RectangleShapeBorder(
              border: DynamicBorderSide(
                  width: 1.8,
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
          shadows: [],
          shapeBorder: RectangleShapeBorder(
              border: DynamicBorderSide(
                  width: 1.8,
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
  bool get isLogoColored => false;

  @override
  DynamicTextStyle get menuActiveStyle => const DynamicTextStyle(
          color: PuzzleColors.white,
          fontWeight: FontWeight.bold,
          shadows: [
            Shadow(
                blurRadius: 3, color: PuzzleColors.grey1, offset: Offset(3, 3)),
          ]);

  @override
  Color get menuUnderlineColor => PuzzleColors.white;

  @override
  Color get popupMenuBackgroundColor => Colors.blueGrey;

  @override
  DynamicTextStyle get menuInactiveStyle => const DynamicTextStyle(
      color: PuzzleColors.white2, fontWeight: FontWeight.w200);

  @override
  String get audioControlOnAsset => 'assets/images/audio_control/simple_on.png';

  @override
  String get audioControlOffAsset =>
      'assets/images/audio_control/simple_off.png';

  @override
  PuzzleLayoutDelegate get layoutDelegate => const SimplePuzzleLayoutDelegate();
}

final glassmorphsimBaseStyle = Style(
    alignment: Alignment.center,
    childAlignment: Alignment.center,
    shadows: [
      ShapeShadow(
          spreadRadius: 2,
          blurRadius: 10,
          color: Colors.black.withOpacity(0.05),
          offset: const Offset(10, 10)),
    ],
    shapeBorder: RectangleShapeBorder(
        border: DynamicBorderSide(
            width: 1.8,
            gradient: LinearGradient(
                begin: const Alignment(-0.9, -1),
                end: Alignment.bottomRight,
                stops: const [0, 0.1],
                colors: [Colors.white38, Colors.white.withOpacity(0.05)])),
        borderRadius:
            DynamicBorderRadius.all(DynamicRadius.circular(20.toPXLength))),
    backgroundDecoration: BoxDecoration(color: Colors.white.withOpacity(0.15)),
    backdropFilter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
    textStyle: DynamicTextStyle(
      letterSpacing: 0.1.toPXLength,
      fontSize: 28.toPXLength,
      fontWeight: FontWeight.w900,
      color: Colors.white,
    ),
    mouseCursor: SystemMouseCursors.click);
