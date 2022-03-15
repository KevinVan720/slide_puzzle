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
class FluentTheme extends SimpleTheme {
  /// {@macro simple_theme}
  const FluentTheme({ThemeLuminance? luminance = ThemeLuminance.light})
      : super(luminance: luminance);

  @override
  Map<Locale, String> get name => {
        const Locale("en"): 'Fluent',
        const Locale("es"): 'Fluida',
        const Locale("zh"): "流畅"
      };

  @override
  FluentTheme copyWith({
    ThemeLuminance? luminance,
  }) {
    return FluentTheme(luminance: luminance ?? this.luminance);
  }

  FluentThemePalette get themePalette => luminance == ThemeLuminance.light
      ? FluentThemePaletteLight()
      : FluentThemePaletteDark();

  @override
  bool get hasTimer => false;

  @override
  Curve get tileMoveAnimationCurve => Curves.easeOutExpo;

  @override
  Duration get tileMoveAnimationDuration => const Duration(milliseconds: 333);

  @override
  DynamicTextStyle get nameTextStyle =>
      DynamicTextStyle(color: themePalette.nameColor);

  @override
  DynamicTextStyle get titleTextStyle => DynamicTextStyle(
        color: themePalette.titleColor,
        fontFamily: "Segoe UI",
      );

  @override
  DynamicTextStyle get defaultTextStyle => DynamicTextStyle(
        color: themePalette.defaultColor,
        fontFamily: "Segoe UI",
      );

