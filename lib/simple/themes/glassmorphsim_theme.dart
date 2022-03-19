import 'dart:ui';

import 'package:animated_styled_widget/animated_styled_widget.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:responsive_property/responsive_property.dart';
import 'package:very_good_slide_puzzle/colors/colors.dart';
import 'package:very_good_slide_puzzle/layout/layout.dart';
import 'package:very_good_slide_puzzle/simple/simple.dart';

import 'package:very_good_slide_puzzle/theme/theme.dart';

import 'aurora_decoration.dart';
import 'dart:math';

/// {@template simple_theme}
/// The simple puzzle theme.
/// {@endtemplate}
class GlassmorphismTheme extends SimpleTheme {
  /// {@macro simple_theme}
  const GlassmorphismTheme({ThemeLuminance? luminance = ThemeLuminance.dark})
      : super(luminance: luminance);

  @override
  Map<Locale, String> get name => {
        const Locale("en"): 'Glassmorphism',
        const Locale("es"): 'Morfismo de vidrio',
        const Locale("zh"): "毛玻璃"
      };

  @override
  GlassmorphismTheme copyWith({
    ThemeLuminance? luminance,
  }) {
    return GlassmorphismTheme(luminance: luminance ?? this.luminance);
  }

  GlassmorphismThemePalette get themePalette =>
      luminance == ThemeLuminance.light
          ? GlassmorphismThemePaletteLight()
          : GlassmorphismThemePaletteDark();

  @override
  Duration get tileMoveAnimationDuration => const Duration(milliseconds: 333);

  @override
  bool get hasTimer => false;

  @override
  bool get useCupertinoIndicator => true;

  @override
  DynamicTextStyle get nameTextStyle =>
      DynamicTextStyle(color: themePalette.nameColor);

  @override
  DynamicTextStyle get titleTextStyle => DynamicTextStyle(
          letterSpacing: 2.toPXLength,
          color: themePalette.titleColor,
          fontWeight: FontWeight.w900,
          shadows: [
            Shadow(
                blurRadius: 3,
                color: themePalette.kAmbientShadowOpacity,
                offset: const Offset(-1, -1)),
            Shadow(
                blurRadius: 3,
                color: themePalette.kAmbientShadowOpacity,
                offset: const Offset(-1, 0)),
            Shadow(
                blurRadius: 3,
                color: themePalette.kAmbientShadowOpacity,
                offset: const Offset(0, -1)),
            Shadow(
                blurRadius: 3,
                color: themePalette.kAmbientShadowOpacity,
                offset: const Offset(0, 1)),
            Shadow(
                blurRadius: 3,
                color: themePalette.kAmbientShadowOpacity,
                offset: const Offset(1, 0)),
            Shadow(
                blurRadius: 8,
                color: themePalette.kAmbientShadowOpacity.withOpacity(0.5),
                offset: const Offset(3, 3)),
          ]);

  @override
  DynamicTextStyle get defaultTextStyle =>
      DynamicTextStyle(color: themePalette.defaultColor);

  @override
  Responsive<Style> get backgroundStyle {
    var rng = Random();

    List<Gradient>? gradients = [];
    List<double>? blurs = [];

    for (int i = 0; i < 8; i++) {
      Color center = themePalette
          .backgroundColors[rng.nextInt(themePalette.backgroundColors.length)];
      gradients.add(RadialGradient(
        tileMode: TileMode.decal,
          radius: rng.nextDouble() * 3 + 2,
          center: Alignment(
              (rng.nextDouble() - 0.5) * 2, (rng.nextDouble() - 0.5) * 2),
          colors: [
            center.withOpacity(0.9-i*0.05),
            Colors.transparent
          ],
          stops: [
            0,
            rng.nextDouble() * 0.25 + 0.25,
          ]));
      blurs.add(rng.nextDouble() * 10+30);
    }

    return Responsive({
      allScreen: Style(
          backgroundDecoration: AuroraDecoration(
              color: themePalette.backgroundColor,
              gradientBlurs: blurs,
              gradients: gradients))
    });
  }

