import 'package:animated_styled_widget/animated_styled_widget.dart';
import 'package:flutter/material.dart';
import 'package:responsive_property/responsive_property.dart';
import 'package:very_good_slide_puzzle/layout/layout.dart';
import 'package:very_good_slide_puzzle/simple/simple.dart';
import 'package:very_good_slide_puzzle/colors/colors.dart';

import 'package:very_good_slide_puzzle/theme/theme.dart';

/// {@template simple_theme}
/// The simple puzzle theme.
/// {@endtemplate}
class NeonTheme extends SimpleTheme {
  /// {@macro simple_theme}
  const NeonTheme({ThemeLuminance? luminance = ThemeLuminance.dark})
      : super(luminance: luminance);

  @override
  @override
  Map<Locale, String> get name => {
        const Locale("en"): 'Neon',
        const Locale("es"): 'Neón',
        const Locale("zh"): "霓虹"
      };

  NeonTheme copyWith({
    ThemeLuminance? luminance,
  }) {
    return NeonTheme(luminance: luminance ?? this.luminance);
  }

  NeonThemePalette get themePalette => luminance == ThemeLuminance.light
      ? NeonThemePaletteLight()
      : NeonThemePaletteDark();

  @override
  bool get hasTimer => false;

  @override
  DynamicTextStyle get nameTextStyle => DynamicTextStyle(
        color: themePalette.nameColor,
        fontFamily: "Night-Club-70s",
        shadows: [
          Shadow(
              blurRadius: 2,
              color: themePalette.nameColor,
              offset: Offset(1, 1)),
          Shadow(
              blurRadius: 4,
              color: themePalette.nameColor,
              offset: Offset(0, 0)),
          Shadow(
              blurRadius: 1,
              color: themePalette.nameColor,
              offset: Offset(0, 0))
        ],
      );

  @override
  DynamicTextStyle get titleTextStyle => DynamicTextStyle(
        color: themePalette.titleColor,
        fontFamily: "Night-Club-70s",
        fontWeight: FontWeight.bold,
        shadows: [
          Shadow(
              blurRadius: 5,
              color: themePalette.titleColor,
              offset: Offset(1, 1)),
          Shadow(
              blurRadius: 20,
              color: themePalette.titleColor,
              offset: Offset(0, 0)),
          Shadow(
              blurRadius: 1,
              color: themePalette.titleColor,
              offset: Offset(0, 0))
        ],
      );

  @override
  DynamicTextStyle get defaultTextStyle => DynamicTextStyle(
        color: themePalette.defaultColor,
        fontFamily: "Beon",
        shadows: [
          Shadow(
              blurRadius: 5,
              color: themePalette.defaultColor,
              offset: Offset(1, 1)),
        ],
      );

  @override
  Responsive<Style> get backgroundStyle => Responsive({
        allScreen: Style(
            backgroundDecoration:
                BoxDecoration(gradient: themePalette.backgroundGradient))
      });

