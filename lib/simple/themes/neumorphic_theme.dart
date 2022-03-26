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
class NeumorphicTheme extends SimpleTheme {
  /// {@macro simple_theme}
  const NeumorphicTheme({ThemeLuminance? luminance = ThemeLuminance.light})
      : super(luminance: luminance);

  @override
  Map<Locale, String> get name => {
        const Locale("en"): 'Neumorphism',
        const Locale("es"): 'Neumorfismo',
        const Locale("zh"): "拟态"
      };

  @override
  NeumorphicTheme copyWith({
    ThemeLuminance? luminance,
  }) {
    return NeumorphicTheme(luminance: luminance ?? this.luminance);
  }

  NeumorphismThemePalette get themePalette => luminance == ThemeLuminance.light
      ? NeumorphismThemePaletteLight()
      : NeumorphismThemePaletteDark();

  @override
  bool get hasTimer => false;

  @override
  Curve get tileMoveAnimationCurve => Curves.decelerate;

  @override
  DynamicTextStyle get nameTextStyle => DynamicTextStyle(
        color: themePalette.nameColor,
        fontFamily: "BalooThambi2",
      );

  @override
  DynamicTextStyle get titleTextStyle => DynamicTextStyle(
        color: themePalette.titleColor,
        fontFamily: "BalooThambi2",
        fontWeight: FontWeight.bold,
      );

  @override
  DynamicTextStyle get defaultTextStyle => DynamicTextStyle(
        color: themePalette.defaultColor,
        fontFamily: "BalooThambi2",
      );

  @override
  Responsive<double> get tileSize => Responsive({
        smallScreen: 72,
        middleScreen: 100,
        largeScreen: 112,
      });

  @override
  Responsive<double> get tileGapSize => Responsive({
        smallScreen: 4,
        middleScreen: 6,
        largeScreen: 8,
      });

  @override
  Responsive<Style> get boardBackgroundStyle =>
      Responsive({allScreen: Style()});

  @override
  Responsive<Style> get backgroundStyle => Responsive({
        allScreen: Style(
            backgroundDecoration: BoxDecoration(color: themePalette.baseColor))
      });

  @override
  Responsive<Style> appBarStyle(double stuckAmount) => Responsive({
        allScreen: Style(
          opacity: stuckAmount.abs().clamp(0, 1),
          backgroundDecoration: BoxDecoration(
            color: themePalette.baseColor
                .withOpacity(stuckAmount.abs().clamp(0, 1)),
          ),
          shapeBorder: RectangleShapeBorder(
            borderRadius:
                DynamicBorderRadius.all(DynamicRadius.circular(0.toPXLength)),
          ),
          shadows: [
            ShapeShadow(
                blurRadius: 6,
                spreadRadius: -3,
                color: themePalette.baseColorDarker
                    .withOpacity(stuckAmount.abs().clamp(0, 1)),
                offset: const Offset(0, 6)),
          ],
        )
      });

  @override
  Responsive<Style> get popupMenuStyle => Responsive({
        allScreen: Style(
          margin: const EdgeInsets.all(10),
          width: Dimension.min(240.toPXLength, 90.toPercentLength),
          backgroundDecoration: BoxDecoration(
            color: themePalette.baseColor,
          ),
          shapeBorder: RectangleShapeBorder(
            borderRadius:
                DynamicBorderRadius.all(DynamicRadius.circular(10.toPXLength)),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          insetShadows: [
            ShapeShadow(
                blurRadius: 6,
                spreadRadius: -3,
                color: themePalette.baseColorDarker,
                offset: const Offset(6, 6)),
            ShapeShadow(
                blurRadius: 6,
                spreadRadius: -3,
                color: themePalette.baseColorLighter,
                offset: const Offset(-6, -6)),
          ],
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
              color: themePalette.baseColor.withOpacity(0.01),
            ),
            shapeBorder: RectangleShapeBorder(
              borderRadius: DynamicBorderRadius.all(
                  DynamicRadius.circular(10.toPXLength)),
            ),
            textStyle: DynamicTextStyle(
              fontSize: 16.toPXLength,
              fontWeight: FontWeight.w700,
              fontFamily: "BalooThambi2",
              color: themePalette.tileTextColor,
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
              color: themePalette.baseColor.withOpacity(0.01),
            ),
            shapeBorder: RectangleShapeBorder(
              borderRadius: DynamicBorderRadius.all(
                  DynamicRadius.circular(10.toPXLength)),
            ),
            insetShadows: [
              ShapeShadow(
                  blurRadius: 3,
                  spreadRadius: -3,
                  color: themePalette.baseColorDarker,
                  offset: const Offset(3, 3)),
              ShapeShadow(
                  blurRadius: 3,
                  spreadRadius: -3,
                  color: themePalette.baseColorLighter,
                  offset: const Offset(-3, -3)),
            ],
            textStyle: DynamicTextStyle(
              fontSize: 16.toPXLength,
              fontWeight: FontWeight.w700,
              fontFamily: "BalooThambi2",
              color: themePalette.tileTextColor,
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
              color: themePalette.baseColor,
            ),
            shapeBorder: RectangleShapeBorder(
              borderRadius: DynamicBorderRadius.all(
                  DynamicRadius.circular(10.toPXLength)),
            ),
            insetShadows: [
              ShapeShadow(
                  blurRadius: 6,
                  spreadRadius: -3,
                  color: themePalette.baseColorDarker,
                  offset: const Offset(6, 6)),
              ShapeShadow(
                  blurRadius: 6,
                  spreadRadius: -3,
                  color: themePalette.baseColorLighter,
                  offset: const Offset(-6, 6)),
            ],
            textStyle: DynamicTextStyle(
              fontSize: 16.toPXLength,
              fontWeight: FontWeight.w700,
              fontFamily: "BalooThambi2",
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
              fontSize: 16.toPXLength,
              color: themePalette.titleColor,
              fontFamily: "BalooThambi2",
              fontWeight: FontWeight.bold,
            ))
      });

