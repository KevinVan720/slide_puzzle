import 'dart:ui';

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
class CupertinoTheme extends SimpleTheme {
  /// {@macro simple_theme}
  const CupertinoTheme({ThemeLuminance? luminance = ThemeLuminance.light})
      : super(luminance: luminance);

  @override
  Map<Locale, String> get name => {
        const Locale("en"): 'Cupertino',
        const Locale("es"): 'Cupertino',
        const Locale("zh"): "库比蒂诺"
      };

  @override
  CupertinoTheme copyWith({
    ThemeLuminance? luminance,
  }) {
    return CupertinoTheme(luminance: luminance ?? this.luminance);
  }

  CupertinoThemePalette get themePalette => luminance == ThemeLuminance.light
      ? CupertinoThemePaletteLight()
      : CupertinoThemePaletteDark();

  @override
  double get backgroundAnimationScale => 2;
  @override
  double get backgroundAnimationPeriodScale => 15;

  @override
  bool get hasTimer => false;

  @override
  bool get useCupertinoIndicator => true;

  @override
  Curve get tileMoveAnimationCurve => Curves.easeOutExpo;

  @override
  Duration get tileMoveAnimationDuration => const Duration(milliseconds: 333);

  @override
  DynamicTextStyle get nameTextStyle => const DynamicTextStyle(
      color: Color(0xFFE1DFE1), fontFamily: "SF-Pro-Text");

  @override
  DynamicTextStyle get titleTextStyle => const DynamicTextStyle(
      color: Color(0xFFFFBD44),
      fontFamily: "SF-Pro-Text",
      fontWeight: FontWeight.bold);

  @override
  DynamicTextStyle get defaultTextStyle => const DynamicTextStyle(
      color: Color(0xFFF5F5F5), fontFamily: "SF-Pro-Text");

