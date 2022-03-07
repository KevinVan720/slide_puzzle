import 'package:animated_styled_widget/animated_styled_widget.dart';
import 'package:flutter/material.dart';
import 'package:responsive_property/responsive_property.dart';
import 'package:very_good_slide_puzzle/colors/colors.dart';
import 'package:very_good_slide_puzzle/layout/layout.dart';
import 'package:very_good_slide_puzzle/simple/simple.dart';

/// {@template simple_theme}
/// The simple puzzle theme.
/// {@endtemplate}
class MaterialTheme extends SimpleTheme {
  /// {@macro simple_theme}
  const MaterialTheme() : super();

  @override
  Map<Locale, String> get name => {
        const Locale("en"): 'Material',
        const Locale("es"): 'Material',
        const Locale("zh"): "材质"
      };

  @override
  bool get hasTimer => false;

  @override
  Curve get tileMoveAnimationCurve => Curves.easeOutExpo;

  @override
  DynamicTextStyle get nameTextStyle =>
      const DynamicTextStyle(color: PuzzleColors.grey1);

  @override
  DynamicTextStyle get titleTextStyle =>
      const DynamicTextStyle(color: PuzzleColors.greenPrimary);

  @override
  DynamicTextStyle get defaultTextStyle =>
      const DynamicTextStyle(color: PuzzleColors.primary5);

  @override
  Responsive<Style> get backgroundStyle => Responsive({
        allScreen: Style(
            backgroundDecoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [PuzzleColors.grey5, PuzzleColors.grey5],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter))),
      });

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
      color: PuzzleColors.black, fontWeight: FontWeight.w800);

  @override
  Color get menuUnderlineColor => PuzzleColors.primary6;

  @override
  Color get popupMenuBackgroundColor => Colors.grey.shade100;

  @override
  DynamicTextStyle get menuInactiveStyle => const DynamicTextStyle(
        color: PuzzleColors.grey2,
      );

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
    fontSize: 28.toPXLength,
    fontWeight: FontWeight.w700,
    color: Colors.white,
  ),
  shadows: [
    const ShapeShadow(
        offset: Offset(0.0, 7.0),
        blurRadius: 8.0,
        spreadRadius: -4.0,
        color: _kKeyUmbraOpacity),
    const ShapeShadow(
        offset: Offset(0.0, 12.0),
        blurRadius: 17.0,
        spreadRadius: 2.0,
        color: _kKeyPenumbraOpacity),
    const ShapeShadow(
        offset: Offset(0.0, 5.0),
        blurRadius: 22.0,
        spreadRadius: 4.0,
        color: _kAmbientShadowOpacity),
  ],
  backgroundDecoration: const BoxDecoration(color: PuzzleColors.primary6),
);

final _hoverStyle = _baseStyle.copyWith(
  textStyle: DynamicTextStyle(
    letterSpacing: 1.toPXLength,
    fontSize: 36.toPXLength,
    fontWeight: FontWeight.w700,
    color: Colors.grey.shade50,
  ),
  shadows: [
    const ShapeShadow(
        offset: Offset(0.0, 3.0),
        blurRadius: 5.0,
        spreadRadius: -1.0,
        color: _kKeyUmbraOpacity),
    const ShapeShadow(
        offset: Offset(0.0, 6.0),
        blurRadius: 10.0,
        color: _kKeyPenumbraOpacity),
    const ShapeShadow(
        offset: Offset(0.0, 1.0),
        blurRadius: 18.0,
        color: _kAmbientShadowOpacity),
  ],
  backgroundDecoration: const BoxDecoration(color: PuzzleColors.primary5),
  transform: SmoothMatrix4()..scale(0.95),
);

final _pressedStyle = _baseStyle.copyWith(
  textStyle: DynamicTextStyle(
    letterSpacing: 1.toPXLength,
    fontSize: 36.toPXLength,
    fontWeight: FontWeight.w700,
    color: Colors.grey.shade50,
  ),
  shadows: [
    const ShapeShadow(
        offset: Offset(0.0, 3.0),
        blurRadius: 1.0,
        spreadRadius: -2.0,
        color: _kKeyUmbraOpacity),
    const ShapeShadow(
        offset: Offset(0.0, 2.0), blurRadius: 2.0, color: _kKeyPenumbraOpacity),
    const ShapeShadow(
        offset: Offset(0.0, 1.0),
        blurRadius: 5.0,
        color: _kAmbientShadowOpacity),
  ],
  backgroundDecoration: const BoxDecoration(color: PuzzleColors.primary4),
  transform: SmoothMatrix4()..scale(0.9),
);

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

const Color _kKeyUmbraOpacity = Color(0x33000000); // alpha = 0.2
const Color _kKeyPenumbraOpacity = Color(0x24000000); // alpha = 0.14
const Color _kAmbientShadowOpacity = Color(0x1F000000); // alpha = 0.12
