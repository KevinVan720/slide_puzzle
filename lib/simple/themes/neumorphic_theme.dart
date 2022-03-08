import 'package:animated_styled_widget/animated_styled_widget.dart';

import 'package:flutter/material.dart';
import 'package:responsive_property/responsive_property.dart';
import 'package:very_good_slide_puzzle/colors/colors.dart';
import 'package:very_good_slide_puzzle/layout/layout.dart';
import 'package:very_good_slide_puzzle/simple/simple.dart';

/// {@template simple_theme}
/// The simple puzzle theme.
/// {@endtemplate}
class NeumorphicTheme extends SimpleTheme {
  /// {@macro simple_theme}
  const NeumorphicTheme() : super();

  @override
  Map<Locale, String> get name => {
        const Locale("en"): 'Neumorphism',
        const Locale("es"): 'Neumorfismo',
        const Locale("zh"): "拟态"
      };

  @override
  bool get hasTimer => false;

  @override
  Curve get tileMoveAnimationCurve => Curves.decelerate;

  @override
  DynamicTextStyle get nameTextStyle => const DynamicTextStyle(
        color: PuzzleColors.grey1,
        fontFamily: "BalooThambi2",
      );

  @override
  DynamicTextStyle get titleTextStyle => const DynamicTextStyle(
        color: PuzzleColors.black,
        fontFamily: "BalooThambi2",
        fontWeight: FontWeight.bold,
      );

  @override
  DynamicTextStyle get defaultTextStyle => const DynamicTextStyle(
        color: PuzzleColors.grey1,
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
            backgroundDecoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color(0xFFE0E0E0), Color(0xFFE0E0E0)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter)))
      });

  @override
  Responsive<Style> get buttonStyle => Responsive({
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
            color: Colors.grey,
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
            color: Colors.grey,
          ),
        )
      });

  @override
  Responsive<Style> get hoverStyle => Responsive({
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
                color: Colors.grey.shade400,
                offset: const Offset(4, 4)),
            const ShapeShadow(
                blurRadius: 6,
                spreadRadius: -1,
                color: Color(0xFFFDFDFD),
                offset: Offset(-4, -4)),
          ],
        ),
        middleScreen: _baseStyle.copyWith(
          width: _TileDimension.medium,
          height: _TileDimension.medium,
          shadows: [
            ShapeShadow(
                blurRadius: 6,
                spreadRadius: -1,
                color: Colors.grey.shade400,
                offset: const Offset(4, 4)),
            const ShapeShadow(
                blurRadius: 6,
                spreadRadius: -1,
                color: Color(0xFFFDFDFD),
                offset: Offset(-4, -4)),
          ],
          textStyle: DynamicTextStyle(
            letterSpacing: 2.toPXLength,
            fontSize: 24.toPXLength,
            fontWeight: FontWeight.w700,
            fontFamily: "BalooThambi2",
            color: Colors.grey,
          ),
        ),
        largeScreen: _baseStyle.copyWith(
          width: _TileDimension.large,
          height: _TileDimension.large,
          shadows: [
            ShapeShadow(
                blurRadius: 6,
                spreadRadius: -1,
                color: Colors.grey.shade400,
                offset: const Offset(4, 4)),
            const ShapeShadow(
                blurRadius: 6,
                spreadRadius: -1,
                color: Color(0xFFFDFDFD),
                offset: Offset(-4, -4)),
          ],
          textStyle: DynamicTextStyle(
            letterSpacing: 2.toPXLength,
            fontSize: 28.toPXLength,
            fontWeight: FontWeight.w700,
            fontFamily: "BalooThambi2",
            color: Colors.grey,
          ),
        )
      });

  @override
  Responsive<Style> get pressedStyle => Responsive({
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
                color: Colors.grey.shade400,
                offset: const Offset(10, 10)),
            const ShapeShadow(
                blurRadius: 10,
                spreadRadius: -3,
                color: Color(0xFFFEFEFE),
                offset: Offset(-10, -10)),
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
                color: Colors.grey.shade400,
                offset: const Offset(10, 10)),
            const ShapeShadow(
                blurRadius: 10,
                spreadRadius: -3,
                color: Color(0xFFFEFEFE),
                offset: Offset(-10, -10)),
          ],
          textStyle: DynamicTextStyle(
            letterSpacing: 2.toPXLength,
            fontSize: 24.toPXLength,
            fontWeight: FontWeight.w700,
            fontFamily: "BalooThambi2",
            color: Colors.grey,
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
                color: Colors.grey.shade400,
                offset: const Offset(10, 10)),
            const ShapeShadow(
                blurRadius: 10,
                spreadRadius: -3,
                color: Color(0xFFFEFEFE),
                offset: Offset(-10, -10)),
          ],
          textStyle: DynamicTextStyle(
            letterSpacing: 2.toPXLength,
            fontSize: 28.toPXLength,
            fontWeight: FontWeight.w700,
            fontFamily: "BalooThambi2",
            color: Colors.grey,
          ),
        )
      });

  @override
  bool get isLogoColored => true;

  @override
  DynamicTextStyle get menuActiveStyle => const DynamicTextStyle(
      color: PuzzleColors.black, fontWeight: FontWeight.bold);

  @override
  Color get menuUnderlineColor => PuzzleColors.grey1;

  @override
  Color get popupMenuBackgroundColor => Colors.grey.shade100;

  @override
  DynamicTextStyle get menuInactiveStyle =>
      const DynamicTextStyle(color: PuzzleColors.grey2);

  @override
  String get tilePressSoundAsset => "assets/audio/neu_click.mp3";

  @override
  PuzzleLayoutDelegate get layoutDelegate => const SimplePuzzleLayoutDelegate();
}

final _baseStyle = Style(
    alignment: Alignment.center,
    childAlignment: Alignment.center,
    //margin: EdgeInsets.all(6),
    //padding: EdgeInsets.all(6),
    backgroundDecoration: const BoxDecoration(
      color: Color(0xFFE0E0E0),
    ),
    shapeBorder: RectangleShapeBorder(
      borderRadius:
          DynamicBorderRadius.all(DynamicRadius.circular(30.toPXLength)),
    ),
    shadows: [
      ShapeShadow(
          blurRadius: 15,
          spreadRadius: -3,
          color: Colors.grey.shade400,
          offset: const Offset(8, 8)),
      const ShapeShadow(
          blurRadius: 15,
          spreadRadius: -3,
          color: Color(0xFFFDFDFD),
          offset: Offset(-8, -8)),
    ],
    textStyle: DynamicTextStyle(
      letterSpacing: 2.toPXLength,
      fontSize: 20.toPXLength,
      fontWeight: FontWeight.w700,
      fontFamily: "BalooThambi2",
      color: Colors.grey,
    ),
    textAlign: TextAlign.center,
    mouseCursor: SystemMouseCursors.click);

abstract class _TileDimension {
  static Dimension small = Dimension.min(54.0.toPXLength, 100.toPercentLength);
  static Dimension medium = Dimension.min(86.0.toPXLength, 100.toPercentLength);
  static Dimension large = Dimension.min(104.0.toPXLength, 100.toPercentLength);
}
