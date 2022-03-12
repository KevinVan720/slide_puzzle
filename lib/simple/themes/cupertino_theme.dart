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
class CupertinoTheme extends SimpleTheme {
  /// {@macro simple_theme}
  const CupertinoTheme() : super();

  @override
  Map<Locale, String> get name => {
        const Locale("en"): 'Cupertino',
        const Locale("es"): 'Cupertino',
        const Locale("zh"): "库比蒂诺"
      };

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
      color: Color(0xFFFFBD44), fontFamily: "SF-Pro-Text");

  @override
  DynamicTextStyle get defaultTextStyle => const DynamicTextStyle(
      color: Color(0xFFF5F5F5), fontFamily: "SF-Pro-Text");

  @override
  Responsive<Style> get backgroundStyle => Responsive({
        allScreen: Style(
            backgroundDecoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/macos_big_sur.jpg')))),
      });

  @override
  Responsive<Style> get popupMenuStyle => Responsive({
        allScreen: Style(
          width: Dimension.min(240.toPXLength, 90.toPercentLength),
          backgroundDecoration: BoxDecoration(
            color: Colors.white.withOpacity(0.25),
          ),
          shapeBorder: RectangleShapeBorder(
            border: const DynamicBorderSide(color: Colors.grey, width: 0.2),
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
              color: Colors.grey.shade700,
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
                color: Colors.grey.shade700,
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
            backgroundDecoration: const BoxDecoration(
              color: PuzzleColors.primary6,
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
                color: Colors.black87,
                fontWeight: FontWeight.bold,
                fontFamily: "SF-Pro-Text"))
      });

  @override
  Responsive<Style> get popupMenuTileStyle => Responsive({
        allScreen: Style(
          backgroundDecoration: BoxDecoration(
            color: Colors.white.withOpacity(0.4),
          ),
          shapeBorder: RectangleShapeBorder(
            border: const DynamicBorderSide(color: Colors.grey, width: 0.2),
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
            backgroundDecoration: const BoxDecoration(
              color: PuzzleColors.grey4,
            ),
            width: 25.toPXLength,
            height: 25.toPXLength,
            shadows: [
              const ShapeShadow(
                  offset: Offset(0.0, 3.0),
                  blurRadius: 1.0,
                  spreadRadius: -2.0,
                  color: _kKeyUmbraOpacity),
              const ShapeShadow(
                  offset: Offset(0.0, 2.0),
                  blurRadius: 2.0,
                  color: _kKeyPenumbraOpacity),
              const ShapeShadow(
                  offset: Offset(0.0, 1.0),
                  blurRadius: 5.0,
                  color: _kAmbientShadowOpacity),
              const ShapeShadow(
                  offset: Offset(0.0, -1.0),
                  blurRadius: 5.0,
                  color: _kAmbientShadowOpacity),
              const ShapeShadow(
                  offset: Offset(1.0, 0.0),
                  blurRadius: 5.0,
                  color: _kAmbientShadowOpacity),
              const ShapeShadow(
                  offset: Offset(-1.0, 0.0),
                  blurRadius: 5.0,
                  color: _kAmbientShadowOpacity),
            ])
      });

  @override
  Responsive<Style> get popupMenuSliderTrackStyle => Responsive({
        allScreen: Style(
          width: 80.toPercentLength,
          height: 25.toPXLength,
          margin: const EdgeInsets.symmetric(vertical: 5),
          backgroundDecoration: BoxDecoration(
            color: Colors.grey.shade500.withOpacity(0.3),
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
          backgroundDecoration: const BoxDecoration(
            color: PuzzleColors.grey5,
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
  bool get isLogoColored => true;

  @override
  DynamicTextStyle get menuActiveStyle => const DynamicTextStyle(
      color: PuzzleColors.black,
      fontWeight: FontWeight.w800,
      fontFamily: "SF-Pro-Text");

  @override
  Color get menuUnderlineColor => PuzzleColors.primary6;

  @override
  DynamicTextStyle get menuInactiveStyle => const DynamicTextStyle(
      color: PuzzleColors.grey5, fontFamily: "SF-Pro-Text");

  @override
  String get tilePressSoundAsset => "assets/audio/material_click.mp3";

  @override
  PuzzleLayoutDelegate get layoutDelegate => const SimplePuzzleLayoutDelegate();
}

final _baseStyle = Style(
    alignment: Alignment.center,
    childAlignment: Alignment.center,
    backgroundDecoration: const BoxDecoration(color: PuzzleColors.primary6),
    shapeBorder: const RoundedRectangleShapeBorder(
        borderRadius: DynamicBorderRadius.all(
            DynamicRadius.circular(Length(10, unit: LengthUnit.px)))),
    mouseCursor: SystemMouseCursors.click);

final _buttonStyle = _baseStyle.copyWith(
  textStyle: DynamicTextStyle(
      letterSpacing: 1.toPXLength,
      fontSize: 24.toPXLength,
      fontWeight: FontWeight.w700,
      color: Colors.white,
      fontFamily: "SF-Pro-Text"),
  backgroundDecoration: const BoxDecoration(color: PuzzleColors.primary6),
);

final _hoverStyle = _baseStyle.copyWith(
  textStyle: DynamicTextStyle(
      letterSpacing: 1.toPXLength,
      fontSize: 24.toPXLength,
      fontWeight: FontWeight.w700,
      color: Colors.white,
      fontFamily: "SF-Pro-Text"),
  backgroundDecoration: const BoxDecoration(color: PuzzleColors.primary6),
);

final _pressedStyle = _baseStyle.copyWith(
  textStyle: DynamicTextStyle(
      letterSpacing: 1.toPXLength,
      fontSize: 24.toPXLength,
      fontWeight: FontWeight.w700,
      color: Colors.white,
      fontFamily: "SF-Pro-Text"),
  backgroundDecoration: const BoxDecoration(color: PuzzleColors.primary8),
);

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

const Color _kKeyUmbraOpacity = Color(0x33000000); // alpha = 0.2
const Color _kKeyPenumbraOpacity = Color(0x24000000); // alpha = 0.14
const Color _kAmbientShadowOpacity = Color(0x1F000000); // alpha = 0.12