  @override
  Responsive<Style> get popupMenuStyle => Responsive({
        allScreen: Style(
          width: Dimension.min(240.toPXLength, 90.toPercentLength),
          backgroundDecoration:
              BoxDecoration(gradient: themePalette.backgroundGradient),
          shapeBorder: RoundedRectangleShapeBorder(
              borderSides: RectangleBorderSides.only(
                  top: DynamicBorderSide(
                      color: themePalette.menuUnderlineColor.withOpacity(0.6),
                      width: 2),
                  bottom: DynamicBorderSide(
                      color: themePalette.menuUnderlineColor, width: 6),
                  left: DynamicBorderSide(
                      color: themePalette.menuUnderlineColor.withOpacity(0.6),
                      width: 2),
                  right: DynamicBorderSide(
                      color: themePalette.menuUnderlineColor, width: 4))),
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
            backgroundDecoration: const BoxDecoration(
              color: Colors.transparent,
            ),
            shapeBorder: RectangleShapeBorder(
              borderRadius:
                  DynamicBorderRadius.all(DynamicRadius.circular(2.toPXLength)),
            ),
            textStyle: DynamicTextStyle(
              fontSize: 16.toPXLength,
              letterSpacing: 1.toPXLength,
              fontFamily: "Beon",
              fontWeight: FontWeight.w700,
              color: themePalette.popupMenuUnselectedColor,
              shadows: [
                const Shadow(
                    blurRadius: 3, color: Colors.white54, offset: Offset(0, 0))
              ],
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
            backgroundDecoration: const BoxDecoration(
              color: Colors.transparent,
            ),
            shapeBorder: RectangleShapeBorder(
              borderRadius:
                  DynamicBorderRadius.all(DynamicRadius.circular(2.toPXLength)),
            ),
            textStyle: DynamicTextStyle(
              fontSize: 16.toPXLength,
              letterSpacing: 1.toPXLength,
              fontFamily: "Beon",
              fontWeight: FontWeight.w700,
              color: themePalette.popupMenuUnselectedColor,
              shadows: [
                const Shadow(
                    blurRadius: 5, color: Colors.white54, offset: Offset(0, 0))
              ],
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
              gradient: LinearGradient(colors: [
                themePalette.popupMenuTileColor.withOpacity(0.9),
                themePalette.popupMenuTileColor
              ]),
            ),
            shapeBorder: RectangleShapeBorder(
              borderRadius:
                  DynamicBorderRadius.all(DynamicRadius.circular(2.toPXLength)),
            ),
            shadows: [
              ShapeShadow(
                  blurRadius: 4,
                  gradient: LinearGradient(colors: [
                    themePalette.popupMenuTileColor.withOpacity(0.9),
                    themePalette.popupMenuTileColor
                  ]),
                  offset: Offset(1, 1)),
            ],
            textStyle: DynamicTextStyle(
              fontSize: 16.toPXLength,
              letterSpacing: 1.toPXLength,
              fontFamily: "Beon",
              fontWeight: FontWeight.w700,
              color: themePalette.popupMenuSelectedColor,
              shadows: [
                const Shadow(
                    blurRadius: 3, color: Colors.white54, offset: Offset(0, 0))
              ],
            ),
            textAlign: TextAlign.center,
            mouseCursor: SystemMouseCursors.click)
      });

  @override
  Responsive<Style> get popupMenuTitleStyle => Responsive({
        allScreen: Style(
            margin: const EdgeInsets.all(2),
            alignment: Alignment.centerLeft,
            textStyle: DynamicTextStyle(
              fontSize: 14.toPXLength,
              color: themePalette.popupMenuTitleColor,
              fontFamily: "Beon",
              fontWeight: FontWeight.bold,
              shadows: [
                Shadow(
                    blurRadius: 1,
                    color: themePalette.popupMenuTitleColor,
                    offset: Offset(0, 0)),
                Shadow(
                    blurRadius: 3,
                    color: themePalette.popupMenuTitleColor,
                    offset: Offset(0, 0)),
              ],
            ))
      });

  @override
  Responsive<Style> get popupMenuTileStyle => Responsive({
        allScreen: Style(
          backgroundDecoration: const BoxDecoration(
            color: Colors.transparent,
          ),
          padding: const EdgeInsets.all(5),
          margin: const EdgeInsets.symmetric(vertical: 5),
        )
      });

  @override
  Responsive<Style> get popupMenuSliderThumbStyle => Responsive({
        allScreen: Style(
          shapeBorder: parseMorphableShapeBorder({
            "type": "Triangle",
            "border": {
              "color": "ff000000",
              "width": 0,
              "style": "none",
              "strokeCap": "butt",
              "strokeJoin": "miter"
            },
            "point1": {"dx": "0%", "dy": "0%"},
            "point2": {"dx": "100%", "dy": "18.800003051757866%"},
            "point3": {"dx": "43.33333841959636%", "dy": "100%"}
          }),
          backgroundDecoration: BoxDecoration(
            color: themePalette.popupMenuSliderThumbColor,
          ),
          shadows: [
            ShapeShadow(
                blurRadius: 4,
                color: themePalette.popupMenuSliderThumbColor,
                offset: Offset(2, 2)),
          ],
          width: 20.toPXLength,
          height: 20.toPXLength,
        )
      });

  @override
  Responsive<Style> get popupMenuSliderTrackStyle => Responsive({
        allScreen: Style(
          width: 88.toPercentLength,
          height: 1.toPXLength,
          backgroundDecoration: BoxDecoration(
            color: themePalette.popupMenuSliderTrackColor,
          ),
          shapeBorder: RectangleShapeBorder(
            borderRadius:
                DynamicBorderRadius.all(DynamicRadius.circular(0.toPXLength)),
          ),
        )
      });

  @override
  Responsive<Style> get popupMenuSliderActiveTrackStyle => Responsive({
        allScreen: Style(
          height: 6.toPXLength,
          backgroundDecoration: BoxDecoration(
            color: themePalette.popupMenuSliderActiveTrackColor,
          ),
          shadows: [
            ShapeShadow(
                blurRadius: 4,
                color: themePalette.popupMenuSliderActiveTrackColor,
                offset: Offset(1, 1)),
          ],
          shapeBorder: RectangleShapeBorder(
            borderRadius:
                DynamicBorderRadius.all(DynamicRadius.circular(0.toPXLength)),
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
          shapeBorder: RoundedRectangleShapeBorder(
              borderRadius: DynamicBorderRadius.all(
                  DynamicRadius.circular(15.toPXLength)),
              borderSides: RectangleBorderSides.only(
                  top: DynamicBorderSide(
                      gradient: LinearGradient(colors: [
                        themePalette.baseColor2,
                        themePalette.baseColor6
                      ]),
                      width: 6),
                  bottom: DynamicBorderSide(
                      gradient: LinearGradient(colors: [
                        themePalette.baseColor4,
                        themePalette.baseColor8
                      ]),
                      width: 12),
                  left: DynamicBorderSide(
                      color: themePalette.baseColor1, width: 6),
                  right: DynamicBorderSide(
                      color: themePalette.baseColor5, width: 12))),
          textStyle: DynamicTextStyle(
            letterSpacing: 1.toPXLength,
            fontSize: 24.toPXLength,
            fontFamily: "Beon",
            fontWeight: FontWeight.w700,
            color: Colors.white,
            shadows: [
              const Shadow(
                  blurRadius: 5, color: Colors.white, offset: Offset(0, 0)),
              const Shadow(
                  blurRadius: 20, color: Colors.white, offset: Offset(0, 0)),
              const Shadow(
                  blurRadius: 1, color: Colors.white70, offset: Offset(0, 0))
            ],
          ),
        ),
        middleScreen: _baseStyle.copyWith(
          width: _TileDimension.medium,
          height: _TileDimension.medium,
          shapeBorder: RoundedRectangleShapeBorder(
              borderRadius: DynamicBorderRadius.all(
                  DynamicRadius.circular(15.toPXLength)),
              borderSides: RectangleBorderSides.only(
                  top: DynamicBorderSide(
                      gradient: LinearGradient(colors: [
                        themePalette.baseColor2,
                        themePalette.baseColor6
                      ]),
                      width: 8),
                  bottom: DynamicBorderSide(
                      gradient: LinearGradient(colors: [
                        themePalette.baseColor4,
                        themePalette.baseColor8
                      ]),
                      width: 16),
                  left: DynamicBorderSide(
                      color: themePalette.baseColor1, width: 8),
                  right: DynamicBorderSide(
                      color: themePalette.baseColor5, width: 16))),
        ),
        largeScreen: _baseStyle.copyWith(
          width: _TileDimension.large,
          height: _TileDimension.large,
          shapeBorder: RoundedRectangleShapeBorder(
              borderRadius: DynamicBorderRadius.all(
                  DynamicRadius.circular(15.toPXLength)),
              borderSides: RectangleBorderSides.only(
                  top: DynamicBorderSide(
                      gradient: LinearGradient(colors: [
                        themePalette.baseColor2,
                        themePalette.baseColor6
                      ]),
                      width: 10),
                  bottom: DynamicBorderSide(
                      gradient: LinearGradient(colors: [
                        themePalette.baseColor4,
                        themePalette.baseColor8
                      ]),
                      width: 20),
                  left: DynamicBorderSide(
                      color: themePalette.baseColor1, width: 10),
                  right: DynamicBorderSide(
                      color: themePalette.baseColor5, width: 20))),
        )
      });

  @override
  Responsive<Style> get hoverStyle => Responsive({
        smallScreen: _baseStyle.copyWith(
          width: _TileDimension.small,
          height: _TileDimension.small,
          shapeBorder: RoundedRectangleShapeBorder(
              borderRadius: DynamicBorderRadius.all(
                  DynamicRadius.circular(15.toPXLength)),
              borderSides: RectangleBorderSides.only(
                  top: DynamicBorderSide(
                      gradient: LinearGradient(colors: [
                        themePalette.baseColor2,
                        themePalette.baseColor6
                      ]),
                      width: 5),
                  bottom: DynamicBorderSide(
                      gradient: LinearGradient(colors: [
                        themePalette.baseColor4,
                        themePalette.baseColor8
                      ]),
                      width: 10),
                  left: DynamicBorderSide(
                      color: themePalette.baseColor1, width: 5),
                  right: DynamicBorderSide(
                      color: themePalette.baseColor5, width: 10))),
          textStyle: DynamicTextStyle(
            letterSpacing: 1.toPXLength,
            fontSize: 30.toPXLength,
            fontFamily: "Beon",
            fontWeight: FontWeight.w900,
            color: Colors.white,
            shadows: [
              const Shadow(
                  blurRadius: 10, color: Colors.white, offset: Offset(0, 0)),
              const Shadow(
                  blurRadius: 25, color: Colors.white, offset: Offset(0, 0)),
              const Shadow(
                  blurRadius: 5, color: Colors.white70, offset: Offset(0, 0))
            ],
          ),
        ),
        middleScreen: _baseStyle.copyWith(
          width: _TileDimension.medium,
          height: _TileDimension.medium,
          shapeBorder: RoundedRectangleShapeBorder(
              borderRadius: DynamicBorderRadius.all(
                  DynamicRadius.circular(15.toPXLength)),
              borderSides: RectangleBorderSides.only(
                  top: DynamicBorderSide(
                      gradient: LinearGradient(colors: [
                        themePalette.baseColor2,
                        themePalette.baseColor6
                      ]),
                      width: 7),
                  bottom: DynamicBorderSide(
                      gradient: LinearGradient(colors: [
                        themePalette.baseColor4,
                        themePalette.baseColor8
                      ]),
                      width: 14),
                  left: DynamicBorderSide(
                      color: themePalette.baseColor1, width: 7),
                  right: DynamicBorderSide(
                      color: themePalette.baseColor5, width: 14))),
          textStyle: DynamicTextStyle(
            letterSpacing: 1.toPXLength,
            fontSize: 30.toPXLength,
            fontFamily: "Beon",
            fontWeight: FontWeight.w900,
            color: Colors.white,
            shadows: [
              const Shadow(
                  blurRadius: 10, color: Colors.white, offset: Offset(0, 0)),
              const Shadow(
                  blurRadius: 25, color: Colors.white, offset: Offset(0, 0)),
              const Shadow(
                  blurRadius: 5, color: Colors.white70, offset: Offset(0, 0))
            ],
          ),
        ),
        largeScreen: _baseStyle.copyWith(
          width: _TileDimension.large,
          height: _TileDimension.large,
          shapeBorder: RoundedRectangleShapeBorder(
              borderRadius: DynamicBorderRadius.all(
                  DynamicRadius.circular(15.toPXLength)),
              borderSides: RectangleBorderSides.only(
                  top: DynamicBorderSide(
                      gradient: LinearGradient(colors: [
                        themePalette.baseColor2,
                        themePalette.baseColor6
                      ]),
                      width: 9),
                  bottom: DynamicBorderSide(
                      gradient: LinearGradient(colors: [
                        themePalette.baseColor4,
                        themePalette.baseColor8
                      ]),
                      width: 18),
                  left: DynamicBorderSide(
                      color: themePalette.baseColor1, width: 9),
                  right: DynamicBorderSide(
                      color: themePalette.baseColor5, width: 18))),
          textStyle: DynamicTextStyle(
            letterSpacing: 1.toPXLength,
            fontSize: 30.toPXLength,
            fontFamily: "Beon",
            fontWeight: FontWeight.w900,
            color: Colors.white,
            shadows: [
              const Shadow(
                  blurRadius: 10, color: Colors.white, offset: Offset(0, 0)),
              const Shadow(
                  blurRadius: 25, color: Colors.white, offset: Offset(0, 0)),
              const Shadow(
                  blurRadius: 5, color: Colors.white70, offset: Offset(0, 0))
            ],
          ),
        )
      });

  @override
  Responsive<Style> get pressedStyle => Responsive({
        smallScreen: _baseStyle.copyWith(
          width: _TileDimension.small,
          height: _TileDimension.small,
          shapeBorder: RoundedRectangleShapeBorder(
              borderRadius: DynamicBorderRadius.all(
                  DynamicRadius.circular(15.toPXLength)),
              borderSides: RectangleBorderSides.only(
                  top: DynamicBorderSide(
                      gradient: LinearGradient(colors: [
                        themePalette.baseColor2,
                        themePalette.baseColor6
                      ]),
                      width: 3),
                  bottom: DynamicBorderSide(
                      gradient: LinearGradient(colors: [
                        themePalette.baseColor4,
                        themePalette.baseColor8
                      ]),
                      width: 6),
                  left: DynamicBorderSide(
                      color: themePalette.baseColor1, width: 3),
                  right: DynamicBorderSide(
                      color: themePalette.baseColor5, width: 6))),
        ),
        middleScreen: _baseStyle.copyWith(
          width: _TileDimension.medium,
          height: _TileDimension.medium,
          shapeBorder: RoundedRectangleShapeBorder(
              borderRadius: DynamicBorderRadius.all(
                  DynamicRadius.circular(15.toPXLength)),
              borderSides: RectangleBorderSides.only(
                  top: DynamicBorderSide(
                      gradient: LinearGradient(colors: [
                        themePalette.baseColor2,
                        themePalette.baseColor6
                      ]),
                      width: 5),
                  bottom: DynamicBorderSide(
                      gradient: LinearGradient(colors: [
                        themePalette.baseColor4,
                        themePalette.baseColor8
                      ]),
                      width: 10),
                  left: DynamicBorderSide(
                      color: themePalette.baseColor1, width: 5),
                  right: DynamicBorderSide(
                      color: themePalette.baseColor5, width: 10))),
        ),
        largeScreen: _baseStyle.copyWith(
          width: _TileDimension.large,
          height: _TileDimension.large,
          shapeBorder: RoundedRectangleShapeBorder(
              borderRadius: DynamicBorderRadius.all(
                  DynamicRadius.circular(15.toPXLength)),
              borderSides: RectangleBorderSides.only(
                  top: DynamicBorderSide(
                      gradient: LinearGradient(colors: [
                        themePalette.baseColor2,
                        themePalette.baseColor6
                      ]),
                      width: 7),
                  bottom: DynamicBorderSide(
                      gradient: LinearGradient(colors: [
                        themePalette.baseColor4,
                        themePalette.baseColor8
                      ]),
                      width: 14),
                  left: DynamicBorderSide(
                      color: themePalette.baseColor1, width: 7),
                  right: DynamicBorderSide(
                      color: themePalette.baseColor5, width: 14))),
        )
      });

  @override
  DynamicTextStyle get menuActiveStyle => DynamicTextStyle(
        color: themePalette.menuActiveColor,
        fontFamily: "Beon",
        fontWeight: FontWeight.bold,
        shadows: [
          Shadow(
              blurRadius: 2,
              color: themePalette.menuActiveColor,
              offset: Offset(1, 1)),
          Shadow(
              blurRadius: 3,
              color: themePalette.menuActiveColor,
              offset: Offset(0, 0)),
        ],
      );

  @override
  Color get menuUnderlineColor => themePalette.menuUnderlineColor;

  @override
  DynamicTextStyle get menuInactiveStyle => DynamicTextStyle(
        color: themePalette.menuInactiveColor,
        fontFamily: "Beon",
        shadows: [
          Shadow(
              blurRadius: 3,
              color: themePalette.menuInactiveColor,
              offset: Offset(0, 0)),
        ],
      );

  @override
  String get tilePressSoundAsset => "assets/audio/neon_click.mp3";

  @override
  PuzzleLayoutDelegate get layoutDelegate => const SimplePuzzleLayoutDelegate();

  Style get _baseStyle => Style(
      alignment: Alignment.center,
      childAlignment: Alignment.center,
      padding: const EdgeInsets.all(3),
      backgroundDecoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [themePalette.baseColor3, themePalette.baseColor7])),
      shadows: [
        ShapeShadow(
            blurRadius: 24,
            gradient: LinearGradient(
                colors: [themePalette.baseColor3, themePalette.baseColor7]),
            offset: Offset(2, 2)),
      ],
      textStyle: DynamicTextStyle(
        letterSpacing: 1.toPXLength,
        fontSize: 30.toPXLength,
        fontFamily: "Beon",
        fontWeight: FontWeight.w700,
        color: themePalette.tileTextColor,
        shadows: [
          Shadow(
              blurRadius: 5,
              color: themePalette.tileTextColor,
              offset: Offset(1, 1)),
          Shadow(
              blurRadius: 10,
              color: themePalette.tileTextColor,
              offset: Offset(1, 1)),
          Shadow(
              blurRadius: 1,
              color: themePalette.tileTextColor,
              offset: Offset(-1, -1))
        ],
      ),
      textAlign: TextAlign.center,
      //shaderGradient:
      //    LinearGradient(colors: [Colors.purpleAccent, Colors.cyanAccent]),
      mouseCursor: SystemMouseCursors.click);
}