  @override
  Responsive<Style> get backgroundStyle => Responsive({
        allScreen: Style(
            backgroundDecoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(themePalette.backgroundImage)),
                gradient: LinearGradient(colors: [
                  themePalette.backgroundColor,
                  themePalette.backgroundColor,
                  themePalette.kAmbientShadowOpacity
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter))),
      });

  @override
  Responsive<Style> get popupMenuStyle => Responsive({
        allScreen: Style(
          width: Dimension.min(240.toPXLength, 90.toPercentLength),
          backgroundDecoration: BoxDecoration(
            color: themePalette.popupMenuColor,
          ),
          shapeBorder: RectangleShapeBorder(
            border: DynamicBorderSide(
                color: themePalette.popupMenuColor.withOpacity(0.9),
                width: 0.8),
            borderRadius:
                DynamicBorderRadius.all(DynamicRadius.circular(5.toPXLength)),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          backdropFilter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
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
            textStyle: DynamicTextStyle(
              fontSize: 15.toPXLength,
              fontFamily: "Segoe UI",
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
              color: Colors.transparent,
            ),
            textStyle: DynamicTextStyle(
              fontSize: 15.toPXLength,
              fontFamily: "Segoe UI",
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
              color: Colors.transparent,
            ),
            textStyle: DynamicTextStyle(
                fontSize: 15.toPXLength,
                fontFamily: "Segoe UI",
                color: themePalette.tileTextPressedColor,
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
            mouseCursor: SystemMouseCursors.click)
      });

  @override
  Responsive<Style> get popupMenuTitleStyle => Responsive({
        allScreen: Style(
            margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 6),
            alignment: Alignment.centerLeft,
            textStyle: DynamicTextStyle(
              fontSize: 15.toPXLength,
              fontFamily: "Segoe UI",
              color: themePalette.popupMenuTitleColor,
            ))
      });

  @override
  Responsive<Style> get popupMenuTileStyle => Responsive({
        allScreen: Style(
          backgroundDecoration: BoxDecoration(
            color: themePalette.popupMenuTileColor,
          ),
          shapeBorder: RectangleShapeBorder(
            border: DynamicBorderSide(
                color: themePalette.popupMenuColor.withOpacity(0.9),
                width: 0.8),
            borderRadius:
                DynamicBorderRadius.all(DynamicRadius.circular(4.toPXLength)),
          ),
          padding: const EdgeInsets.all(5),
          margin: const EdgeInsets.symmetric(vertical: 5),
        )
      });

  @override
  Responsive<Style> get popupMenuSliderThumbStyle => Responsive({
        allScreen: Style(
          shapeBorder: CircleShapeBorder(
              border: DynamicBorderSide(
            width: 4,
            color: themePalette.popupMenuTileColor.withOpacity(1),
          )),
          backgroundDecoration: BoxDecoration(
            color: themePalette.popupMenuSliderThumbColor,
          ),
          width: 16.toPXLength,
          height: 16.toPXLength,
        )
      });

  @override
  Responsive<Style> get popupMenuSliderThumbHoverStyle => Responsive({
        allScreen: Style(
          shapeBorder: CircleShapeBorder(
              border: DynamicBorderSide(
            width: 2,
            color: themePalette.popupMenuTileColor.withOpacity(1),
          )),
          backgroundDecoration: BoxDecoration(
            color: themePalette.popupMenuSliderThumbColor,
          ),
          width: 18.toPXLength,
          height: 18.toPXLength,
        )
      });

  @override
  Responsive<Style> get popupMenuSliderThumbPressedStyle => Responsive({
        allScreen: Style(
          shapeBorder: CircleShapeBorder(
              border: DynamicBorderSide(
            width: 2,
            color: themePalette.popupMenuTileColor.withOpacity(1),
          )),
          backgroundDecoration: BoxDecoration(
            color: themePalette.popupMenuSliderThumbColor,
          ),
          width: 16.toPXLength,
          height: 16.toPXLength,
        )
      });

  @override
  Responsive<Style> get popupMenuSliderTrackStyle => Responsive({
        allScreen: Style(
          width: 88.toPercentLength,
          height: 6.toPXLength,
          backgroundDecoration: BoxDecoration(
            color: themePalette.popupMenuSliderTrackColor,
          ),
          shapeBorder: RectangleShapeBorder(
            borderRadius:
                DynamicBorderRadius.all(DynamicRadius.circular(3.toPXLength)),
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
          shapeBorder: RectangleShapeBorder(
            borderRadius:
                DynamicBorderRadius.all(DynamicRadius.circular(3.toPXLength)),
          ),
        )
      });

  @override
  bool get isPopupMenuSliderThumbContained => false;

  @override
  Responsive<Style?> get buttonStyle => Responsive({
        smallScreen: _buttonStyle.copyWith(
            textStyle: _buttonStyle.textStyle
                ?.copyWith(fontSize: _TileTextDimension.small)),
        middleScreen: _buttonStyle.copyWith(
            textStyle: _buttonStyle.textStyle
                ?.copyWith(fontSize: _TileTextDimension.medium)),
        largeScreen: _buttonStyle.copyWith(
            textStyle: _buttonStyle.textStyle
                ?.copyWith(fontSize: _TileTextDimension.large)),
      });

  @override
  Responsive<Style?> get buttonHoverStyle => Responsive({
        smallScreen: _buttonHoverStyle.copyWith(
            textStyle: _buttonHoverStyle.textStyle
                ?.copyWith(fontSize: _TileTextDimension.small)),
        middleScreen: _buttonHoverStyle.copyWith(
            textStyle: _buttonHoverStyle.textStyle
                ?.copyWith(fontSize: _TileTextDimension.medium)),
        largeScreen: _buttonHoverStyle.copyWith(
            textStyle: _buttonHoverStyle.textStyle
                ?.copyWith(fontSize: _TileTextDimension.large)),
      });

  @override
  Responsive<Style?> get buttonPressedStyle => Responsive({
        smallScreen: _buttonPressedStyle.copyWith(
          textStyle: _buttonPressedStyle.textStyle
              ?.copyWith(fontSize: _TileTextDimension.small),
          transform: SmoothMatrix4()..scale(0.95),
        ),
        middleScreen: _buttonPressedStyle.copyWith(
          textStyle: _buttonPressedStyle.textStyle
              ?.copyWith(fontSize: _TileTextDimension.medium),
          transform: SmoothMatrix4()..scale(0.95),
        ),
        largeScreen: _buttonPressedStyle.copyWith(
          textStyle: _buttonPressedStyle.textStyle
              ?.copyWith(fontSize: _TileTextDimension.large),
          transform: SmoothMatrix4()..scale(0.95),
        ),
      });

  @override
  Responsive<Style> get tileStyle => Responsive({
        smallScreen: _tileStyle.copyWith(
            width: _TileDimension.small,
            height: _TileDimension.small,
            textStyle: _tileStyle.textStyle
                ?.copyWith(fontSize: _TileTextDimension.small)),
        middleScreen: _tileStyle.copyWith(
            width: _TileDimension.medium,
            height: _TileDimension.medium,
            textStyle: _tileStyle.textStyle
                ?.copyWith(fontSize: _TileTextDimension.medium)),
        largeScreen: _tileStyle.copyWith(
            width: _TileDimension.large,
            height: _TileDimension.large,
            textStyle: _tileStyle.textStyle
                ?.copyWith(fontSize: _TileTextDimension.large)),
      });

  @override
  Responsive<Style> get tileHoverStyle => Responsive({
        smallScreen: _tileHoverStyle.copyWith(
            width: _TileDimension.small,
            height: _TileDimension.small,
            textStyle: _tileHoverStyle.textStyle
                ?.copyWith(fontSize: _TileTextDimension.small)),
        middleScreen: _tileHoverStyle.copyWith(
            width: _TileDimension.medium,
            height: _TileDimension.medium,
            textStyle: _tileHoverStyle.textStyle
                ?.copyWith(fontSize: _TileTextDimension.medium)),
        largeScreen: _tileHoverStyle.copyWith(
            width: _TileDimension.large,
            height: _TileDimension.large,
            textStyle: _tileHoverStyle.textStyle
                ?.copyWith(fontSize: _TileTextDimension.large)),
      });

  @override
  Responsive<Style> get tilePressedStyle => Responsive({
        smallScreen: _tilePressedStyle.copyWith(
            width: _TileDimension.small,
            height: _TileDimension.small,
            textStyle: _tilePressedStyle.textStyle
                ?.copyWith(fontSize: _TileTextDimension.small)),
        middleScreen: _tilePressedStyle.copyWith(
            width: _TileDimension.medium,
            height: _TileDimension.medium,
            textStyle: _tilePressedStyle.textStyle
                ?.copyWith(fontSize: _TileTextDimension.medium)),
        largeScreen: _tilePressedStyle.copyWith(
            width: _TileDimension.large,
            height: _TileDimension.large,
            textStyle: _tilePressedStyle.textStyle
                ?.copyWith(fontSize: _TileTextDimension.large)),
      });

  @override
  DynamicTextStyle get menuActiveStyle => DynamicTextStyle(
        color: themePalette.menuActiveColor,
        fontWeight: FontWeight.w700,
        fontFamily: "Segoe UI",
      );

  @override
  Color get menuUnderlineColor => themePalette.menuUnderlineColor;

  @override
  DynamicTextStyle get menuInactiveStyle => DynamicTextStyle(
        color: themePalette.menuInactiveColor,
        fontFamily: "Segoe UI",
      );

  @override
  String get tilePressSoundAsset => "assets/audio/tile_move.mp3";

  @override
  PuzzleLayoutDelegate get layoutDelegate => const SimplePuzzleLayoutDelegate();

  Style get _baseStyle => Style(
      alignment: Alignment.center,
      childAlignment: Alignment.center,
      mouseCursor: SystemMouseCursors.click);

  Style get _buttonStyle => _baseStyle.copyWith(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
        textStyle: DynamicTextStyle(
          fontFamily: "Segoe UI",
          fontSize: 24.toPXLength,
          color: themePalette.buttonTextColor,
        ),
        shapeBorder: RectangleShapeBorder(
            borderRadius: DynamicBorderRadius.all(
                DynamicRadius.circular(Length(4, unit: LengthUnit.px)))),
        backgroundDecoration: BoxDecoration(color: themePalette.buttonColor),
      );

  Style get _buttonHoverStyle => _buttonStyle.copyWith(
        backgroundDecoration:
            BoxDecoration(color: themePalette.buttonHoverColor),
      );

  Style get _buttonPressedStyle => _buttonStyle.copyWith(
        backgroundDecoration:
            BoxDecoration(color: themePalette.buttonPressedColor),
      );

  Style get _tileStyle => _baseStyle.copyWith(
        textStyle: DynamicTextStyle(
          letterSpacing: 1.toPXLength,
          fontSize: 24.toPXLength,
          fontWeight: FontWeight.w700,
          fontFamily: "Segoe UI",
          color: themePalette.tileTextColor,
        ),
        shapeBorder: RectangleShapeBorder(
            border: DynamicBorderSide(
              color: themePalette.kAmbientShadowOpacity.withOpacity(0.01),
              width: 0.1,
            ),
            borderRadius: DynamicBorderRadius.all(
                DynamicRadius.circular(Length(4, unit: LengthUnit.px)))),
        backgroundDecoration: BoxDecoration(color: themePalette.tileColor),
        backdropFilter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      );

  Style get _tileHoverStyle => _baseStyle.copyWith(
        textStyle: DynamicTextStyle(
          letterSpacing: 1.toPXLength,
          fontSize: 24.toPXLength,
          fontWeight: FontWeight.w700,
          fontFamily: "Segoe UI",
          color: themePalette.tileTextHoverColor,
        ),
        shapeBorder: RectangleShapeBorder(
            border: DynamicBorderSide(
              width: 2,
              color: themePalette.kAmbientShadowOpacity,
            ),
            borderRadius: DynamicBorderRadius.all(
                DynamicRadius.circular(Length(4, unit: LengthUnit.px)))),
        shadows: [
          ShapeShadow(
              offset: const Offset(4.0, 0.0),
              blurRadius: 10.0,
              color: themePalette.kAmbientShadowOpacity.withOpacity(0.1)),
          ShapeShadow(
              offset: const Offset(-4.0, 0.0),
              blurRadius: 10.0,
              color: themePalette.kAmbientShadowOpacity.withOpacity(0.1)),
          ShapeShadow(
              offset: const Offset(0.0, 4.0),
              blurRadius: 10.0,
              color: themePalette.kAmbientShadowOpacity.withOpacity(0.1)),
          ShapeShadow(
              offset: const Offset(0.0, -4.0),
              blurRadius: 10.0,
              color: themePalette.kAmbientShadowOpacity.withOpacity(0.1)),
          ShapeShadow(
              offset: const Offset(0.0, 0.0),
              blurRadius: 10.0,
              color: themePalette.kAmbientShadowOpacity.withOpacity(0.1)),
        ],
        backgroundDecoration: BoxDecoration(color: themePalette.tileHoverColor),
        backdropFilter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      );

  Style get _tilePressedStyle => _baseStyle.copyWith(
        textStyle: DynamicTextStyle(
          letterSpacing: 1.toPXLength,
          fontSize: 24.toPXLength,
          fontWeight: FontWeight.w700,
          fontFamily: "Segoe UI",
          color: themePalette.tileTextPressedColor,
        ),
        shapeBorder: RectangleShapeBorder(
            border: DynamicBorderSide(
              width: 2,
              color: themePalette.kAmbientShadowOpacity,
            ),
            borderRadius: DynamicBorderRadius.all(
                DynamicRadius.circular(Length(4, unit: LengthUnit.px)))),
        shadows: [
          ShapeShadow(
              offset: const Offset(5.0, 0.0),
              blurRadius: 14.0,
              color: themePalette.kAmbientShadowOpacity.withOpacity(0.1)),
          ShapeShadow(
              offset: const Offset(-5.0, 0.0),
              blurRadius: 14.0,
              color: themePalette.kAmbientShadowOpacity.withOpacity(0.1)),
          ShapeShadow(
              offset: const Offset(0.0, 5.0),
              blurRadius: 14.0,
              color: themePalette.kAmbientShadowOpacity.withOpacity(0.1)),
          ShapeShadow(
              offset: const Offset(0.0, -5.0),
              blurRadius: 14.0,
              color: themePalette.kAmbientShadowOpacity.withOpacity(0.1)),
          ShapeShadow(
              offset: const Offset(0.0, 0.0),
              blurRadius: 14.0,
              color: themePalette.kAmbientShadowOpacity.withOpacity(0.1)),
        ],
        backgroundDecoration:
            BoxDecoration(color: themePalette.tilePressedColor),
        backdropFilter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      );
}

abstract class _TileDimension {
  static Dimension small = Dimension.min(60.0.toPXLength, 100.toPercentLength);
  static Dimension medium =
      Dimension.min(100.0.toPXLength, 100.toPercentLength);
  static Dimension large = Dimension.min(112.0.toPXLength, 100.toPercentLength);
}

abstract class _TileTextDimension {
  static Dimension small = Dimension.min(20.0.toPXLength, 20.toVWLength);
  static Dimension medium = Dimension.min(28.0.toPXLength, 20.toVWLength);
  static Dimension large = Dimension.min(30.0.toPXLength, 20.toVWLength);
}

abstract class FluentThemePalette {
  String get backgroundImage;

  Color get nameColor;
  Color get titleColor;
  Color get defaultColor;

  Color get kAmbientShadowOpacity;

  Color get tileTextColor;
  Color get tileTextHoverColor;
  Color get tileTextPressedColor;

  Color get tileColor;
  Color get tileHoverColor;
  Color get tilePressedColor;

  Color get buttonTextColor;
  Color get buttonColor;
  Color get buttonHoverColor;
  Color get buttonPressedColor;

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
  Color get backgroundColor;
}

class FluentThemePaletteLight extends FluentThemePalette {
  String get backgroundImage => "assets/images/win11.jpg";

  @override
  Color get nameColor => Colors.black87;
  @override
  Color get titleColor => Color(0xFFCC4D11);
  @override
  Color get defaultColor => Color(0xFFCC4D11);

  @override
  Color get kAmbientShadowOpacity => Colors.white;
  @override
  Color get tileTextColor => Color(0xff0D2644).withOpacity(0.9);
  @override
  Color get tileTextHoverColor => Color(0xff0D2644).withOpacity(0.9);
  @override
  Color get tileTextPressedColor => Color(0xff0D2644).withOpacity(0.9);

  @override
  Color get tileColor => Colors.white.withOpacity(0.5);
  @override
  Color get tileHoverColor => Colors.white.withOpacity(0.5);
  @override
  Color get tilePressedColor => Colors.white.withOpacity(0.5);

  @override
  Color get buttonTextColor => Colors.black;
  @override
  Color get buttonColor => Color(0xFF0073CF);
  @override
  Color get buttonHoverColor => Color(0xFF3B97DF);
  @override
  Color get buttonPressedColor => Color(0xFF0055AD);

  @override
  Color get menuUnderlineColor => Colors.transparent;
  @override
  Color get menuInactiveColor => PuzzleColors.grey5;
  @override
  Color get menuActiveColor => Colors.black87;

  @override
  Color get popupMenuSliderActiveTrackColor => const Color(0xFF0073CF);
  @override
  Color get popupMenuSliderTrackColor => Colors.grey;
  @override
  Color get popupMenuSliderThumbColor => Color(0xFF0055AD);

  @override
  Color get popupMenuTileColor => Colors.white.withOpacity(0.6);
  @override
  Color get popupMenuTitleColor => Colors.black;

  @override
  Color get popupMenuUnselectedColor => Colors.black38;

  @override
  Color get popupMenuColor => Colors.white.withOpacity(0.6);
  @override
  Color get backgroundColor => Color(0xFFCFEAFF);
}

class FluentThemePaletteDark extends FluentThemePalette {
  String get backgroundImage => "assets/images/win11_dark.jpg";

  @override
  Color get nameColor => PuzzleColors.grey5;
  @override
  Color get titleColor => Color(0xFFCC4D11);
  @override
  Color get defaultColor => Color(0xFFCC4D11);

  @override
  Color get kAmbientShadowOpacity => Colors.black54;
  @override
  Color get tileTextColor => Colors.grey.shade200.withOpacity(0.9);
  @override
  Color get tileTextHoverColor => Colors.grey.shade200.withOpacity(0.9);
  @override
  Color get tileTextPressedColor => Colors.grey.shade200.withOpacity(0.9);

  @override
  Color get tileColor => Colors.black.withOpacity(0.4);
  @override
  Color get tileHoverColor => Colors.black.withOpacity(0.4);
  @override
  Color get tilePressedColor => Colors.black.withOpacity(0.4);

  @override
  Color get buttonTextColor => Colors.white.withOpacity(0.9);
  @override
  Color get buttonColor => Color(0xFF0055AD);
  @override
  Color get buttonHoverColor => Color(0xFF0073CF);
  @override
  Color get buttonPressedColor => Color(0xff00459D);

  @override
  Color get menuUnderlineColor => Colors.transparent;
  @override
  Color get menuInactiveColor => PuzzleColors.grey2;
  @override
  Color get menuActiveColor => Colors.white;

  @override
  Color get popupMenuSliderActiveTrackColor => const Color(0xFF0073CF);
  @override
  Color get popupMenuSliderTrackColor => Colors.grey;
  @override
  Color get popupMenuSliderThumbColor => Color(0xFF0055AD);

  @override
  Color get popupMenuTileColor => Colors.grey.shade900.withOpacity(0.6);
  @override
  Color get popupMenuTitleColor => Colors.white70;

  @override
  Color get popupMenuUnselectedColor => Colors.white38;

  @override
  Color get popupMenuColor => Color(0xFF121212).withOpacity(0.6);
  @override
  Color get backgroundColor => Color(0xFFCFEAFF);
}
