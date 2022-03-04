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
            backgroundDecoration:
                const BoxDecoration(color: PuzzleColors.grey5)),
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
    fontWeight: FontWeight.w400,
    color: Colors.white,
  ),
  backgroundDecoration: const BoxDecoration(color: PuzzleColors.primary6),
);

final _hoverStyle = _baseStyle.copyWith(
  textStyle: DynamicTextStyle(
    letterSpacing: 1.toPXLength,
    fontSize: 36.toPXLength,
    fontWeight: FontWeight.w700,
    color: Colors.grey.shade50,
  ),
  backgroundDecoration: const BoxDecoration(color: PuzzleColors.primary5),
);

final _pressedStyle = _baseStyle.copyWith(
  textStyle: DynamicTextStyle(
    letterSpacing: 1.toPXLength,
    fontSize: 36.toPXLength,
    fontWeight: FontWeight.w900,
    color: Colors.grey.shade50,
  ),
  backgroundDecoration: const BoxDecoration(color: PuzzleColors.primary4),
);

abstract class _TileDimension {
  static Dimension small = Dimension.min(72.0.toPXLength, 100.toPercentLength);
  static Dimension medium =
      Dimension.min(100.0.toPXLength, 100.toPercentLength);
  static Dimension large = Dimension.min(112.0.toPXLength, 100.toPercentLength);
}

abstract class _TileTextDimension {
  static Dimension small = Dimension.min(28.0.toPXLength, 20.toVWLength);
  static Dimension medium = Dimension.min(36.0.toPXLength, 20.toVWLength);
  static Dimension large = Dimension.min(42.0.toPXLength, 20.toVWLength);
}