abstract class _TileDimension {
  static Dimension small = Dimension.min(62.0.toPXLength, 100.toPercentLength);
  static Dimension medium =
      Dimension.min(100.0.toPXLength, 100.toPercentLength);
  static Dimension large = Dimension.min(112.0.toPXLength, 100.toPercentLength);
}

abstract class NeonThemePalette {
  Color get baseColor1;
  Color get baseColor2;
  Color get baseColor3;
  Color get baseColor4;
  Color get baseColor5;
  Color get baseColor6;
  Color get baseColor7;
  Color get baseColor8;

  Color get kAmbientShadowOpacity;

  Color get nameColor;
  Color get titleColor;
  Color get defaultColor;

  Color get tileTextColor;

  Color get menuUnderlineColor;
  Color get menuInactiveColor;
  Color get menuActiveColor;

  Color get popupMenuSliderActiveTrackColor;
  Color get popupMenuSliderTrackColor;
  Color get popupMenuSliderThumbColor;

  Color get popupMenuTileColor;
  Color get popupMenuTitleColor;

  Color get popupMenuSelectedColor;
  Color get popupMenuUnselectedColor;

  Gradient get popupMenuGradient;
  Gradient get backgroundGradient;
}

class NeonThemePaletteLight extends NeonThemePalette {
  @override
  Color get nameColor => Colors.cyan.shade900;
  @override
  Color get titleColor => Colors.cyan.shade600;
  @override
  Color get defaultColor => Colors.cyan;

