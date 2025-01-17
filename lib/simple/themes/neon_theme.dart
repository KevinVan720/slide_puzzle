import 'package:animated_styled_widget/animated_styled_widget.dart';
import 'package:flutter/material.dart';
import 'package:responsive_property/responsive_property.dart';
import 'package:very_good_slide_puzzle/layout/layout.dart';
import 'package:very_good_slide_puzzle/simple/simple.dart';
import 'package:very_good_slide_puzzle/colors/colors.dart';

import 'package:very_good_slide_puzzle/theme/theme.dart';

import 'dart:math';

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

  @override
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
              offset: const Offset(1, 1)),
          Shadow(
              blurRadius: 4,
              color: themePalette.nameColor,
              offset: const Offset(0, 0)),
          Shadow(
              blurRadius: 1,
              color: themePalette.nameColor,
              offset: const Offset(0, 0))
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
              offset: const Offset(1, 1)),
          Shadow(
              blurRadius: 20,
              color: themePalette.titleColor,
              offset: const Offset(0, 0)),
          Shadow(
              blurRadius: 1,
              color: themePalette.titleColor,
              offset: const Offset(0, 0))
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
              offset: const Offset(1, 1)),
        ],
      );

  @override
  double get backgroundAnimationScale => 5;
  @override
  double get backgroundAnimationPeriodScale => 5;

  @override
  Responsive<Style> get backgroundStyle {
    int phase = (DateTime.now().millisecondsSinceEpoch) % 2;

    Gradient gradient = LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: phase % 2 == 0
          ? themePalette.backgroundGradient.colors
          : themePalette.backgroundGradient.colors.reversed.toList(),
    );

    return Responsive({
      allScreen: Style(backgroundDecoration: BoxDecoration(gradient: gradient))
    });
  }

  @override
  Responsive<Style> appBarStyle(double stuckAmount) => Responsive({
        allScreen: Style(
          opacity: stuckAmount.abs().clamp(0, 1),
          backgroundDecoration:
              BoxDecoration(color: Color.lerp(themePalette.backgroundGradient.colors[1], themePalette.backgroundGradient.colors[0], 0.5)),
          shapeBorder: RoundedRectangleShapeBorder(
              borderSides: RectangleBorderSides.only(
            bottom: DynamicBorderSide(
                color: themePalette.menuUnderlineColor, width: 3),
          )),
        )
      });

  @override
  Responsive<Style> get popupMenuStyle => Responsive({
        allScreen: Style(
          margin: const EdgeInsets.all(10),
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
            padding: const EdgeInsets.all(4),
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
            padding: const EdgeInsets.all(4),
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
            padding: const EdgeInsets.all(4),
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
                  offset: const Offset(1, 1)),
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
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
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
                    offset: const Offset(0, 0)),
                Shadow(
                    blurRadius: 3,
                    color: themePalette.popupMenuTitleColor,
                    offset: const Offset(0, 0)),
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
                offset: const Offset(2, 2)),
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
                offset: const Offset(1, 1)),
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
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
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
                    right:
                        DynamicBorderSide(color: themePalette.baseColor5, width: 12))),
            textStyle: _baseStyle.textStyle?.copyWith(fontSize: 24.toPXLength)),
        middleScreen: _baseStyle.copyWith(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
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
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
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
  Responsive<Style> get buttonHoverStyle => Responsive({
        smallScreen: _baseStyle.copyWith(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
            shapeBorder: RoundedRectangleShapeBorder(
                borderRadius: DynamicBorderRadius.all(
                    DynamicRadius.circular(15.toPXLength)),
                borderSides: RectangleBorderSides.only(
                    top: DynamicBorderSide(
                        gradient: LinearGradient(colors: [
                          themePalette.baseColor2,
                          themePalette.baseColor6
                        ]),
                        width: 4),
                    bottom: DynamicBorderSide(
                        gradient: LinearGradient(colors: [
                          themePalette.baseColor4,
                          themePalette.baseColor8
                        ]),
                        width: 10),
                    left: DynamicBorderSide(
                        color: themePalette.baseColor1, width: 5),
                    right: DynamicBorderSide(color: themePalette.baseColor5, width: 10))),
            textStyle: _baseStyle.textStyle?.copyWith(fontSize: 24.toPXLength)),
        middleScreen: _baseStyle.copyWith(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
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
                      width: 14),
                  left: DynamicBorderSide(
                      color: themePalette.baseColor1, width: 7),
                  right: DynamicBorderSide(
                      color: themePalette.baseColor5, width: 14))),
        ),
        largeScreen: _baseStyle.copyWith(
          padding: const EdgeInsets.symmetric(vertical: 11, horizontal: 4),
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
                      color: themePalette.baseColor1, width: 9),
                  right: DynamicBorderSide(
                      color: themePalette.baseColor5, width: 18))),
        )
      });

  @override
  Responsive<Style> get buttonPressedStyle => Responsive({
        smallScreen: _baseStyle.copyWith(
            padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 4),
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
                        width: 5),
                    left: DynamicBorderSide(
                        color: themePalette.baseColor1, width: 3),
                    right: DynamicBorderSide(color: themePalette.baseColor5, width: 6))),
            textStyle: _baseStyle.textStyle?.copyWith(fontSize: 24.toPXLength)),
        middleScreen: _baseStyle.copyWith(
          padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 4),
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
                      width: 9),
                  left: DynamicBorderSide(
                      color: themePalette.baseColor1, width: 5),
                  right: DynamicBorderSide(
                      color: themePalette.baseColor5, width: 10))),
        ),
        largeScreen: _baseStyle.copyWith(
          padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 4),
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
                      width: 13),
                  left: DynamicBorderSide(
                      color: themePalette.baseColor1, width: 7),
                  right: DynamicBorderSide(
                      color: themePalette.baseColor5, width: 14))),
        )
      });

  @override
  Responsive<Style> get tileStyle => Responsive({
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
                    right:
                        DynamicBorderSide(color: themePalette.baseColor5, width: 12))),
            textStyle: _baseStyle.textStyle?.copyWith(fontSize: 24.toPXLength)),
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
  Responsive<Style> get tileHoverStyle => Responsive({
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
                    right:
                        DynamicBorderSide(color: themePalette.baseColor5, width: 10))),
            textStyle: _baseStyle.textStyle?.copyWith(fontSize: 24.toPXLength)),
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
        )
      });

  @override
  Responsive<Style> get tilePressedStyle => Responsive({
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
                    right:
                        DynamicBorderSide(color: themePalette.baseColor5, width: 6))),
            textStyle: _baseStyle.textStyle?.copyWith(fontSize: 24.toPXLength)),
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
        shadows: [
          Shadow(
              blurRadius: 2,
              color: themePalette.menuActiveColor,
              offset: const Offset(1, 1)),
          Shadow(
              blurRadius: 3,
              color: themePalette.menuActiveColor,
              offset: const Offset(0, 0)),
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
              offset: const Offset(0, 0)),
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
            offset: const Offset(2, 2)),
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
              offset: const Offset(1, 1)),
          Shadow(
              blurRadius: 10,
              color: themePalette.tileTextColor,
              offset: const Offset(1, 1)),
          Shadow(
              blurRadius: 1,
              color: themePalette.tileTextColor,
              offset: const Offset(-1, -1))
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

  Gradient get backgroundGradient;
}

