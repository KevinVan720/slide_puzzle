import 'package:animated_styled_widget/animated_styled_widget.dart';

import 'package:flutter/material.dart';
import 'package:responsive_property/responsive_property.dart';
import 'package:very_good_slide_puzzle/colors/colors.dart';
import 'package:very_good_slide_puzzle/layout/layout.dart';
import 'package:very_good_slide_puzzle/simple/simple.dart';

/// {@template simple_theme}
/// The simple puzzle theme.
/// {@endtemplate}
class ClaymorphismTheme extends SimpleTheme {
  /// {@macro simple_theme}
  const ClaymorphismTheme() : super();

  @override
  Map<Locale, String> get name => {
        const Locale("en"): 'Claymorphism',
        const Locale("es"): 'Arcillamorfismo',
        const Locale("zh"): "黏土拟物"
      };

  @override
  bool get hasTimer => false;

  @override
  DynamicTextStyle get nameTextStyle =>
      const DynamicTextStyle(color: PuzzleColors.grey1);

  @override
  DynamicTextStyle get titleTextStyle => const DynamicTextStyle(
        color: PuzzleColors.green50,
        fontFamily: "BalooThambi2",
        fontWeight: FontWeight.bold,
      );

  @override
  DynamicTextStyle get defaultTextStyle => DynamicTextStyle(
        color: Colors.blue.shade900,
        fontFamily: "BalooThambi2",
      );

  @override
  Responsive<Style> get backgroundStyle => Responsive({
        allScreen: Style(
          backgroundDecoration: BoxDecoration(
              gradient: LinearGradient(
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
              ])),
        )
      });

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
                color: Colors.blue.shade400.withOpacity(0.5),
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
                color: Colors.blue.shade400.withOpacity(0.5),
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
                color: Colors.blue.shade400.withOpacity(0.5),
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
                color: Colors.blue.shade400.withOpacity(0.5),
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
                color: Colors.blue.shade400.withOpacity(0.5),
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
                color: Colors.blue.shade400.withOpacity(0.5),
                offset: const Offset(1, 1)),
          ],
        )
      });

  @override
  bool get isLogoColored => true;

  @override
  DynamicTextStyle get menuActiveStyle => const DynamicTextStyle(
      color: PuzzleColors.black,
      fontWeight: FontWeight.w700,
      fontFamily: "BalooThambi2");

  @override
  Color get menuUnderlineColor => Colors.blue.shade900;

  @override
  Color get popupMenuBackgroundColor => Colors.lightBlue.shade100;

  @override
  DynamicTextStyle get menuInactiveStyle => const DynamicTextStyle(
      color: PuzzleColors.grey2, fontFamily: "BalooThambi2");

  @override
  String get tilePressSoundAsset => "assets/audio/clay_click.mp3";

  @override
  PuzzleLayoutDelegate get layoutDelegate => const SimplePuzzleLayoutDelegate();
}

final _baseStyle = Style(
    alignment: Alignment.center,
    transformAlignment: Alignment.center,
    shadows: [
      ShapeShadow(
          blurRadius: 10,
          spreadRadius: 2,
          color: Colors.blue.shade400.withOpacity(0.5),
          offset: const Offset(4, 4)),
    ],
    insetShadows: [
      ShapeShadow(
          blurRadius: 10,
          color: Colors.white70.withOpacity(0.5),
          offset: const Offset((-3), (-3))),
      ShapeShadow(
          blurRadius: 2,
          spreadRadius: 1,
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: const [0, 0.5],
              colors: [Colors.lightBlue.shade300, Colors.lightBlue.shade700]),
          offset: const Offset(-3, -3)),
    ],
    textStyle: DynamicTextStyle(
      letterSpacing: 0.1.toPXLength,
      fontSize: 28.toPXLength,
      fontFamily: "BalooThambi2",
      fontWeight: FontWeight.w700,
      color: Colors.blue.shade900,
    ),
    shapeBorder: RectangleShapeBorder(
      borderRadius:
          DynamicBorderRadius.all(DynamicRadius.circular(50.toPXLength)),
    ),
    childAlignment: Alignment.center,
    mouseCursor: SystemMouseCursors.click);

abstract class _TileDimension {
  static Dimension small = Dimension.min(72.0.toPXLength, 100.toPercentLength);
  static Dimension medium =
      Dimension.min(100.0.toPXLength, 100.toPercentLength);
  static Dimension large = Dimension.min(112.0.toPXLength, 100.toPercentLength);
}