  /*@override
  Responsive<Style> get backgroundStyle {
    int index = DateTime.now().millisecondsSinceEpoch % 16 + 1;

    return Responsive({
      allScreen: Style(
          backgroundDecoration: BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
                "assets/images/mojave_dynamic_" + index.toString() + ".jpeg")),
      )),
    });
  }*/
  @override
  Responsive<Style> get backgroundStyle => Responsive({
        allScreen: Style(
            backgroundDecoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(themePalette.backgroundImage)))),
      });

  @override
  Responsive<Style> get popupMenuStyle => Responsive({
        allScreen: Style(
          margin: const EdgeInsets.all(10),
          width: Dimension.min(240.toPXLength, 90.toPercentLength),
          backgroundDecoration: BoxDecoration(
            color: themePalette.popupMenuColor,
          ),
          shapeBorder: RectangleShapeBorder(
            border: const DynamicBorderSide(color: Colors.grey, width: 0.1),
            borderRadius:
                DynamicBorderRadius.all(DynamicRadius.circular(15.toPXLength)),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          backdropFilter: ImageFilter.blur(sigmaX: 8, sigmaY: 18),
        )
      });

  @override
  Responsive<Style> get popupMenuButtonStyle => Responsive({
        allScreen: Style(
            alignment: Alignment.center,
            childAlignment: Alignment.center,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            padding: const EdgeInsets.all(2),
            shapeBorder: RectangleShapeBorder(
              borderRadius:
                  DynamicBorderRadius.all(DynamicRadius.circular(5.toPXLength)),
            ),
            textStyle: DynamicTextStyle(
              fontSize: 16.toPXLength,
              color: themePalette.popupMenuUnselectedColor,
              fontFamily: "SF-Pro-Text",
            ),
            textAlign: TextAlign.center,
            mouseCursor: SystemMouseCursors.click)
      });

  @override
  Responsive<Style> get popupMenuHoverStyle => Responsive({
        allScreen: Style(
            alignment: Alignment.center,
            childAlignment: Alignment.center,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            padding: const EdgeInsets.all(2),
            shapeBorder: RectangleShapeBorder(
              borderRadius:
                  DynamicBorderRadius.all(DynamicRadius.circular(5.toPXLength)),
            ),
            textStyle: DynamicTextStyle(
                fontSize: 16.toPXLength,
                color: themePalette.popupMenuUnselectedColor,
                fontFamily: "SF-Pro-Text"),
            textAlign: TextAlign.center,
            mouseCursor: SystemMouseCursors.click)
      });

  @override
  Responsive<Style> get popupMenuPressedStyle => Responsive({
        allScreen: Style(
            alignment: Alignment.center,
            childAlignment: Alignment.center,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            padding: const EdgeInsets.all(2),
            backgroundDecoration: BoxDecoration(
              color: themePalette.tileColor,
            ),
            shapeBorder: RectangleShapeBorder(
              borderRadius:
                  DynamicBorderRadius.all(DynamicRadius.circular(5.toPXLength)),
            ),
            textStyle: DynamicTextStyle(
                fontSize: 16.toPXLength,
                color: Colors.white,
                fontFamily: "SF-Pro-Text"),
            textAlign: TextAlign.center,
            mouseCursor: SystemMouseCursors.click)
      });

  @override
  Responsive<Style> get popupMenuTitleStyle => Responsive({
        allScreen: Style(
            margin: const EdgeInsets.all(4),
            alignment: Alignment.centerLeft,
            textStyle: DynamicTextStyle(
                fontSize: 14.toPXLength,
                color: themePalette.popupMenuTitleColor,
                fontWeight: FontWeight.bold,
                fontFamily: "SF-Pro-Text"))
      });

  @override
  Responsive<Style> get popupMenuTileStyle => Responsive({
        allScreen: Style(
          backgroundDecoration: BoxDecoration(
            color: themePalette.popupMenuTileColor,
          ),
          shapeBorder: RectangleShapeBorder(
            borderRadius:
                DynamicBorderRadius.all(DynamicRadius.circular(12.toPXLength)),
          ),
          padding: const EdgeInsets.all(5),
          margin: const EdgeInsets.symmetric(vertical: 5),
        )
      });

  @override
  Responsive<Style> get popupMenuSliderThumbStyle => Responsive({
        allScreen: Style(
            shapeBorder: const CircleShapeBorder(),
            backgroundDecoration: BoxDecoration(
              color: themePalette.popupMenuSliderThumbColor,
            ),
            width: 25.toPXLength,
            height: 25.toPXLength,
            shadows: [
              ShapeShadow(
                  offset: const Offset(0.0, 1.0),
                  blurRadius: 2.0,
                  color: themePalette.kAmbientShadowOpacity),
              ShapeShadow(
                  offset: const Offset(0.0, -1.0),
                  blurRadius: 2.0,
                  color: themePalette.kAmbientShadowOpacity),
              ShapeShadow(
                  offset: const Offset(1.0, 0.0),
                  blurRadius: 2.0,
                  color: themePalette.kAmbientShadowOpacity),
              ShapeShadow(
                  offset: const Offset(-1.0, 0.0),
                  blurRadius: 2.0,
                  color: themePalette.kAmbientShadowOpacity),
            ])
      });

  @override
  Responsive<Style> get popupMenuSliderTrackStyle => Responsive({
        allScreen: Style(
          width: 80.toPercentLength,
          height: 25.toPXLength,
          margin: const EdgeInsets.symmetric(vertical: 5),
          backgroundDecoration: BoxDecoration(
            color: themePalette.popupMenuSliderTrackColor,
          ),
          shapeBorder: RectangleShapeBorder(
            border: const DynamicBorderSide(color: Colors.black45, width: 0.5),
            borderRadius:
                DynamicBorderRadius.all(DynamicRadius.circular(20.toPXLength)),
          ),
        )
      });

  @override
  Responsive<Style> get popupMenuSliderActiveTrackStyle => Responsive({
        allScreen: Style(
          height: 24.toPXLength,
          backgroundDecoration: BoxDecoration(
            color: themePalette.popupMenuSliderActiveTrackColor,
          ),
          shapeBorder: RectangleShapeBorder(
            borderRadius:
                DynamicBorderRadius.all(DynamicRadius.circular(20.toPXLength)),
          ),
        )
      });

  @override
  bool get isPopupMenuSliderThumbContained => true;

  @override
  Responsive<Style> get buttonStyle => Responsive({
        smallScreen: _buttonStyle.copyWith(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.all(12),
            textStyle: _buttonStyle.textStyle
                ?.copyWith(fontSize: _TileTextDimension.small)),
        middleScreen: _buttonStyle.copyWith(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.all(12),
            textStyle: _buttonStyle.textStyle
                ?.copyWith(fontSize: _TileTextDimension.medium)),
        largeScreen: _buttonStyle.copyWith(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.all(12),
            textStyle: _buttonStyle.textStyle
                ?.copyWith(fontSize: _TileTextDimension.large)),
      });

  @override
  Responsive<Style> get buttonHoverStyle => Responsive({
        smallScreen: _hoverStyle.copyWith(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.all(12),
            textStyle: _hoverStyle.textStyle
                ?.copyWith(fontSize: _TileTextDimension.small)),
        middleScreen: _hoverStyle.copyWith(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.all(12),
            textStyle: _hoverStyle.textStyle
                ?.copyWith(fontSize: _TileTextDimension.medium)),
        largeScreen: _hoverStyle.copyWith(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.all(12),
            textStyle: _hoverStyle.textStyle
                ?.copyWith(fontSize: _TileTextDimension.large)),
      });

  @override
  Responsive<Style> get buttonPressedStyle => Responsive({
        smallScreen: _pressedStyle.copyWith(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.all(12),
            textStyle: _pressedStyle.textStyle
                ?.copyWith(fontSize: _TileTextDimension.small)),
        middleScreen: _pressedStyle.copyWith(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.all(12),
            textStyle: _pressedStyle.textStyle
                ?.copyWith(fontSize: _TileTextDimension.medium)),
        largeScreen: _pressedStyle.copyWith(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.all(12),
            textStyle: _pressedStyle.textStyle
                ?.copyWith(fontSize: _TileTextDimension.large)),
      });

  @override
  Responsive<Style> get tileStyle => Responsive({
        smallScreen: _buttonStyle.copyWith(
            width: _TileDimension.small,
            height: _TileDimension.small,
            textStyle: _buttonStyle.textStyle
                ?.copyWith(fontSize: _TileTextDimension.small)),
        middleScreen: _buttonStyle.copyWith(
            width: _TileDimension.medium,
            height: _TileDimension.medium,
            textStyle: _buttonStyle.textStyle
                ?.copyWith(fontSize: _TileTextDimension.medium)),
        largeScreen: _buttonStyle.copyWith(
            width: _TileDimension.large,
            height: _TileDimension.large,
            textStyle: _buttonStyle.textStyle
                ?.copyWith(fontSize: _TileTextDimension.large)),
      });

  @override
  Responsive<Style> get tileHoverStyle => Responsive({
        smallScreen: _hoverStyle.copyWith(
            width: _TileDimension.small,
            height: _TileDimension.small,
            textStyle: _hoverStyle.textStyle
                ?.copyWith(fontSize: _TileTextDimension.small)),
        middleScreen: _hoverStyle.copyWith(
            width: _TileDimension.medium,
            height: _TileDimension.medium,
            textStyle: _hoverStyle.textStyle
                ?.copyWith(fontSize: _TileTextDimension.medium)),
        largeScreen: _hoverStyle.copyWith(
            width: _TileDimension.large,
            height: _TileDimension.large,
            textStyle: _hoverStyle.textStyle
                ?.copyWith(fontSize: _TileTextDimension.large)),
      });

  @override
  Responsive<Style> get tilePressedStyle => Responsive({
        smallScreen: _pressedStyle.copyWith(
            width: _TileDimension.small,
            height: _TileDimension.small,
            textStyle: _pressedStyle.textStyle
                ?.copyWith(fontSize: _TileTextDimension.small)),
        middleScreen: _pressedStyle.copyWith(
            width: _TileDimension.medium,
            height: _TileDimension.medium,
            textStyle: _pressedStyle.textStyle
                ?.copyWith(fontSize: _TileTextDimension.medium)),
        largeScreen: _pressedStyle.copyWith(
            width: _TileDimension.large,
            height: _TileDimension.large,
            textStyle: _pressedStyle.textStyle
                ?.copyWith(fontSize: _TileTextDimension.large)),
      });

  @override
  DynamicTextStyle get menuActiveStyle => DynamicTextStyle(
      color: themePalette.menuActiveColor,
      fontWeight: FontWeight.w800,
      fontFamily: "SF-Pro-Text");

  @override
  Color get menuUnderlineColor => themePalette.menuUnderlineColor;

  @override
  DynamicTextStyle get menuInactiveStyle => DynamicTextStyle(
      color: themePalette.menuInactiveColor, fontFamily: "SF-Pro-Text");

  @override
  String get tilePressSoundAsset => "assets/audio/material_click.mp3";

  @override
  PuzzleLayoutDelegate get layoutDelegate => const SimplePuzzleLayoutDelegate();

  Style get _baseStyle => Style(
      alignment: Alignment.center,
      childAlignment: Alignment.center,
      shapeBorder: const RoundedRectangleShapeBorder(
          borderRadius: DynamicBorderRadius.all(
              DynamicRadius.circular(Length(10, unit: LengthUnit.px)))),
      mouseCursor: SystemMouseCursors.click);

  Style get _buttonStyle => _baseStyle.copyWith(
        textStyle: DynamicTextStyle(
            letterSpacing: 1.toPXLength,
            fontSize: 24.toPXLength,
            fontWeight: FontWeight.w700,
            color: themePalette.tileTextColor,
            fontFamily: "SF-Pro-Text"),
        backgroundDecoration: BoxDecoration(color: themePalette.tileColor),
      );

  Style get _hoverStyle => _baseStyle.copyWith(
        textStyle: DynamicTextStyle(
            letterSpacing: 1.toPXLength,
            fontSize: 24.toPXLength,
            fontWeight: FontWeight.w700,
            color: themePalette.tileTextHoverColor,
            fontFamily: "SF-Pro-Text"),
        backgroundDecoration: BoxDecoration(color: themePalette.tileHoverColor),
      );

  Style get _pressedStyle => _baseStyle.copyWith(
        textStyle: DynamicTextStyle(
            letterSpacing: 1.toPXLength,
            fontSize: 24.toPXLength,
            fontWeight: FontWeight.w700,
            color: themePalette.tileTextPressedColor,
            fontFamily: "SF-Pro-Text"),
        backgroundDecoration:
            BoxDecoration(color: themePalette.tilePressedColor),
      );
}