  Color get baseColor1 => Color(0xFF18FFDF);
  Color get baseColor2 => Color(0xFF84FFDF);
  Color get baseColor3 => Color(0xFF18FFDF);
  Color get baseColor4 => Color(0xFF00BCC4);
  Color get baseColor5 => Colors.pinkAccent;
  Color get baseColor6 => Colors.pinkAccent.shade100;
  Color get baseColor7 => Colors.pinkAccent;
  Color get baseColor8 => Colors.pink;

  Color get kAmbientShadowOpacity => Colors.blue.shade400.withOpacity(0.5);

  @override
  Color get tileTextColor => Colors.white.withOpacity(0.9);

  @override
  Color get menuUnderlineColor => Colors.cyan.shade700;
  @override
  Color get menuInactiveColor => PuzzleColors.grey1;
  @override
  Color get menuActiveColor => Colors.cyan.shade600;

  @override
  Color get popupMenuSliderActiveTrackColor => Colors.cyan;
  @override
  Color get popupMenuSliderTrackColor => Colors.black87;
  @override
  Color get popupMenuSliderThumbColor => Colors.cyanAccent;

  @override
  Color get popupMenuTileColor => Colors.cyanAccent.shade700;
  @override
  Color get popupMenuTitleColor => Colors.cyan.shade800;

