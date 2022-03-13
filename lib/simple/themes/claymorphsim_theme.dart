import 'package:animated_styled_widget/animated_styled_widget.dart';

import 'package:flutter/material.dart';
import 'package:responsive_property/responsive_property.dart';
import 'package:very_good_slide_puzzle/colors/colors.dart';
import 'package:very_good_slide_puzzle/layout/layout.dart';
import 'package:very_good_slide_puzzle/simple/simple.dart';

import 'package:very_good_slide_puzzle/theme/theme.dart';

/// {@template simple_theme}
/// The simple puzzle theme.
/// {@endtemplate}
class ClaymorphismTheme extends SimpleTheme {
  /// {@macro simple_theme}
  const ClaymorphismTheme({ThemeLuminance? luminance = ThemeLuminance.light})
      : super(luminance: luminance);

  @override
  Map<Locale, String> get name => {
        const Locale("en"): 'Claymorphism',
        const Locale("es"): 'Arcillamorfismo',
        const Locale("zh"): "黏土拟物"
      };

  @override
  ClaymorphismTheme copyWith({
    ThemeLuminance? luminance,
  }) {
    return ClaymorphismTheme(luminance: luminance ?? this.luminance);
  }

  ClaymorphismThemePalette get themePalette => luminance == ThemeLuminance.light
      ? ClaymorphismThemePaletteLight()
      : ClaymorphismThemePaletteDark();

  @override
  bool get hasTimer => false;

  @override
  Curve get tileMoveAnimationCurve => Curves.easeInOutBack;

  @override
  Duration get tileMoveAnimationDuration => const Duration(milliseconds: 333);

  @override
  DynamicTextStyle get nameTextStyle => DynamicTextStyle(
      fontFamily: "BalooThambi2", color: themePalette.nameColor);

  @override
  DynamicTextStyle get titleTextStyle => DynamicTextStyle(
        color: themePalette.tileTextColor,
        fontFamily: "BalooThambi2",
        fontWeight: FontWeight.bold,
      );

  @override
  DynamicTextStyle get defaultTextStyle => DynamicTextStyle(
        color: themePalette.tileTextColor,
        fontFamily: "BalooThambi2",
      );

  @override
  Responsive<Style> get backgroundStyle => Responsive({
        allScreen: Style(
          backgroundDecoration:
              BoxDecoration(gradient: themePalette.backgroundGradient),
        )
      });

