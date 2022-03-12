import 'dart:ui';

import 'package:animated_styled_widget/animated_styled_widget.dart';

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
  Duration get tileMoveAnimationDuration => const Duration(milliseconds: 333);

  @override
  bool get hasTimer => false;

  @override
  bool get useCupertinoIndicator => true;

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
              fit: BoxFit.cover,
              image: AssetImage('assets/images/glass_background.jpg')),
        ))
      });

  @override
  Responsive<Style> get popupMenuStyle => Responsive({
        allScreen: Style(
          width: Dimension.min(240.toPXLength, 90.toPercentLength),
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
                      stops: const [
                        0,
                        0.1
                      ],
                      colors: [
                        Colors.white38,
                        Colors.white.withOpacity(0.05)
                      ])),
              borderRadius: DynamicBorderRadius.all(
                  DynamicRadius.circular(10.toPXLength))),
          backgroundDecoration:
              BoxDecoration(color: Colors.white.withOpacity(0.15)),
          backdropFilter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        )
      });

  @override
  Responsive<Style> get popupMenuButtonStyle => Responsive({
        allScreen: Style(
            alignment: Alignment.center,
            childAlignment: Alignment.center,
            margin: const EdgeInsets.all(2),
            padding: const EdgeInsets.all(2),
            backgroundDecoration: BoxDecoration(
              color: const Color(0xFFFAFAFA).withOpacity(0.01),
            ),
            shapeBorder: RectangleShapeBorder(
              borderRadius: DynamicBorderRadius.all(
                  DynamicRadius.circular(10.toPXLength)),
            ),
            textStyle: DynamicTextStyle(
              fontSize: 16.toPXLength,
              color: Colors.grey.shade300,
            ),
            textAlign: TextAlign.center,
            mouseCursor: SystemMouseCursors.click)
      });

  @override
  Responsive<Style> get popupMenuHoverStyle => Responsive({
        allScreen: Style(
            alignment: Alignment.center,
            childAlignment: Alignment.center,
            margin: const EdgeInsets.all(2),
            padding: const EdgeInsets.all(2),
            backgroundDecoration: BoxDecoration(
              color: const Color(0xFFFAFAFA).withOpacity(0.1),
            ),
            shapeBorder: RectangleShapeBorder(
              borderRadius: DynamicBorderRadius.all(
                  DynamicRadius.circular(10.toPXLength)),
            ),
            textStyle: DynamicTextStyle(
              fontSize: 16.toPXLength,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
            mouseCursor: SystemMouseCursors.click)
      });

  @override
  Responsive<Style> get popupMenuPressedStyle => Responsive({
        allScreen: Style(
            alignment: Alignment.center,
            childAlignment: Alignment.center,
            margin: const EdgeInsets.all(2),
            padding: const EdgeInsets.all(2),
            backgroundDecoration: BoxDecoration(
              color: const Color(0xFFFAFAFA).withOpacity(0.3),
            ),
            shapeBorder: RectangleShapeBorder(
              borderRadius: DynamicBorderRadius.all(
                  DynamicRadius.circular(10.toPXLength)),
            ),
            textStyle: DynamicTextStyle(
              fontSize: 16.toPXLength,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
            mouseCursor: SystemMouseCursors.click)
      });

  @override
  Responsive<Style> get popupMenuTitleStyle => Responsive({
        allScreen: Style(
            margin: const EdgeInsets.all(2),
            padding: const EdgeInsets.all(4),
            alignment: Alignment.centerLeft,
            textStyle: DynamicTextStyle(
              fontSize: 14.toPXLength,
              color: PuzzleColors.grey5,
              fontWeight: FontWeight.bold,
            ))
      });

  @override
  Responsive<Style> get popupMenuTileStyle => Responsive({
        allScreen: Style(
          backgroundDecoration: BoxDecoration(
            color: const Color(0xFFFAFAFA).withOpacity(0.2),
          ),
          shapeBorder: RectangleShapeBorder(
            border: const DynamicBorderSide(color: Colors.grey, width: 0.2),
            borderRadius:
                DynamicBorderRadius.all(DynamicRadius.circular(10.toPXLength)),
          ),
          padding: const EdgeInsets.all(5),
          margin: const EdgeInsets.symmetric(vertical: 5),
          shadows: [
            ShapeShadow(
                spreadRadius: 1,
                blurRadius: 4,
                color: Colors.white.withOpacity(0.1),
                offset: const Offset(2, 2)),
          ],
        )
      });

  @override
  Responsive<Style> get popupMenuSliderThumbStyle => Responsive({
        allScreen: Style(
          shapeBorder: const CircleShapeBorder(),
          backgroundDecoration: const BoxDecoration(
            color: PuzzleColors.white,
          ),
          width: 20.toPXLength,
          height: 20.toPXLength,
        )
      });

  @override
  Responsive<Style> get popupMenuSliderTrackStyle => Responsive({
        allScreen: Style(
          width: 88.toPercentLength,
          height: 2.toPXLength,
          backgroundDecoration: BoxDecoration(
            color: const Color(0xFFFAFAFA).withOpacity(0.25),
          ),
          shapeBorder: RectangleShapeBorder(
            borderRadius:
                DynamicBorderRadius.all(DynamicRadius.circular(1.toPXLength)),
          ),
        )
      });

  @override
  Responsive<Style> get popupMenuSliderActiveTrackStyle => Responsive({
        allScreen: Style(
          height: 2.toPXLength,
          backgroundDecoration: const BoxDecoration(
            color: PuzzleColors.grey5,
          ),
          shapeBorder: RectangleShapeBorder(
            borderRadius:
                DynamicBorderRadius.all(DynamicRadius.circular(1.toPXLength)),
          ),
        )
      });

  @override
  bool get isPopupMenuSliderThumbContained => false;

  @override
  Responsive<Style> get buttonStyle => Responsive({
        smallScreen: _baseStyle.copyWith(
          width: _TileDimension.small,
          height: _TileDimension.small,
          textStyle: DynamicTextStyle(
            letterSpacing: 0.1.toPXLength,
            fontSize: 24.toPXLength,
            fontWeight: FontWeight.w900,
            color: Colors.white,
            shadows: [
              const Shadow(
                  blurRadius: 15, color: Colors.grey, offset: Offset(1, 1)),
            ],
          ),
        ),
        middleScreen: _baseStyle.copyWith(
          width: _TileDimension.medium,
          height: _TileDimension.medium,
        ),
        largeScreen: _baseStyle.copyWith(
          width: _TileDimension.large,
          height: _TileDimension.large,
        )
      });

  @override
  Responsive<Style> get hoverStyle => Responsive({
        smallScreen: _baseStyle.copyWith(
          width: _TileDimension.small,
          height: _TileDimension.small,
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
          textStyle: DynamicTextStyle(
            letterSpacing: 0.1.toPXLength,
            fontSize: 24.toPXLength,
            fontWeight: FontWeight.w900,
            color: Colors.white,
            shadows: [
              const Shadow(
                  blurRadius: 10, color: Colors.grey, offset: Offset(0, 0)),
            ],
          ),
        ),
        middleScreen: _baseStyle.copyWith(
          width: _TileDimension.medium,
          height: _TileDimension.medium,
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
          textStyle: DynamicTextStyle(
            letterSpacing: 0.1.toPXLength,
            fontSize: 28.toPXLength,
            fontWeight: FontWeight.w900,
            color: Colors.white,
            shadows: [
              const Shadow(
                  blurRadius: 10, color: Colors.grey, offset: Offset(0, 0)),
            ],
          ),
        ),
        largeScreen: _baseStyle.copyWith(
          width: _TileDimension.large,
          height: _TileDimension.large,
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
          textStyle: DynamicTextStyle(
            letterSpacing: 0.1.toPXLength,
            fontSize: 28.toPXLength,
            fontWeight: FontWeight.w900,
            color: Colors.white,
            shadows: [
              const Shadow(
                  blurRadius: 10, color: Colors.grey, offset: Offset(0, 0)),
            ],
          ),
        )
      });

  @override
  Responsive<Style> get pressedStyle => Responsive({
        smallScreen: _baseStyle.copyWith(
          width: _TileDimension.small,
          height: _TileDimension.small,
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
          textStyle: DynamicTextStyle(
            letterSpacing: 0.1.toPXLength,
            fontSize: 24.toPXLength,
            fontWeight: FontWeight.w900,
            color: Colors.white,
            shadows: [
              const Shadow(
                  blurRadius: 2, color: Colors.grey, offset: Offset(0, 0)),
            ],
          ),
        ),
        middleScreen: _baseStyle.copyWith(
          width: _TileDimension.medium,
          height: _TileDimension.medium,
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
          textStyle: DynamicTextStyle(
            letterSpacing: 0.1.toPXLength,
            fontSize: 28.toPXLength,
            fontWeight: FontWeight.w900,
            color: Colors.white,
            shadows: [
              const Shadow(
                  blurRadius: 2, color: Colors.grey, offset: Offset(0, 0)),
            ],
          ),
        ),
        largeScreen: _baseStyle.copyWith(
          width: _TileDimension.large,
          height: _TileDimension.large,
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
          textStyle: DynamicTextStyle(
            letterSpacing: 0.1.toPXLength,
            fontSize: 28.toPXLength,
            fontWeight: FontWeight.w900,
            color: Colors.white,
            shadows: [
              const Shadow(
                  blurRadius: 2, color: Colors.grey, offset: Offset(0, 0)),
            ],
          ),
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
  DynamicTextStyle get menuInactiveStyle => const DynamicTextStyle(
      color: PuzzleColors.white2, fontWeight: FontWeight.w200);

  @override
  PuzzleLayoutDelegate get layoutDelegate => const SimplePuzzleLayoutDelegate();
}

final _baseStyle = Style(
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
      shadows: [
        const Shadow(blurRadius: 15, color: Colors.grey, offset: Offset(1, 1)),
      ],
    ),
    mouseCursor: SystemMouseCursors.click);

abstract class _TileDimension {
  static Dimension small = Dimension.min(60.0.toPXLength, 100.toPercentLength);
  static Dimension medium =
      Dimension.min(100.0.toPXLength, 100.toPercentLength);
  static Dimension large = Dimension.min(112.0.toPXLength, 100.toPercentLength);
}