class NeonThemePaletteLight extends NeonThemePalette {
  @override
  Color get nameColor => Colors.cyan.shade900;
  @override
  Color get titleColor => Colors.cyanAccent.shade700;
  @override
  Color get defaultColor => Colors.cyan;

  @override
  Color get baseColor1 => const Color(0xFF18FFDF);
  @override
  Color get baseColor2 => const Color(0xFF84FFDF);
  @override
  Color get baseColor3 => const Color(0xFF18FFDF);
  @override
  Color get baseColor4 => const Color(0xFF00BCC4);
  @override
  Color get baseColor5 => Colors.pinkAccent;
  @override
  Color get baseColor6 => Colors.pinkAccent.shade100;
  @override
  Color get baseColor7 => Colors.pinkAccent;
  @override
  Color get baseColor8 => Colors.pink;

  @override
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
  Gradient get backgroundGradient => LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [
          Colors.yellow.shade800,
          Colors.yellowAccent.shade200,
        ],
      );
}

class NeonThemePaletteDark extends NeonThemePalette {
  @override
  Color get nameColor => Colors.white70;
  @override
  Color get titleColor => const Color(0xFFFCEC0C);
  @override
  Color get defaultColor => Colors.white;

  @override
  Color get baseColor1 => Colors.cyanAccent.shade200;
  @override
  Color get baseColor2 => Colors.cyanAccent.shade100;
  @override
  Color get baseColor3 => Colors.cyanAccent;
  @override
  Color get baseColor4 => Colors.cyan;
  @override
  Color get baseColor5 => Colors.purpleAccent;
  @override
  Color get baseColor6 => Colors.purpleAccent.shade100;
  @override
  Color get baseColor7 => Colors.purpleAccent;
  @override
  Color get baseColor8 => Colors.purple;

  @override
  Color get kAmbientShadowOpacity => Colors.blue.shade900.withOpacity(0.7);

  @override
  Color get tileTextColor => Colors.white;

  @override
  Color get menuUnderlineColor => const Color(0xFFFCEC0C);
  @override
  Color get menuInactiveColor => Colors.white;
  @override
  Color get menuActiveColor => const Color(0xFFFCEC0C);

  @override
  Color get popupMenuSliderActiveTrackColor => Colors.yellowAccent;
  @override
  Color get popupMenuSliderTrackColor => Colors.black87;
  @override
  Color get popupMenuSliderThumbColor => const Color(0xFFFCEC0C);

  @override
  Color get popupMenuTileColor => const Color(0xFFFCEC0C);
  @override
  Color get popupMenuTitleColor => const Color(0xFFFCEC0C);

  @override
  Color get popupMenuSelectedColor => Colors.black87;
  @override
  Color get popupMenuUnselectedColor => Colors.white70;

  @override
  Gradient get backgroundGradient => const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Color(0xFF711C91),
            Color(0xFF091833),
          ]);
}