  @override
  Responsive<Style> get popupMenuTileStyle => Responsive({
        allScreen: Style(
          backgroundDecoration: BoxDecoration(
            color: themePalette.baseColor,
          ),
          shapeBorder: RectangleShapeBorder(
            borderRadius:
                DynamicBorderRadius.all(DynamicRadius.circular(10.toPXLength)),
          ),
          padding: const EdgeInsets.all(5),
          margin: const EdgeInsets.symmetric(vertical: 5),
          shadows: [
            ShapeShadow(
                blurRadius: 10,
                spreadRadius: -3,
                color: themePalette.baseColorDarker,
                offset: const Offset(6, 6)),
            ShapeShadow(
                blurRadius: 10,
                spreadRadius: -3,
                color: themePalette.baseColorLighter,
                offset: const Offset(-6, -6)),
          ],
        )
      });

  @override
  Responsive<Style> get popupMenuSliderThumbStyle => Responsive({
        allScreen: Style(
            shapeBorder: const CircleShapeBorder(),
            backgroundDecoration: BoxDecoration(
              color: themePalette.popupMenuSliderThumbColor,
            ),
            width: 20.toPXLength,
            height: 20.toPXLength)
      });

  @override
  Responsive<Style> get popupMenuSliderTrackStyle => Responsive({
        allScreen: Style(
          width: 88.toPercentLength,
          height: 20.toPXLength,
          backgroundDecoration: BoxDecoration(
            color: themePalette.baseColor,
          ),
          shapeBorder: RectangleShapeBorder(
            borderRadius:
                DynamicBorderRadius.all(DynamicRadius.circular(10.toPXLength)),
          ),
          insetShadows: [
            ShapeShadow(
                blurRadius: 6,
                spreadRadius: -3,
                color: themePalette.baseColorDarker,
                offset: const Offset(6, 6)),
            ShapeShadow(
                blurRadius: 6,
                spreadRadius: -3,
                color: themePalette.baseColorLighter,
                offset: const Offset(-6, -6)),
          ],
        )
      });

  @override
  Responsive<Style> get popupMenuSliderActiveTrackStyle => Responsive({
        allScreen: Style(
          width: 90.toPercentLength,
          height: 20.toPXLength,
          backgroundDecoration: BoxDecoration(
            color: themePalette.popupMenuSliderThumbColor,
          ),
          shapeBorder: RectangleShapeBorder(
            borderRadius:
                DynamicBorderRadius.all(DynamicRadius.circular(10.toPXLength)),
          ),
          shadows: [
            ShapeShadow(
                blurRadius: 6,
                spreadRadius: -3,
                color: themePalette.baseColorLighter,
                offset: const Offset(6, 6)),
            ShapeShadow(
                blurRadius: 6,
                spreadRadius: -3,
                color: themePalette.baseColorDarker,
                offset: const Offset(-6, -6)),
          ],
        )
      });

  @override
  bool get isPopupMenuSliderThumbContained => true;