abstract class _TileDimension {
  static Dimension small = Dimension.min(50.0.toPXLength, 100.toPercentLength);
  static Dimension medium = Dimension.min(70.0.toPXLength, 100.toPercentLength);
  static Dimension large = Dimension.min(90.0.toPXLength, 100.toPercentLength);
}

abstract class _TileTextDimension {
  static Dimension small = Dimension.min(20.0.toPXLength, 20.toVWLength);
  static Dimension medium = Dimension.min(24.0.toPXLength, 20.toVWLength);
  static Dimension large = Dimension.min(28.0.toPXLength, 20.toVWLength);
}

abstract class CupertinoThemePalette {
  String get backgroundImage;

  Color get kKeyUmbraOpacity; // alpha = 0.2
  Color get kKeyPenumbraOpacity; // alpha = 0.14
  Color get kAmbientShadowOpacity; // alpha = 0.12

  Color get nameColor;
  Color get titleColor;
  Color get defaultColor;

  Color get tileTextColor;
  Color get tileTextHoverColor;
  Color get tileTextPressedColor;

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

class CupertinoThemePaletteLight extends CupertinoThemePalette {
  @override
  String get backgroundImage => "assets/images/Mojave Day.jpg";

  @override
  Color get nameColor => PuzzleColors.grey1;
  @override
  Color get titleColor => PuzzleColors.green50;
  @override
  Color get defaultColor => PuzzleColors.primary6;

