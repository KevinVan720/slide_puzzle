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
class RetroTheme extends SimpleTheme {
  /// {@macro simple_theme}
  const RetroTheme({ThemeLuminance? luminance = ThemeLuminance.light})
      : super(luminance: luminance);

  @override
  Map<Locale, String> get name => {
        const Locale("en"): 'Retro',
        const Locale("es"): 'Arcillamorfismo',
        const Locale("zh"): "复古"
      };

  @override
  RetroTheme copyWith({
    ThemeLuminance? luminance,
  }) {
    return RetroTheme(luminance: luminance ?? this.luminance);
  }

  @override
  bool get hasTimer => false;

  @override
  Curve get tileMoveAnimationCurve => Curves.easeInOutBack;

  @override
  Duration get tileMoveAnimationDuration => const Duration(milliseconds: 333);

  @override
  DynamicTextStyle get nameTextStyle => const DynamicTextStyle(
        color: PuzzleColors.grey1,
        fontFamily: "GnuUnifontFull-Pm9P",
      );

  @override
  DynamicTextStyle get titleTextStyle => const DynamicTextStyle(
        color: PuzzleColors.green50,
        fontFamily: "GnuUnifontFull-Pm9P",
        fontWeight: FontWeight.bold,
      );

  @override
  DynamicTextStyle get defaultTextStyle => DynamicTextStyle(
        color: Colors.blue.shade900,
        fontFamily: "GnuUnifontFull-Pm9P",
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
          padding: EdgeInsets.all(8),
        ),
        middleScreen: _baseStyle.copyWith(
          padding: EdgeInsets.all(8),
        ),
        largeScreen: _baseStyle.copyWith(
          padding: EdgeInsets.all(8),
        )
      });

  @override
  Responsive<Style> get buttonHoverStyle => Responsive({
        smallScreen: _baseStyle.copyWith(
          padding: EdgeInsets.all(8),
        ),
        middleScreen: _baseStyle.copyWith(
          padding: EdgeInsets.all(8),
        ),
        largeScreen: _baseStyle.copyWith(
          padding: EdgeInsets.all(8),
        )
      });

  @override
  Responsive<Style> get buttonPressedStyle => Responsive({
        smallScreen: _baseStyle.copyWith(
          padding: EdgeInsets.all(8),
        ),
        middleScreen: _baseStyle.copyWith(
          padding: EdgeInsets.all(8),
        ),
        largeScreen: _baseStyle.copyWith(
          padding: EdgeInsets.all(8),
        )
      });

  @override
  DynamicTextStyle get menuActiveStyle => const DynamicTextStyle(
      color: PuzzleColors.black,
      fontWeight: FontWeight.w700,
      fontFamily: "GnuUnifontFull-Pm9P");

  @override
  Color get menuUnderlineColor => Colors.blue.shade900;

  @override
  DynamicTextStyle get menuInactiveStyle => const DynamicTextStyle(
      color: PuzzleColors.grey2, fontFamily: "GnuUnifontFull-Pm9P");

  @override
  String get tilePressSoundAsset => "assets/audio/clay_click.mp3";

  @override
  PuzzleLayoutDelegate get layoutDelegate => const SimplePuzzleLayoutDelegate();

  @override
  Responsive<Style> get popupMenuSliderThumbStyle => Responsive({
        allScreen: Style(
          shapeBorder: const CircleShapeBorder(),
          backgroundDecoration: BoxDecoration(
            color: Colors.black,
          ),
          width: 20.toPXLength,
          height: 20.toPXLength,
        )
      });

  @override
  Responsive<Style> get popupMenuSliderTrackStyle => Responsive({
        allScreen: Style(
          width: 88.toPercentLength,
          height: 4.toPXLength,
          backgroundDecoration: BoxDecoration(
            color: Colors.white,
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
            color: Colors.blue,
          ),
          shapeBorder: RectangleShapeBorder(
            borderRadius:
                DynamicBorderRadius.all(DynamicRadius.circular(3.toPXLength)),
          ),
        )
      });

  @override
  // TODO: implement popupMenuTitleStyle
  Responsive<Style> get popupMenuTitleStyle => Responsive({
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
  // TODO: implement tileHoverStyle
  Responsive<Style> get tileHoverStyle => Responsive({
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
  // TODO: implement tilePressedStyle
  Responsive<Style> get tilePressedStyle => Responsive({
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
  // TODO: implement tileStyle
  Responsive<Style> get tileStyle => Responsive({
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
}

final _baseStyle = Style(
    alignment: Alignment.center,
    transformAlignment: Alignment.center,
    backgroundDecoration: BoxDecoration(
      color: Colors.redAccent,
    ),
    shadows: pixelBorder,
    insetShadows: [
      ShapeShadow(
        offset: Offset(0, -4),
        color: Colors.redAccent.shade700,
      ),
      ShapeShadow(
        offset: Offset(0, 8),
        color: Colors.redAccent.shade100,
      ),
      ShapeShadow(
          offset: Offset(-4, 0),
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.redAccent,
                Colors.redAccent,
                Colors.redAccent.shade700
              ],
              stops: [
                0.1,
                0.9,
                0.9
              ])),
      ShapeShadow(
          offset: Offset(8, 0),
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.redAccent,
                Colors.redAccent,
                Colors.redAccent.shade100,
                Colors.redAccent.shade100,
                Colors.redAccent,
              ],
              stops: [
                0,
                0.05,
                0.05,
                0.1,
                0.1,
              ])),
      ShapeShadow(
          offset: Offset(4, 0),
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.redAccent,
                Colors.redAccent,
                Colors.redAccent.shade100,
                Colors.redAccent.shade100,
                Colors.redAccent,
              ],
              stops: [
                0,
                0.1,
                0.1,
                0.15,
                0.15,
              ])),
    ],
    textStyle: DynamicTextStyle(
      letterSpacing: 0.1.toPXLength,
      fontSize: 36.toPXLength,
      fontFamily: "GnuUnifontFull-Pm9P",
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
    childAlignment: Alignment.center,
    mouseCursor: SystemMouseCursors.click);

abstract class _TileDimension {
  static Dimension small = Dimension.min(50.0.toPXLength, 100.toPercentLength);
  static Dimension medium = Dimension.min(100.0.toPXLength, 90.toPercentLength);
  static Dimension large = Dimension.min(102.0.toPXLength, 100.toPercentLength);
}

List<ShapeShadow> pixelBorder = [
  ...[Offset(8, 0), Offset(-8, 0), Offset(0, 8), Offset(0, -8)]
      .map((e) => ShapeShadow(offset: e, color: Colors.black)),
  ShapeShadow(offset: Offset.zero, spreadRadius: 4, color: Colors.black),
  ...[Offset(4, 0), Offset(-4, 0)].map((e) => ShapeShadow(
        offset: e,
        color: Colors.redAccent,
      )),
  ShapeShadow(offset: Offset(0, 4), color: Color(0xFFB50000)),
  ShapeShadow(
      offset: Offset(4, 0),
      gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.redAccent,
            Colors.redAccent,
            Colors.redAccent.shade700
          ],
          stops: [
            0.1,
            0.75,
            0.75
          ])),
  ShapeShadow(offset: Offset(0, -4), color: Colors.redAccent),
  ShapeShadow(
    offset: Offset(-4, 0),
    color: Colors.redAccent,
    /*gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.redAccent.shade100,
            Colors.redAccent.shade100,
            Colors.redAccent,
            Colors.redAccent,
            Colors.redAccent.shade700
          ],
          stops: [
            0,
            0.25,
            0.25,
            0.9,
            0.9
          ])*/
  ),
];