  @override
  Responsive<Style> get popupMenuStyle => Responsive({
        allScreen: Style(
          width: Dimension.min(240.toPXLength, 90.toPercentLength),
          backgroundDecoration:
              BoxDecoration(gradient: themePalette.popupMenuGradient),
          shapeBorder: RectangleShapeBorder(
            border: DynamicBorderSide(
                color: themePalette.baseColor3.withOpacity(0.6), width: 0.2),
            borderRadius:
                DynamicBorderRadius.all(DynamicRadius.circular(20.toPXLength)),
          ),
          shadows: [
            ShapeShadow(
                blurRadius: 10,
                spreadRadius: 2,
                color: themePalette.kAmbientShadowOpacity,
                offset: const Offset(4, 4)),
          ],
          insetShadows: [
            ShapeShadow(
                blurRadius: 3,
                color: themePalette.baseColor4,
                offset: const Offset((3), (3))),
            ShapeShadow(
                blurRadius: 3,
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: const [
                      0,
                      0.5
                    ],
                    colors: [
                      themePalette.baseColor2.withOpacity(0.5),
                      themePalette.baseColor3.withOpacity(0.5),
                    ]),
                offset: const Offset(-3, -3)),
          ],
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        ),
      });

  @override
  Responsive<Style> get popupMenuButtonStyle => Responsive({
        allScreen: Style(
            alignment: Alignment.center,
            childAlignment: Alignment.center,
            backgroundDecoration: BoxDecoration(
                color: themePalette.popupMenuTileColor.withOpacity(0.001)),
            margin: const EdgeInsets.all(2),
            padding: const EdgeInsets.all(4),
            shapeBorder: RectangleShapeBorder(
              borderRadius: DynamicBorderRadius.all(
                  DynamicRadius.circular(25.toPXLength)),
            ),
            textStyle: DynamicTextStyle(
              fontSize: 16.toPXLength,
              letterSpacing: 0.1.toPXLength,
              fontFamily: "BalooThambi2",
              fontWeight: FontWeight.w700,
              color: themePalette.tileTextColor.withOpacity(0.6),
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
            padding: const EdgeInsets.all(4),
            backgroundDecoration: BoxDecoration(
                color: themePalette.popupMenuTileColor.withOpacity(0.2)),
            shapeBorder: RectangleShapeBorder(
              borderRadius: DynamicBorderRadius.all(
                  DynamicRadius.circular(25.toPXLength)),
            ),
            textStyle: DynamicTextStyle(
              fontSize: 16.toPXLength,
              letterSpacing: 0.1.toPXLength,
              fontFamily: "BalooThambi2",
              fontWeight: FontWeight.w700,
              color: themePalette.tileTextColor.withOpacity(0.8),
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
            padding: const EdgeInsets.all(4),
            backgroundDecoration: BoxDecoration(color: themePalette.baseColor1),
            shadows: [
              ShapeShadow(
                  blurRadius: 10,
                  spreadRadius: 2,
                  color: themePalette.kAmbientShadowOpacity,
                  offset: const Offset(4, 4)),
            ],
            insetShadows: [
              ShapeShadow(
                  blurRadius: 3,
                  color: themePalette.baseColor4,
                  offset: const Offset((2), (2))),
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
                        themePalette.baseColor2,
                        themePalette.baseColor3,
                      ]),
                  offset: const Offset(-3, -3)),
            ],
            shapeBorder: RectangleShapeBorder(
              borderRadius: DynamicBorderRadius.all(
                  DynamicRadius.circular(25.toPXLength)),
            ),
            textStyle: DynamicTextStyle(
              fontSize: 16.toPXLength,
              letterSpacing: 0.1.toPXLength,
              fontFamily: "BalooThambi2",
              fontWeight: FontWeight.w700,
              color: themePalette.tileTextColor,
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
              letterSpacing: 0.1.toPXLength,
              fontSize: 18.toPXLength,
              fontFamily: "BalooThambi2",
              fontWeight: FontWeight.w700,
              color: themePalette.tileTextColor,
            ))
      });

  @override
  Responsive<Style> get popupMenuTileStyle => Responsive({
        allScreen: Style(
          backgroundDecoration: const BoxDecoration(
            color: Colors.transparent,
          ),
          shapeBorder: RectangleShapeBorder(
            border: DynamicBorderSide(
                color: Colors.blue.shade300.withOpacity(0.3), width: 2),
            borderRadius:
                DynamicBorderRadius.all(DynamicRadius.circular(15.toPXLength)),
          ),
          padding: const EdgeInsets.all(5),
          margin: const EdgeInsets.symmetric(vertical: 5),
        )
      });

  @override
  Responsive<Style> get popupMenuSliderThumbStyle => Responsive({
        allScreen: Style(
          shapeBorder: parseMorphableShapeBorder({
            "type": "Rectangle",
            "border": {
              "color": "ff000000",
              "width": 0,
              "style": "none",
              "strokeCap": "butt",
              "strokeJoin": "miter"
            },
            "borderRadius": {
              "topLeft": {"x": "94.5333557128907%", "y": "87.8666610717774%"},
              "topRight": {
                "x": "81.60000610351543%",
                "y": "88.93332926432305%"
              },
              "bottomLeft": {
                "x": "72.40001424153652%",
                "y": "77.33332316080705%"
              },
              "bottomRight": {
                "x": "90.933339436849%",
                "y": "82.26665242513029%"
              }
            },
            "cornerStyles": {
              "topLeft": "rounded",
              "bottomLeft": "rounded",
              "topRight": "rounded",
              "bottomRight": "rounded"
            }
          }),
          backgroundDecoration: BoxDecoration(color: themePalette.baseColor1),
          shadows: [
            ShapeShadow(
                blurRadius: 10,
                spreadRadius: 2,
                color: themePalette.kAmbientShadowOpacity,
                offset: const Offset(4, 4)),
          ],
          insetShadows: [
            ShapeShadow(
                blurRadius: 3,
                color: themePalette.baseColor4,
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
                      themePalette.baseColor2,
                      themePalette.baseColor3,
                    ]),
                offset: const Offset(-3, -3)),
          ],
          width: 20.toPXLength,
          height: 20.toPXLength,
        )
      });

  @override
  Responsive<Style> get popupMenuSliderTrackStyle => Responsive({
        allScreen: Style(
          width: 88.toPercentLength,
          height: 4.toPXLength,
          backgroundDecoration: BoxDecoration(
            color: themePalette.popupMenuSliderTrackColor,
          ),
          shapeBorder: RectangleShapeBorder(
            borderRadius:
                DynamicBorderRadius.all(DynamicRadius.circular(2.toPXLength)),
          ),
        )
      });

  @override
  Responsive<Style> get popupMenuSliderActiveTrackStyle => Responsive({
        allScreen: Style(
          height: 8.toPXLength,
          backgroundDecoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            themePalette.tileTextColor,
            themePalette.tileTextColor.withOpacity(0.8),
          ])),
          shapeBorder: RectangleShapeBorder(
            borderRadius:
                DynamicBorderRadius.all(DynamicRadius.circular(4.toPXLength)),
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
          transform: SmoothMatrix4()..scale(0.97),
          shadows: [
            ShapeShadow(
                blurRadius: 6,
                spreadRadius: 2,
                color: themePalette.kAmbientShadowOpacity,
                offset: const Offset(2, 2)),
          ],
        ),
        middleScreen: _baseStyle.copyWith(
          width: _TileDimension.medium,
          height: _TileDimension.medium,
          transform: SmoothMatrix4()..scale(0.97),
          shadows: [
            ShapeShadow(
                blurRadius: 6,
                spreadRadius: 2,
                color: themePalette.kAmbientShadowOpacity,
                offset: const Offset(2, 2)),
          ],
        ),
        largeScreen: _baseStyle.copyWith(
          width: _TileDimension.large,
          height: _TileDimension.large,
          transform: SmoothMatrix4()..scale(0.97),
          shadows: [
            ShapeShadow(
                blurRadius: 6,
                spreadRadius: 2,
                color: themePalette.kAmbientShadowOpacity,
                offset: const Offset(2, 2)),
          ],
        )
      });

  @override
  Responsive<Style> get pressedStyle => Responsive({
        smallScreen: _baseStyle.copyWith(
          width: _TileDimension.small,
          height: _TileDimension.small,
          transform: SmoothMatrix4()..scale(0.94),
          shadows: [
            ShapeShadow(
                blurRadius: 1,
                spreadRadius: 0,
                color: themePalette.kAmbientShadowOpacity,
                offset: const Offset(1, 1)),
          ],
        ),
        middleScreen: _baseStyle.copyWith(
          width: _TileDimension.medium,
          height: _TileDimension.medium,
          transform: SmoothMatrix4()..scale(0.94),
          shadows: [
            ShapeShadow(
                blurRadius: 1,
                spreadRadius: 0,
                color: themePalette.kAmbientShadowOpacity,
                offset: const Offset(1, 1)),
          ],
        ),
        largeScreen: _baseStyle.copyWith(
          width: _TileDimension.large,
          height: _TileDimension.large,
          transform: SmoothMatrix4()..scale(0.94),
          shadows: [
            ShapeShadow(
                blurRadius: 1,
                spreadRadius: 0,
                color: themePalette.kAmbientShadowOpacity,
                offset: const Offset(1, 1)),
          ],
        )
      });

  @override
  DynamicTextStyle get menuActiveStyle => DynamicTextStyle(
      color: themePalette.menuActiveColor,
      fontWeight: FontWeight.w700,
      fontFamily: "BalooThambi2");

  @override
  Color get menuUnderlineColor => themePalette.menuUnderlineColor;

  @override
  DynamicTextStyle get menuInactiveStyle => DynamicTextStyle(
      color: themePalette.menuInactiveColor, fontFamily: "BalooThambi2");

  @override
  String get tilePressSoundAsset => "assets/audio/clay_click.mp3";

  @override
  PuzzleLayoutDelegate get layoutDelegate => const SimplePuzzleLayoutDelegate();

  Style get _baseStyle => Style(
      alignment: Alignment.center,
      transformAlignment: Alignment.center,
      backgroundDecoration: BoxDecoration(color: themePalette.baseColor1),
      shadows: [
        ShapeShadow(
            blurRadius: 10,
            spreadRadius: 2,
            color: themePalette.kAmbientShadowOpacity,
            offset: const Offset(4, 4)),
      ],
      insetShadows: [
        ShapeShadow(
            blurRadius: 3,
            color: themePalette.baseColor4,
            offset: const Offset((3), (3))),
        ShapeShadow(
            blurRadius: 2,
            spreadRadius: 1,
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: const [0, 0.5],
                colors: [themePalette.baseColor2, themePalette.baseColor3]),
            offset: const Offset(-3, -3)),
      ],
      textStyle: DynamicTextStyle(
        letterSpacing: 0.1.toPXLength,
        fontSize: 28.toPXLength,
        fontFamily: "BalooThambi2",
        fontWeight: FontWeight.w700,
        color: themePalette.tileTextColor,
      ),
      shapeBorder: parseMorphableShapeBorder({
        "type": "Rectangle",
        "border": {
          "color": "ff000000",
          "width": 0,
          "style": "none",
          "strokeCap": "butt",
          "strokeJoin": "miter"
        },
        "borderRadius": {
          "topLeft": {"x": "94.5333557128907%", "y": "87.8666610717774%"},
          "topRight": {"x": "81.60000610351543%", "y": "88.93332926432305%"},
          "bottomLeft": {"x": "72.40001424153652%", "y": "77.33332316080705%"},
          "bottomRight": {"x": "90.933339436849%", "y": "82.26665242513029%"}
        },
        "cornerStyles": {
          "topLeft": "rounded",
          "bottomLeft": "rounded",
          "topRight": "rounded",
          "bottomRight": "rounded"
        }
      }),
      childAlignment: Alignment.center,
      mouseCursor: SystemMouseCursors.click);
}