  @override
  Color get kKeyUmbraOpacity => const Color(0x33000000); // alpha = 0.2
  @override
  Color get kKeyPenumbraOpacity => const Color(0x24000000); // alpha = 0.14
  @override
  Color get kAmbientShadowOpacity => const Color(0x1F000000); // alpha = 0.12

  @override
  Color get tileTextColor => Colors.white;
  @override
  Color get tileTextHoverColor => Colors.white;
  @override
  Color get tileTextPressedColor => Colors.white;

  @override
  Color get tileColor => PuzzleColors.primary6;
  @override
  Color get tileHoverColor => PuzzleColors.primary6;
  @override
  Color get tilePressedColor => PuzzleColors.primary8;

  @override
  Color get menuUnderlineColor => Colors.transparent;
  @override
  Color get menuInactiveColor => PuzzleColors.grey3;
  @override
  Color get menuActiveColor => Colors.black87;

  @override
  Color get popupMenuSliderActiveTrackColor => PuzzleColors.grey5;
  @override
  Color get popupMenuSliderTrackColor => Colors.grey.shade500.withOpacity(0.3);
  @override
  Color get popupMenuSliderThumbColor => PuzzleColors.grey4;

  @override
  Color get popupMenuTileColor => Colors.white.withOpacity(0.4);
  @override
  Color get popupMenuTitleColor => Colors.black87;