  @override
  Responsive<Style> get tileStyle => Responsive({
        smallScreen: _baseStyle.copyWith(
          width: _TileDimension.small,
          height: _TileDimension.small,
          shapeBorder: RectangleShapeBorder(
            borderRadius:
                DynamicBorderRadius.all(DynamicRadius.circular(15.toPXLength)),
          ),
        ),
        middleScreen: _baseStyle.copyWith(
          width: _TileDimension.medium,
          height: _TileDimension.medium,
          textStyle: DynamicTextStyle(
            letterSpacing: 2.toPXLength,
            fontSize: 24.toPXLength,
            fontWeight: FontWeight.w700,
            fontFamily: "BalooThambi2",
            color: themePalette.tileTextColor,
          ),
        ),
        largeScreen: _baseStyle.copyWith(
          width: _TileDimension.large,
          height: _TileDimension.large,
          textStyle: DynamicTextStyle(
            letterSpacing: 2.toPXLength,
            fontSize: 28.toPXLength,
            fontWeight: FontWeight.w700,
            fontFamily: "BalooThambi2",
            color: themePalette.tileTextColor,
          ),
        )
      });

  @override
  Responsive<Style> get tileHoverStyle => Responsive({
        smallScreen: _baseStyle.copyWith(
          width: _TileDimension.small,
          height: _TileDimension.small,
          shapeBorder: RectangleShapeBorder(
            borderRadius:
                DynamicBorderRadius.all(DynamicRadius.circular(15.toPXLength)),
          ),
          shadows: [
            ShapeShadow(
                blurRadius: 6,
                spreadRadius: -1,
                color: themePalette.baseColorDarker,
                offset: const Offset(3, 3)),
            ShapeShadow(
                blurRadius: 6,
                spreadRadius: -1,
                color: themePalette.baseColorLighter,
                offset: const Offset(-3, -3)),
          ],
        ),
        middleScreen: _baseStyle.copyWith(
          width: _TileDimension.medium,
          height: _TileDimension.medium,
          shadows: [
            ShapeShadow(
                blurRadius: 6,
                spreadRadius: -1,
                color: themePalette.baseColorDarker,
                offset: const Offset(3, 3)),
            ShapeShadow(
                blurRadius: 6,
                spreadRadius: -1,
                color: themePalette.baseColorLighter,
                offset: const Offset(-3, -3)),
          ],
          textStyle: DynamicTextStyle(
            letterSpacing: 2.toPXLength,
            fontSize: 24.toPXLength,
            fontWeight: FontWeight.w700,
            fontFamily: "BalooThambi2",
            color: themePalette.tileTextColor,
          ),
        ),
        largeScreen: _baseStyle.copyWith(
          width: _TileDimension.large,
          height: _TileDimension.large,
          shadows: [
            ShapeShadow(
                blurRadius: 6,
                spreadRadius: -1,
                color: themePalette.baseColorDarker,
                offset: const Offset(3, 3)),
            ShapeShadow(
                blurRadius: 6,
                spreadRadius: -1,
                color: themePalette.baseColorLighter,
                offset: const Offset(-3, -3)),
          ],
          textStyle: DynamicTextStyle(
            letterSpacing: 2.toPXLength,
            fontSize: 28.toPXLength,
            fontWeight: FontWeight.w700,
            fontFamily: "BalooThambi2",
            color: themePalette.tileTextColor,
          ),
        )
      });

  @override
  Responsive<Style> get tilePressedStyle => Responsive({
        smallScreen: _baseStyle.copyWith(
          width: _TileDimension.small,
          height: _TileDimension.small,
          shapeBorder: RectangleShapeBorder(
            borderRadius:
                DynamicBorderRadius.all(DynamicRadius.circular(15.toPXLength)),
          ),
          shadows: [],
          insetShadows: [
            ShapeShadow(
                blurRadius: 10,
                spreadRadius: -3,
                color: themePalette.baseColorDarker,
                offset: const Offset(10, 10)),
            ShapeShadow(
                blurRadius: 10,
                spreadRadius: -3,
                color: themePalette.baseColorLighter,
                offset: const Offset(-10, -10)),
          ],
        ),
        middleScreen: _baseStyle.copyWith(
          width: _TileDimension.medium,
          height: _TileDimension.medium,
          shadows: [],
          insetShadows: [
            ShapeShadow(
                blurRadius: 10,
                spreadRadius: -3,
                color: themePalette.baseColorDarker,
                offset: const Offset(10, 10)),
            ShapeShadow(
                blurRadius: 10,
                spreadRadius: -3,
                color: themePalette.baseColorLighter,
                offset: const Offset(-10, -10)),
          ],
          textStyle: DynamicTextStyle(
            letterSpacing: 2.toPXLength,
            fontSize: 24.toPXLength,
            fontWeight: FontWeight.w700,
            fontFamily: "BalooThambi2",
            color: themePalette.tileTextColor,
          ),
        ),
        largeScreen: _baseStyle.copyWith(
          width: _TileDimension.large,
          height: _TileDimension.large,
          shadows: [],
          insetShadows: [
            ShapeShadow(
                blurRadius: 10,
                spreadRadius: -3,
                color: themePalette.baseColorDarker,
                offset: const Offset(10, 10)),
            ShapeShadow(
                blurRadius: 10,
                spreadRadius: -3,
                color: themePalette.baseColorLighter,
                offset: const Offset(-10, -10)),
          ],
          textStyle: DynamicTextStyle(
            letterSpacing: 2.toPXLength,
            fontSize: 28.toPXLength,
            fontWeight: FontWeight.w700,
            fontFamily: "BalooThambi2",
            color: themePalette.tileTextColor,
          ),
        )
      });