  @override
  Color get popupMenuSelectedColor => Colors.white70;
  @override
  Color get popupMenuUnselectedColor => Colors.grey.shade900;

  @override
  Gradient get popupMenuGradient => LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.lightBlue.shade100,
            Colors.lightBlue.shade50,
            Colors.white,
          ],
          stops: const [
            0,
            0.3,
            1
          ]);

  @override
  Gradient get backgroundGradient => LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [
          Colors.yellow.shade600,
          Colors.yellowAccent.shade400,
        ],
      );
}

class NeonThemePaletteDark extends NeonThemePalette {
  @override
  Color get nameColor => Colors.white70;
  @override
  Color get titleColor => Color(0xFFFCEC0C);
  @override
  Color get defaultColor => Colors.white;

  Color get baseColor1 => Colors.cyanAccent.shade200;
  Color get baseColor2 => Colors.cyanAccent.shade100;
  Color get baseColor3 => Colors.cyanAccent;
  Color get baseColor4 => Colors.cyan;
  Color get baseColor5 => Colors.purpleAccent;
  Color get baseColor6 => Colors.purpleAccent.shade100;
  Color get baseColor7 => Colors.purpleAccent;
  Color get baseColor8 => Colors.purple;

  Color get kAmbientShadowOpacity => Colors.blue.shade900.withOpacity(0.7);

  @override
  Color get tileTextColor => Colors.white;

  @override
  Color get menuUnderlineColor => const Color(0xFFFCEC0C);
  @override
  Color get menuInactiveColor => Colors.white;
  @override
  Color get menuActiveColor => Color(0xFFFCEC0C);

  @override
  Color get popupMenuSliderActiveTrackColor => Colors.yellowAccent;
  @override
  Color get popupMenuSliderTrackColor => Colors.black87;
  @override
  Color get popupMenuSliderThumbColor => Color(0xFFFCEC0C);

  @override
  Color get popupMenuTileColor => Color(0xFFFCEC0C);
  @override
  Color get popupMenuTitleColor => Color(0xFFFCEC0C);

  @override
  Color get popupMenuSelectedColor => Colors.black87;
  @override
  Color get popupMenuUnselectedColor => Colors.white70;

  @override
  Gradient get popupMenuGradient => LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.blue.shade900,
            Colors.blue.shade800,
            Colors.blue.shade700,
          ],
          stops: const [
            0,
            0.3,
            1
          ]);

  @override
  Gradient get backgroundGradient => LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Color(0xFF711C91),
            Color(0xFF091833),
          ]);
}
