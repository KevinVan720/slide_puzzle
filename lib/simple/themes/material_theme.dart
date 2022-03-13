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
class MaterialTheme extends SimpleTheme {
  /// {@macro simple_theme}
  const MaterialTheme({ThemeLuminance? luminance = ThemeLuminance.light})
      : super(luminance: luminance);

  @override
  Map<Locale, String> get name => {
        const Locale("en"): 'Material',
        const Locale("es"): 'Material',
        const Locale("zh"): "材质"
      };

  @override
  MaterialTheme copyWith({
    ThemeLuminance? luminance,
  }) {
    return MaterialTheme(luminance: luminance ?? this.luminance);
  }

  MaterialThemePalette get themePalette => luminance == ThemeLuminance.light
      ? MaterialThemePaletteLight()
      : MaterialThemePaletteDark();

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
  DynamicTextStyle get titleTextStyle =>
      DynamicTextStyle(color: themePalette.titleColor);

  @override
  DynamicTextStyle get defaultTextStyle =>
      DynamicTextStyle(color: themePalette.defaultColor);

  @override
  Responsive<Style> get backgroundStyle => Responsive({
        allScreen: Style(
            backgroundDecoration: BoxDecoration(
                gradient: LinearGradient(colors: [
          themePalette.backgroundColor,
          themePalette.backgroundColor
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
            border: const DynamicBorderSide(color: Colors.grey, width: 0.2),
            borderRadius:
                DynamicBorderRadius.all(DynamicRadius.circular(5.toPXLength)),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          shadows: [
            ShapeShadow(
                offset: const Offset(0.0, 3.0),
                blurRadius: 1.0,
                spreadRadius: -2.0,
                color: themePalette.kKeyUmbraOpacity),
            ShapeShadow(
                offset: const Offset(0.0, 2.0),
                blurRadius: 2.0,
                color: themePalette.kKeyPenumbraOpacity),
            ShapeShadow(
                offset: const Offset(0.0, 1.0),
                blurRadius: 5.0,
                color: themePalette.kAmbientShadowOpacity),
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
            backgroundDecoration: const BoxDecoration(
              color: Colors.transparent,
            ),
            shapeBorder: RectangleShapeBorder(
              borderRadius:
                  DynamicBorderRadius.all(DynamicRadius.circular(5.toPXLength)),
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
              color: themePalette.tilePressedColor.withOpacity(0.25),
            ),
            shapeBorder: RectangleShapeBorder(
              borderRadius:
                  DynamicBorderRadius.all(DynamicRadius.circular(5.toPXLength)),
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
              color: themePalette.tilePressedColor,
            ),
            shapeBorder: RectangleShapeBorder(
              borderRadius:
                  DynamicBorderRadius.all(DynamicRadius.circular(5.toPXLength)),
            ),
            textStyle: DynamicTextStyle(
              fontSize: 16.toPXLength,
              color: themePalette.tileTextPressedColor,
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
              fontWeight: FontWeight.bold,
            ))
      });

  @override
  Responsive<Style> get popupMenuTileStyle => Responsive({
        allScreen: Style(
          backgroundDecoration: BoxDecoration(
            color: themePalette.popupMenuTileColor,
          ),
          shapeBorder: RectangleShapeBorder(
            border: const DynamicBorderSide(color: Colors.grey, width: 0.2),
            borderRadius:
                DynamicBorderRadius.all(DynamicRadius.circular(8.toPXLength)),
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
            width: 20.toPXLength,
            height: 20.toPXLength,
            shadows: [
              ShapeShadow(
                  offset: const Offset(0.0, 3.0),
                  blurRadius: 1.0,
                  spreadRadius: -2.0,
                  color: themePalette.kKeyUmbraOpacity),
              ShapeShadow(
                  offset: const Offset(0.0, 2.0),
                  blurRadius: 2.0,
                  color: themePalette.kKeyPenumbraOpacity),
              ShapeShadow(
                  offset: const Offset(0.0, 1.0),
                  blurRadius: 5.0,
                  color: themePalette.kAmbientShadowOpacity),
            ])
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
  Responsive<Style> get buttonStyle => Responsive({
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
  Responsive<Style> get hoverStyle => Responsive({
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
  Responsive<Style> get pressedStyle => Responsive({
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
      color: themePalette.menuActiveColor, fontWeight: FontWeight.w800);

  @override
  Color get menuUnderlineColor => themePalette.menuUnderlineColor;

  @override
  DynamicTextStyle get menuInactiveStyle =>
      DynamicTextStyle(color: themePalette.menuInactiveColor);

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
          fontSize: 28.toPXLength,
          fontWeight: FontWeight.w700,
          color: themePalette.tileTextColor,
        ),
        shadows: [
          ShapeShadow(
              offset: const Offset(0.0, 7.0),
              blurRadius: 8.0,
              spreadRadius: -4.0,
              color: themePalette.kKeyUmbraOpacity),
          ShapeShadow(
              offset: const Offset(0.0, 12.0),
              blurRadius: 17.0,
              spreadRadius: 2.0,
              color: themePalette.kKeyPenumbraOpacity),
          ShapeShadow(
              offset: const Offset(0.0, 5.0),
              blurRadius: 22.0,
              spreadRadius: 4.0,
              color: themePalette.kAmbientShadowOpacity),
        ],
        backgroundDecoration: BoxDecoration(color: themePalette.tileColor),
      );

  Style get _hoverStyle => _baseStyle.copyWith(
        textStyle: DynamicTextStyle(
          letterSpacing: 1.toPXLength,
          fontSize: 36.toPXLength,
          fontWeight: FontWeight.w700,
          color: themePalette.tileTextHoverColor,
        ),
        shadows: [
          ShapeShadow(
              offset: const Offset(0.0, 3.0),
              blurRadius: 5.0,
              spreadRadius: -1.0,
              color: themePalette.kKeyUmbraOpacity),
          ShapeShadow(
              offset: const Offset(0.0, 6.0),
              blurRadius: 10.0,
              color: themePalette.kKeyPenumbraOpacity),
          ShapeShadow(
              offset: const Offset(0.0, 1.0),
              blurRadius: 18.0,
              color: themePalette.kAmbientShadowOpacity),
        ],
        backgroundDecoration: BoxDecoration(color: themePalette.tileHoverColor),
        transform: SmoothMatrix4()..scale(0.95),
      );

  Style get _pressedStyle => _baseStyle.copyWith(
        textStyle: DynamicTextStyle(
          letterSpacing: 1.toPXLength,
          fontSize: 36.toPXLength,
          fontWeight: FontWeight.w700,
          color: themePalette.tileTextPressedColor,
        ),
        shadows: [
          ShapeShadow(
              offset: const Offset(0.0, 3.0),
              blurRadius: 1.0,
              spreadRadius: -2.0,
              color: themePalette.kKeyUmbraOpacity),
          ShapeShadow(
              offset: const Offset(0.0, 2.0),
              blurRadius: 2.0,
              color: themePalette.kKeyPenumbraOpacity),
          ShapeShadow(
              offset: const Offset(0.0, 1.0),
              blurRadius: 5.0,
              color: themePalette.kAmbientShadowOpacity),
        ],
        backgroundDecoration:
            BoxDecoration(color: themePalette.tilePressedColor),
        transform: SmoothMatrix4()..scale(0.9),
      );
}

abstract class _TileDimension {
  static Dimension small = Dimension.min(60.0.toPXLength, 100.toPercentLength);
  static Dimension medium =
      Dimension.min(100.0.toPXLength, 100.toPercentLength);
  static Dimension large = Dimension.min(112.0.toPXLength, 100.toPercentLength);
}

abstract class _TileTextDimension {
  static Dimension small = Dimension.min(24.0.toPXLength, 20.toVWLength);
  static Dimension medium = Dimension.min(36.0.toPXLength, 20.toVWLength);
  static Dimension large = Dimension.min(42.0.toPXLength, 20.toVWLength);
}

abstract class MaterialThemePalette {
  Color get nameColor;
  Color get titleColor;
  Color get defaultColor;

  Color get kKeyUmbraOpacity; // alpha = 0.2
  Color get kKeyPenumbraOpacity; // alpha = 0.14
  Color get kAmbientShadowOpacity; // alpha = 0.12
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
  Color get backgroundColor;
}

class MaterialThemePaletteLight extends MaterialThemePalette {
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
  Color get tileTextHoverColor => Colors.grey.shade50;
  @override
  Color get tileTextPressedColor => Colors.grey.shade50;

  @override
  Color get tileColor => PuzzleColors.primary6;
  @override
  Color get tileHoverColor => PuzzleColors.primary5;
  @override
  Color get tilePressedColor => PuzzleColors.primary4;

  @override
  Color get menuUnderlineColor => PuzzleColors.primary6;
  @override
  Color get menuInactiveColor => PuzzleColors.grey2;
  @override
  Color get menuActiveColor => Colors.black87;

  @override
  Color get popupMenuSliderActiveTrackColor => PuzzleColors.primary6;
  @override
  Color get popupMenuSliderTrackColor => PuzzleColors.primary9;
  @override
  Color get popupMenuSliderThumbColor => PuzzleColors.primary5;

  @override
  Color get popupMenuTileColor => const Color(0xFFFAFAFA);
  @override
  Color get popupMenuTitleColor => PuzzleColors.primary5;

  @override
  Color get popupMenuUnselectedColor => Colors.grey.shade700;

  @override
  Color get popupMenuColor => Colors.white;
  @override
  Color get backgroundColor => Colors.grey.shade50;
}

class MaterialThemePaletteDark extends MaterialThemePalette {
  @override
  Color get nameColor => Colors.white70;
  @override
  Color get titleColor => PuzzleColors.green50;
  @override
  Color get defaultColor => PuzzleColors.primary6;

  @override
  Color get kKeyUmbraOpacity => const Color(0x33555555); // alpha = 0.2
  @override
  Color get kKeyPenumbraOpacity => const Color(0x24555555); // alpha = 0.14
  @override
  Color get kAmbientShadowOpacity => const Color(0x01555555); // alpha = 0.12
  @override
  Color get tileTextColor => Colors.grey.shade100;
  @override
  Color get tileTextHoverColor => Colors.grey.shade200;
  @override
  Color get tileTextPressedColor => Colors.grey.shade200;

  @override
  Color get tileColor => PuzzleColors.primary2;
  @override
  Color get tileHoverColor => PuzzleColors.primary3;
  @override
  Color get tilePressedColor => PuzzleColors.primary4;

  @override
  Color get menuUnderlineColor => PuzzleColors.primary9;
  @override
  Color get menuInactiveColor => const Color(0xFF6A6A6A);
  @override
  Color get menuActiveColor => Colors.white;

  @override
  Color get popupMenuSliderActiveTrackColor => PuzzleColors.primary4;
  @override
  Color get popupMenuSliderTrackColor => PuzzleColors.primary6;
  @override
  Color get popupMenuSliderThumbColor => PuzzleColors.primary3;

  @override
  Color get popupMenuTileColor => const Color(0xFF222222);
  @override
  Color get popupMenuTitleColor => const Color(0xFFFAFAFA);

  @override
  Color get popupMenuUnselectedColor => Colors.white70;

  @override
  Color get popupMenuColor => const Color(0xFF1e1e1e);
  @override
  Color get backgroundColor => const Color(0xFF121212);
}