abstract class _TileDimension {
  static Dimension small = Dimension.min(60.0.toPXLength, 100.toPercentLength);
  static Dimension medium =
      Dimension.min(100.0.toPXLength, 100.toPercentLength);
  static Dimension large = Dimension.min(112.0.toPXLength, 100.toPercentLength);
}

abstract class ClaymorphismThemePalette {
  Color get baseColor1;
  Color get baseColor2;
  Color get baseColor3;
  Color get baseColor4;

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

  Color get popupMenuUnselectedColor;

  Gradient get popupMenuGradient;
  Gradient get backgroundGradient;
}

class ClaymorphismThemePaletteLight extends ClaymorphismThemePalette {
  @override
  Color get nameColor => PuzzleColors.grey1;
  @override
  Color get titleColor => PuzzleColors.green50;
  @override
  Color get defaultColor => PuzzleColors.grey1;

  @override
  Color get baseColor1 => Colors.lightBlue.shade100;
  @override
  Color get baseColor2 => Colors.lightBlue.shade300;
  @override
  Color get baseColor3 => Colors.lightBlue.shade700;
  @override
  Color get baseColor4 => Colors.white70.withOpacity(0.5);

  @override
  Color get kAmbientShadowOpacity => Colors.blue.shade400.withOpacity(0.5);