  @override
  DynamicTextStyle get menuActiveStyle => DynamicTextStyle(
      color: themePalette.menuActiveColor, fontWeight: FontWeight.bold);

  @override
  Color get menuUnderlineColor => Colors.transparent;

  @override
  DynamicTextStyle get menuInactiveStyle =>
      DynamicTextStyle(color: themePalette.menuInactiveColor);

  @override
  String get tilePressSoundAsset => "assets/audio/neu_click.mp3";

  @override
  PuzzleLayoutDelegate get layoutDelegate => const SimplePuzzleLayoutDelegate();

  Style get _baseStyle => Style(
      alignment: Alignment.center,
      childAlignment: Alignment.center,
      //margin: EdgeInsets.all(6),
      //padding: EdgeInsets.all(6),
      backgroundDecoration: BoxDecoration(
        color: themePalette.baseColor,
      ),
      shapeBorder: RectangleShapeBorder(
        borderRadius:
            DynamicBorderRadius.all(DynamicRadius.circular(30.toPXLength)),
      ),
      shadows: [
        ShapeShadow(
            blurRadius: 15,
            spreadRadius: -3,
            color: themePalette.baseColorDarker,
            offset: const Offset(8, 8)),
        ShapeShadow(
            blurRadius: 15,
            spreadRadius: -3,
            color: themePalette.baseColorLighter,
            offset: const Offset(-8, -8)),
      ],
      textStyle: DynamicTextStyle(
        letterSpacing: 2.toPXLength,
        fontSize: 20.toPXLength,
        fontWeight: FontWeight.w700,
        fontFamily: "BalooThambi2",
        color: themePalette.tileTextColor,
      ),
      textAlign: TextAlign.center,
      mouseCursor: SystemMouseCursors.click);
}

abstract class _TileDimension {
  static Dimension small = Dimension.min(54.0.toPXLength, 100.toPercentLength);
  static Dimension medium = Dimension.min(86.0.toPXLength, 100.toPercentLength);
  static Dimension large = Dimension.min(104.0.toPXLength, 100.toPercentLength);
}

abstract class NeumorphismThemePalette {
  Color get baseColor; // alpha = 0.2
  Color get baseColorLighter; // alpha = 0.14
  Color get baseColorDarker; // alpha = 0.12

  Color get nameColor;
  Color get titleColor;
  Color get defaultColor;

  Color get tileTextColor;

  Color get menuUnderlineColor;
  Color get menuInactiveColor;
  Color get menuActiveColor;

  Color get popupMenuSliderThumbColor;
}

class NeumorphismThemePaletteLight extends NeumorphismThemePalette {
  @override
  Color get nameColor => PuzzleColors.grey1;
  @override
  Color get titleColor => const Color(0xFF535C80);
  @override
  Color get defaultColor => PuzzleColors.grey1;

  @override
  Color get baseColor => const Color(0xFFE0E0E0); // alpha = 0.2
  @override
  Color get baseColorLighter => const Color(0xFFFDFDFD); // alpha = 0.14
  @override
  Color get baseColorDarker => Colors.grey.shade400; // alpha = 0.12

  @override
  Color get tileTextColor => Colors.grey;

  @override
  Color get menuUnderlineColor => Colors.transparent;
  @override
  Color get menuInactiveColor => PuzzleColors.grey2;
  @override
  Color get menuActiveColor => const Color(0xFF535C80);

  @override
  Color get popupMenuSliderThumbColor => const Color(0xFFC0C0C0);
}

class NeumorphismThemePaletteDark extends NeumorphismThemePalette {
  @override
  Color get nameColor => Colors.white70;
  @override
  Color get titleColor => PuzzleColors.green90;
  @override
  Color get defaultColor => PuzzleColors.primary8;

  @override
  Color get baseColor => const Color(0xFF19293c); // alpha = 0.2
  @override
  Color get baseColorLighter => const Color(0xFF30404c); // alpha = 0.14
  @override
  Color get baseColorDarker => const Color(0xFF102033); // a
  @override
  Color get tileTextColor => Colors.grey.shade300;

  @override
  Color get menuUnderlineColor => Colors.transparent;
  @override
  Color get menuInactiveColor => const Color(0xFFBABABA);
  @override
  Color get menuActiveColor => Colors.white;

  @override
  Color get popupMenuSliderThumbColor => PuzzleColors.grey3;
}