  @override
  Color get popupMenuUnselectedColor => Colors.grey.shade700;

  @override
  Color get popupMenuColor => Colors.white.withOpacity(0.25);
}

class CupertinoThemePaletteDark extends CupertinoThemePalette {
  @override
  String get backgroundImage => "assets/images/Mojave Night.jpg";

  @override
  Color get nameColor => Colors.white70;
  @override
  Color get titleColor => PuzzleColors.green50;
  @override
  Color get defaultColor => PuzzleColors.primary6;

  @override
  Color get kKeyUmbraOpacity => const Color(0x33000000); // alpha = 0.2
  @override
  Color get kKeyPenumbraOpacity => const Color(0x24000000); // alpha = 0.14
  @override
  Color get kAmbientShadowOpacity => const Color(0x1F000000); //alpha = 0.12
  @override
  Color get tileTextColor => Colors.grey.shade100;
  @override
  Color get tileTextHoverColor => Colors.grey.shade100;
  @override
  Color get tileTextPressedColor => Colors.grey.shade100;

  @override
  Color get tileColor => PuzzleColors.primary3;
  @override
  Color get tileHoverColor => PuzzleColors.primary3;
  @override
  Color get tilePressedColor => PuzzleColors.primary4;

  @override
  Color get menuUnderlineColor => Colors.transparent;
  @override
  Color get menuInactiveColor => const Color(0xFFBABABA);
  @override
  Color get menuActiveColor => Colors.white;

  @override
  Color get popupMenuSliderActiveTrackColor =>
      PuzzleColors.grey3.withOpacity(0.9);
  @override
  Color get popupMenuSliderTrackColor => const Color(0xFF3a3a3a);
  @override
  Color get popupMenuSliderThumbColor => PuzzleColors.grey3;

  @override
  Color get popupMenuTileColor => const Color(0xFF3e3e3e);
  @override
  Color get popupMenuTitleColor => const Color(0xFFFAFAFA);

  @override
  Color get popupMenuUnselectedColor => Colors.white70;

  @override
  Color get popupMenuColor => const Color(0xFF252525);
}