  @override
  Color get tileTextColor => Colors.blue.shade900;

  @override
  Color get menuUnderlineColor => Colors.blue.shade900;
  @override
  Color get menuInactiveColor => PuzzleColors.grey2;
  @override
  Color get menuActiveColor => Colors.black87;

  @override
  Color get popupMenuSliderActiveTrackColor => PuzzleColors.primary6;
  @override
  Color get popupMenuSliderTrackColor => Colors.lightBlue.shade100;
  @override
  Color get popupMenuSliderThumbColor => PuzzleColors.primary5;

  @override
  Color get popupMenuTileColor => const Color(0xFFFAFAFA);
  @override
  Color get popupMenuTitleColor => PuzzleColors.primary5;

  @override
  Color get popupMenuUnselectedColor => Colors.grey.shade700;

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
          ]);
}

class ClaymorphismThemePaletteDark extends ClaymorphismThemePalette {
  @override
  Color get nameColor => Colors.white70;
  @override
  Color get titleColor => PuzzleColors.green90;
  @override
  Color get defaultColor => PuzzleColors.primary8;

  @override
  Color get baseColor1 => const Color(0xFF243450);
  @override
  Color get baseColor2 => const Color(0xFF203046);
  @override
  Color get baseColor3 => const Color(0xFF142438);
  @override
  Color get baseColor4 => Colors.lightBlue.shade100.withOpacity(0.4);

  @override
  Color get kAmbientShadowOpacity => const Color(0xFF142438).withOpacity(0.8);

  @override
  Color get tileTextColor => Colors.white;

  @override
  Color get menuUnderlineColor => Colors.white;
  @override
  Color get menuInactiveColor => const Color(0xFF9A9A9A);
  @override
  Color get menuActiveColor => Colors.white;

  @override
  Color get popupMenuSliderActiveTrackColor => PuzzleColors.primary6;
  @override
  Color get popupMenuSliderTrackColor => Colors.lightBlue.shade100;
  @override
  Color get popupMenuSliderThumbColor => PuzzleColors.primary5;

  @override
  Color get popupMenuTileColor => const Color(0xFFFAFAFA);
  @override
  Color get popupMenuTitleColor => PuzzleColors.primary5;

  @override
  Color get popupMenuUnselectedColor => Colors.grey.shade700;

  @override
  Gradient get popupMenuGradient => const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF142438),
            Color(0xFF182842),
            Color(0xFF203046),
          ],
          stops: [
            0,
            0.3,
            1
          ]);

  @override
  Gradient get backgroundGradient => const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF142438),
            Color(0xFF182842),
            Color(0xFF203046),
            Color(0xFF0D3481),
          ],
          stops: [
            0,
            0.15,
            0.3,
            1
          ]);
}