  @override
  Responsive<Style> get popupMenuStyle => Responsive({
        allScreen: Style(
          margin: const EdgeInsets.all(10),
          width: Dimension.min(240.toPXLength, 90.toPercentLength),
          shadows: [
            ShapeShadow(
                spreadRadius: 2,
                blurRadius: 10,
                color: Colors.grey.withOpacity(0.05),
                offset: const Offset(5, 5)),
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
              BoxDecoration(color: themePalette.popupMenuColor),
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
              color: themePalette.popupMenuUnselectedColor,
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
              color: themePalette.popupMenuUnselectedColor,
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
                    DynamicRadius.circular(10.toPXLength))),
            backdropFilter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            textStyle: DynamicTextStyle(
              fontSize: 16.toPXLength,
              color: themePalette.tileTextColor,
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
              color: themePalette.popupMenuTitleColor,
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
              border: DynamicBorderSide(
                  width: 1,
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
                  DynamicRadius.circular(10.toPXLength))),
          backdropFilter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          padding: const EdgeInsets.all(5),
          margin: const EdgeInsets.symmetric(vertical: 5),
        )
      });

  @override
  Responsive<Style> get popupMenuSliderThumbStyle => Responsive({
        allScreen: Style(
          insetShadows: [
            ShapeShadow(
                blurRadius: 3,
                color: Colors.white70.withOpacity(0.8),
                offset: const Offset((3), (3))),
            ShapeShadow(
                blurRadius: 2,
                spreadRadius: 1,
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: const [
                      0,
                      0.5
                    ],
                    colors: [
                      Colors.grey.shade300.withOpacity(0.8),
                      Colors.grey.shade700.withOpacity(0.8),
                    ]),
                offset: const Offset(-3, -3)),
          ],
          shapeBorder: RectangleShapeBorder(
              border: DynamicBorderSide(
                  width: 1,
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
              BoxDecoration(color: themePalette.popupMenuSliderThumbColor),
          backdropFilter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
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
            color: themePalette.popupMenuSliderTrackColor,
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
  Responsive<Style> get tileStyle => Responsive({
        smallScreen: _baseStyle.copyWith(
            width: _TileDimension.small,
            height: _TileDimension.small,
            textStyle: _baseStyle.textStyle?.copyWith(fontSize: 20.toPXLength)),
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
  Responsive<Style> get tileHoverStyle => Responsive({
        smallScreen: _baseStyle.copyWith(
            width: _TileDimension.small,
            height: _TileDimension.small,
            shadows: [
              ShapeShadow(
                  spreadRadius: 2,
                  blurRadius: 5,
                  color: Colors.black.withOpacity(0.02),
                  offset: const Offset(3, 3)),
            ],
            backgroundDecoration:
                BoxDecoration(color: themePalette.tileHoverColor),
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
            textStyle: _baseStyle.textStyle?.copyWith(fontSize: 20.toPXLength)),
        middleScreen: _baseStyle.copyWith(
          width: _TileDimension.medium,
          height: _TileDimension.medium,
          shadows: [
            ShapeShadow(
                spreadRadius: 2,
                blurRadius: 5,
                color: Colors.black.withOpacity(0.02),
                offset: const Offset(3, 3)),
          ],
          backgroundDecoration:
              BoxDecoration(color: themePalette.tileHoverColor),
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
        largeScreen: _baseStyle.copyWith(
          width: _TileDimension.large,
          height: _TileDimension.large,
          shadows: [
            ShapeShadow(
                spreadRadius: 2,
                blurRadius: 5,
                color: Colors.black.withOpacity(0.02),
                offset: const Offset(3, 3)),
          ],
          backgroundDecoration:
              BoxDecoration(color: themePalette.tileHoverColor),
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
  Responsive<Style> get tilePressedStyle => Responsive({
        smallScreen: _baseStyle.copyWith(
            width: _TileDimension.small,
            height: _TileDimension.small,
            shadows: [],
            backgroundDecoration:
                BoxDecoration(color: themePalette.tilePressedColor),
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
            textStyle: _baseStyle.textStyle?.copyWith(fontSize: 20.toPXLength)),
        middleScreen: _baseStyle.copyWith(
          width: _TileDimension.medium,
          height: _TileDimension.medium,
          shadows: [],
          backgroundDecoration:
              BoxDecoration(color: themePalette.tilePressedColor),
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
        largeScreen: _baseStyle.copyWith(
          width: _TileDimension.large,
          height: _TileDimension.large,
          shadows: [],
          backgroundDecoration:
              BoxDecoration(color: themePalette.tilePressedColor),
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
  DynamicTextStyle get menuActiveStyle => DynamicTextStyle(
          color: themePalette.menuActiveColor,
          fontWeight: FontWeight.bold,
          shadows: [
            Shadow(
                blurRadius: 3,
                color: themePalette.kAmbientShadowOpacity,
                offset: const Offset(-1, -1)),
            Shadow(
                blurRadius: 3,
                color: themePalette.kAmbientShadowOpacity,
                offset: const Offset(-1, 0)),
            Shadow(
                blurRadius: 3,
                color: themePalette.kAmbientShadowOpacity,
                offset: const Offset(0, -1)),
            Shadow(
                blurRadius: 3,
                color: themePalette.kAmbientShadowOpacity,
                offset: const Offset(0, 1)),
            Shadow(
                blurRadius: 3,
                color: themePalette.kAmbientShadowOpacity,
                offset: const Offset(1, 0)),
            Shadow(
                blurRadius: 8,
                color: themePalette.kAmbientShadowOpacity.withOpacity(0.5),
                offset: const Offset(3, 3)),
          ]);

  @override
  Color get menuUnderlineColor => themePalette.menuUnderlineColor;

  @override
  DynamicTextStyle get menuInactiveStyle => DynamicTextStyle(
          color: themePalette.menuInactiveColor,
          fontWeight: FontWeight.w200,
          shadows: [
            Shadow(
                blurRadius: 5,
                color: themePalette.tileColor,
                offset: const Offset(0, 0)),
          ]);

  @override
  PuzzleLayoutDelegate get layoutDelegate => const SimplePuzzleLayoutDelegate();

  Style get _baseStyle => Style(
      alignment: Alignment.center,
      childAlignment: Alignment.center,
      shadows: [
        ShapeShadow(
            spreadRadius: 2,
            blurRadius: 10,
            color: themePalette.kAmbientShadowOpacity,
            offset: const Offset(5, 5)),
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
      backgroundDecoration: BoxDecoration(color: themePalette.tileColor),
      backdropFilter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      textStyle: DynamicTextStyle(
        letterSpacing: 0.1.toPXLength,
        fontSize: 28.toPXLength,
        fontWeight: FontWeight.w900,
        color: themePalette.tileTextColor,
        shadows: [
          Shadow(
              blurRadius: 3,
              color: themePalette.kAmbientShadowOpacity,
              offset: const Offset(-1, -1)),
          Shadow(
              blurRadius: 3,
              color: themePalette.kAmbientShadowOpacity,
              offset: const Offset(-1, 0)),
          Shadow(
              blurRadius: 3,
              color: themePalette.kAmbientShadowOpacity,
              offset: const Offset(0, -1)),
          Shadow(
              blurRadius: 3,
              color: themePalette.kAmbientShadowOpacity,
              offset: const Offset(0, 1)),
          Shadow(
              blurRadius: 3,
              color: themePalette.kAmbientShadowOpacity,
              offset: const Offset(1, 0)),
          Shadow(
              blurRadius: 6,
              color: themePalette.kAmbientShadowOpacity.withOpacity(0.3),
              offset: const Offset(1, 1)),
        ],
      ),
      mouseCursor: SystemMouseCursors.click);
}

abstract class _TileDimension {
  static Dimension small = Dimension.min(60.0.toPXLength, 100.toPercentLength);
  static Dimension medium =
      Dimension.min(100.0.toPXLength, 100.toPercentLength);
  static Dimension large = Dimension.min(112.0.toPXLength, 100.toPercentLength);
}

abstract class GlassmorphismThemePalette {
  Color get backgroundColor;
  List<Color> get backgroundColors;

  Color get kAmbientShadowOpacity;

  Color get nameColor;
  Color get titleColor;
  Color get defaultColor;

  Color get tileTextColor;

  Color get tileColor;
  Color get tileHoverColor;
  Color get tilePressedColor;

  Color get menuUnderlineColor;
  Color get menuInactiveColor;
  Color get menuActiveColor;

  Color get popupMenuSliderActiveTrackColor;
  Color get popupMenuSliderTrackColor;
  Color get popupMenuSliderThumbColor;

  Color get popupMenuTileColor;
  Color get popupMenuTitleColor;

  Color get popupMenuUnselectedColor;

  Color get popupMenuColor;
}

class GlassmorphismThemePaletteLight extends GlassmorphismThemePalette {
  @override
  Color get backgroundColor => Colors.pinkAccent.shade100;

  @override
  List<Color> get backgroundColors => [
        const Color(0xFFF6EA61),
        const Color(0xFFEECD89),
        const Color(0xFFD19ABD),
        const Color(0xFFAEBAF8),
        const Color(0xFFF088C6),
        const Color(0xFFC1FCD3),
        const Color(0xFFF9957F),
        const Color(0xFFA7BFE8),
        Colors.lightBlue.shade50,
        Colors.lightGreen.shade100,
        Colors.lime.shade50,
        const Color(0xFFACDDDE),
        const Color(0xFFCAF1DE),
        const Color(0xFFE1F8DC),
        const Color(0xFFFFE7C7),
        const Color(0xFFF7D8BA),
        Colors.pink.shade100,
        Colors.pinkAccent.shade100,
    Colors.cyanAccent.shade100,
    Colors.green.shade200,
      ];

  @override
  Color get nameColor => PuzzleColors.black;
  @override
  Color get titleColor => Colors.black87;
  @override
  Color get defaultColor => Colors.pinkAccent;

  @override
  Color get kAmbientShadowOpacity =>
      Colors.grey.shade600.withOpacity(0.15); // alpha = 0.12

  @override
  Color get tileTextColor => Colors.black45;

  @override
  Color get tileColor => const Color(0xFFFCFCFC).withOpacity(0.2);

  @override
  Color get tileHoverColor => const Color(0xFFFBFBFB).withOpacity(0.15);

  @override
  Color get tilePressedColor => const Color(0xFFFAFAFA).withOpacity(0.15);

  @override
  Color get menuUnderlineColor => Colors.black54;
  @override
  Color get menuInactiveColor => PuzzleColors.grey1;
  @override
  Color get menuActiveColor => Colors.black87;

  @override
  Color get popupMenuSliderActiveTrackColor => PuzzleColors.grey1;
  @override
  Color get popupMenuSliderTrackColor => Colors.grey.shade900.withOpacity(0.5);
  @override
  Color get popupMenuSliderThumbColor => PuzzleColors.grey4;

  @override
  Color get popupMenuTileColor => Colors.white.withOpacity(0.4);
  @override
  Color get popupMenuTitleColor => Colors.black87;

  @override
  Color get popupMenuUnselectedColor => Colors.white;

  @override
  Color get popupMenuColor => Colors.grey.shade50.withOpacity(0.25);
}

class GlassmorphismThemePaletteDark extends GlassmorphismThemePalette {
  @override
  Color get backgroundColor => Colors.blueAccent.shade700;

  @override
  List<Color> get backgroundColors => [
        const Color(0xFF04619f),
        const Color(0xFF358f74),
        const Color(0xFF923cb5),
        const Color(0xFFB60F46),
        Colors.blue.shade900,
        Colors.green.shade900,
        Colors.cyan.shade700,
        Colors.amber.shade900,
        Colors.grey.shade900,
        const Color(0xFF000C40),
        const Color(0xFF41295A),
        const Color(0xFF2F0743),
        const Color(0xFFBB00AA),
        Colors.brown.shade700,
        Colors.indigo.shade700
      ];

  @override
  Color get nameColor => PuzzleColors.grey5;
  @override
  Color get titleColor => PuzzleColors.white;
  @override
  Color get defaultColor => PuzzleColors.primary9;

  @override
  Color get kAmbientShadowOpacity =>
      Colors.grey.shade200.withOpacity(0.04); // alpha = 0.12

  @override
  Color get tileTextColor => Colors.white;

  @override
  Color get tileColor => const Color(0xFFFCFCFC).withOpacity(0.1);

  @override
  Color get tileHoverColor => Colors.grey.shade50.withOpacity(0.08);

  @override
  Color get tilePressedColor => Colors.grey.shade50.withOpacity(0.06);

  @override
  Color get menuUnderlineColor => Colors.white;
  @override
  Color get menuInactiveColor => PuzzleColors.white2;
  @override
  Color get menuActiveColor => Colors.white;

  @override
  Color get popupMenuSliderActiveTrackColor =>
      PuzzleColors.grey3.withOpacity(0.9);
  @override
  Color get popupMenuSliderTrackColor =>
      const Color(0xFFFAFAFA).withOpacity(0.25);
  @override
  Color get popupMenuSliderThumbColor => Colors.white.withOpacity(0.9);

  @override
  Color get popupMenuTileColor => const Color(0xFF3e3e3e);
  @override
  Color get popupMenuTitleColor => PuzzleColors.grey5;

  @override
  Color get popupMenuUnselectedColor => Colors.white70;

  @override
  Color get popupMenuColor => Colors.white.withOpacity(0.15);
}
