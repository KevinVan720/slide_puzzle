/*import 'package:animated_styled_widget/animated_styled_widget.dart';

import 'package:flutter/material.dart';
import 'package:responsive_property/responsive_property.dart';
import 'package:very_good_slide_puzzle/colors/colors.dart';
import 'package:very_good_slide_puzzle/layout/layout.dart';
import 'package:very_good_slide_puzzle/simple/simple.dart';

/// {@template simple_theme}
/// The simple puzzle theme.
/// {@endtemplate}
class RetroTheme extends SimpleTheme {
  /// {@macro simple_theme}
  const RetroTheme() : super();

  @override
  Map<Locale, String> get name => {
        const Locale("en"): 'Retro',
        const Locale("es"): 'Arcillamorfismo',
        const Locale("zh"): "复古"
      };

  @override
  bool get hasTimer => false;

  @override
  Curve get tileMoveAnimationCurve => Curves.easeInOutBack;

  @override
  Duration get tileMoveAnimationDuration => const Duration(milliseconds: 333);

  @override
  DynamicTextStyle get nameTextStyle =>
      const DynamicTextStyle(color: PuzzleColors.grey1);

  @override
  DynamicTextStyle get titleTextStyle => const DynamicTextStyle(
        color: PuzzleColors.green50,
        fontFamily: "IPix",
        fontWeight: FontWeight.bold,
      );

  @override
  DynamicTextStyle get defaultTextStyle => DynamicTextStyle(
        color: Colors.blue.shade900,
        fontFamily: "IPix",
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
  Responsive<Style> get pressedStyle => Responsive({
        smallScreen: _baseStyle.copyWith(
            width: _TileDimension.small,
            height: _TileDimension.small,
            shapeBorder: const RoundedRectangleShapeBorder(
                borderSides: RectangleBorderSides.only(
                    top: DynamicBorderSide(color: Color(0xFF666666), width: 2),
                    left: DynamicBorderSide(color: Color(0xFF666666), width: 2),
                    bottom:
                        DynamicBorderSide(color: Color(0xFFf6f6f6), width: 2),
                    right: DynamicBorderSide(
                        color: Color(0xFFf6f6f6), width: 2)))),
        middleScreen: _baseStyle.copyWith(
            width: _TileDimension.medium,
            height: _TileDimension.medium,
            shapeBorder: const RoundedRectangleShapeBorder(
                borderSides: RectangleBorderSides.only(
                    top: DynamicBorderSide(color: Color(0xFF666666), width: 2),
                    left: DynamicBorderSide(color: Color(0xFF666666), width: 2),
                    bottom:
                        DynamicBorderSide(color: Color(0xFFf6f6f6), width: 2),
                    right: DynamicBorderSide(
                        color: Color(0xFFf6f6f6), width: 2)))),
        largeScreen: _baseStyle.copyWith(
            width: _TileDimension.large,
            height: _TileDimension.large,
            shapeBorder: const RoundedRectangleShapeBorder(
                borderSides: RectangleBorderSides.only(
                    top: DynamicBorderSide(color: Color(0xFF666666), width: 2),
                    left: DynamicBorderSide(color: Color(0xFF666666), width: 2),
                    bottom:
                        DynamicBorderSide(color: Color(0xFFf6f6f6), width: 2),
                    right:
                        DynamicBorderSide(color: Color(0xFFf6f6f6), width: 2))))
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
    backgroundDecoration: BoxDecoration(
      color: Color(0xFFd2d2d2),
    ),
    shapeBorder: const RoundedRectangleShapeBorder(
        borderSides: RectangleBorderSides.only(
            top: DynamicBorderSide(color: Color(0xFFf6f6f6), width: 2),
            left: DynamicBorderSide(color: Color(0xFFf6f6f6), width: 2),
            bottom: DynamicBorderSide(color: Color(0xFF666666), width: 2),
            right: DynamicBorderSide(color: Color(0xFF666666), width: 2))),
    textStyle: DynamicTextStyle(
      letterSpacing: 0.1.toPXLength,
      fontSize: 28.toPXLength,
      fontFamily: "IPix",
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
    childAlignment: Alignment.center,
    mouseCursor: SystemMouseCursors.click);

abstract class _TileDimension {
  static Dimension small = Dimension.min(60.0.toPXLength, 100.toPercentLength);
  static Dimension medium =
      Dimension.min(100.0.toPXLength, 100.toPercentLength);
  static Dimension large = Dimension.min(112.0.toPXLength, 100.toPercentLength);
}
 */
