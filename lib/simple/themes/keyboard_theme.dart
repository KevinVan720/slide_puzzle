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
class KeyboardTheme extends SimpleTheme {
  /// {@macro simple_theme}
  const KeyboardTheme({ThemeLuminance? luminance})
      : super(luminance: luminance);

  @override
  Map<Locale, String> get name => {
        const Locale("en"): 'Keyboard',
        const Locale("es"): 'Teclado',
        const Locale("zh"): "键盘"
      };

  KeyboardTheme copyWith({
    ThemeLuminance? luminance,
  }) {
    return KeyboardTheme(luminance: luminance ?? this.luminance);
  }

  @override
  bool get hasTimer => false;

  @override
  DynamicTextStyle get nameTextStyle => const DynamicTextStyle(
        color: PuzzleColors.grey1,
        fontStyle: FontStyle.italic,
        fontFamily: "GoogleSans",
        shadows: _engraveShadow,
      );

  @override
  DynamicTextStyle get titleTextStyle => DynamicTextStyle(
      color: Colors.teal.shade700,
      fontStyle: FontStyle.italic,
      fontFamily: "GoogleSans",
      shadows: _engraveShadow,
      fontWeight: FontWeight.bold);

  @override
  DynamicTextStyle get defaultTextStyle => const DynamicTextStyle(
        color: PuzzleColors.green50,
        fontStyle: FontStyle.italic,
        fontWeight: FontWeight.bold,
        fontFamily: "GoogleSans",
        shadows: _engraveShadow,
      );

  @override
  Responsive<Style> get backgroundStyle => Responsive({
        allScreen: Style(
          backgroundDecoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Colors.redAccent.shade100,
            Colors.redAccent.shade100
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        ),
      });

  @override
  Responsive<Style> get popupMenuStyle => Responsive({
        allScreen: Style(
          width: Dimension.min(240.toPXLength, 90.toPercentLength),
          backgroundDecoration:
              BoxDecoration(color: Colors.tealAccent.shade100),
          shapeBorder: RectangleShapeBorder(
              borderRadius: DynamicBorderRadius.all(
                  DynamicRadius.circular(20.toPXLength)),
              border: const DynamicBorderSide(width: 1, color: Colors.teal)),
          shadows: [
            ShapeShadow(
                blurRadius: 10,
                spreadRadius: 1,
                color: Colors.grey.shade700,
                offset: const Offset(0, 10)),
            const ShapeShadow(
                blurRadius: 0, color: Colors.teal, offset: Offset(0, 11)),
            ShapeShadow(
                blurRadius: 0,
                spreadRadius: -1,
                gradient: LinearGradient(colors: [
                  Colors.tealAccent.shade400,
                  Colors.tealAccent.shade700
                ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                offset: const Offset(0, 10)),
          ],
          transform: SmoothMatrix4()..translate(0.toPXLength, -11.toPXLength),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
              color: Colors.teal.shade100,
              fontWeight: FontWeight.w800,
              fontFamily: "GoogleSans",
              shadows: _engraveShadow,
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
            backgroundDecoration: const BoxDecoration(
              color: Colors.transparent,
            ),
            shapeBorder: RectangleShapeBorder(
              borderRadius:
                  DynamicBorderRadius.all(DynamicRadius.circular(5.toPXLength)),
            ),
            textStyle: DynamicTextStyle(
              fontSize: 16.toPXLength,
              color: Colors.teal.shade400,
              fontWeight: FontWeight.w800,
              fontFamily: "GoogleSans",
              shadows: _engraveShadow,
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
            backgroundDecoration: const BoxDecoration(
              color: Colors.transparent,
            ),
            shapeBorder: RectangleShapeBorder(
              borderRadius:
                  DynamicBorderRadius.all(DynamicRadius.circular(5.toPXLength)),
            ),
            textStyle: DynamicTextStyle(
                fontSize: 16.toPXLength,
                color: Colors.teal.shade900,
                fontWeight: FontWeight.bold,
                fontFamily: "GoogleSans",
                shadows: const [
                  Shadow(
                      blurRadius: 0.5,
                      color: Color.fromARGB(60, 255, 255, 255),
                      offset: Offset(-0.2, -1)),
                  Shadow(
                      blurRadius: 0.5,
                      color: Color.fromARGB(60, 255, 255, 255),
                      offset: Offset(-0.5, -0.5)),
                  Shadow(
                      blurRadius: 0.5,
                      color: Color.fromARGB(60, 255, 255, 255),
                      offset: Offset(-0.8, -0.2)),
                  Shadow(
                      blurRadius: 0.5,
                      color: Color.fromARGB(200, 0, 0, 0),
                      offset: Offset(0.2, 1)),
                  Shadow(
                      blurRadius: 0.5,
                      color: Color.fromARGB(200, 0, 0, 0),
                      offset: Offset(0.5, 0.5)),
                  Shadow(
                      blurRadius: 0.5,
                      color: Color.fromARGB(200, 0, 0, 0),
                      offset: Offset(0.8, 0.2)),
                ]),
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
                color: Colors.teal.shade700,
                fontStyle: FontStyle.italic,
                fontFamily: "GoogleSans",
                shadows: _engraveShadow,
                fontWeight: FontWeight.bold))
      });

  @override
  Responsive<Style> get popupMenuTileStyle => Responsive({
        allScreen: Style(
          backgroundDecoration: BoxDecoration(
            color: Colors.tealAccent.shade100,
          ),
          shapeBorder: RectangleShapeBorder(
            borderRadius:
                DynamicBorderRadius.all(DynamicRadius.circular(10.toPXLength)),
          ),
          insetShadows: [
            ShapeShadow(
                blurRadius: 1,
                color: Colors.white.withOpacity(0.6),
                offset: const Offset(-0.2, -1)),
            const ShapeShadow(
                blurRadius: 2,
                color: Color.fromARGB(200, 10, 10, 10),
                offset: Offset(0.2, 2)),
          ],
          padding: const EdgeInsets.all(5),
          margin: const EdgeInsets.symmetric(vertical: 5),
        )
      });

  @override
  Responsive<Style> get popupMenuSliderThumbStyle => Responsive({
        allScreen: Style(
          shapeBorder: RectangleShapeBorder(
            borderRadius:
                DynamicBorderRadius.all(DynamicRadius.circular(4.toPXLength)),
          ),
          backgroundDecoration: const BoxDecoration(
            color: Colors.teal,
          ),
          shadows: [
            const ShapeShadow(
                blurRadius: 0.5,
                color: Color.fromARGB(60, 255, 255, 255),
                offset: Offset(-0.2, -1)),
            const ShapeShadow(
                blurRadius: 0.5,
                color: Color.fromARGB(60, 255, 255, 255),
                offset: Offset(-0.5, -0.5)),
            const ShapeShadow(
                blurRadius: 0.5,
                color: Color.fromARGB(60, 255, 255, 255),
                offset: Offset(-0.8, -0.2)),
            const ShapeShadow(
                blurRadius: 0.5,
                color: Color.fromARGB(200, 0, 0, 0),
                offset: Offset(0.2, 1)),
            const ShapeShadow(
                blurRadius: 0.5,
                color: Color.fromARGB(200, 0, 0, 0),
                offset: Offset(0.5, 0.5)),
            const ShapeShadow(
                blurRadius: 0.5,
                color: Color.fromARGB(200, 0, 0, 0),
                offset: Offset(0.8, 0.2)),
          ],
          width: 20.toPXLength,
          height: 30.toPXLength,
        )
      });

  @override
  Responsive<Style> get popupMenuSliderTrackStyle => Responsive({
        allScreen: Style(
          width: 88.toPercentLength,
          height: 30.toPXLength,
          backgroundDecoration: BoxDecoration(
            color: Colors.teal.shade200,
          ),
          insetShadows: [
            ShapeShadow(
                blurRadius: 2,
                color: Colors.tealAccent.shade100.withOpacity(0.7),
                offset: const Offset(-0.2, -2)),
            const ShapeShadow(
                blurRadius: 2,
                color: Color.fromARGB(200, 10, 10, 10),
                offset: Offset(0.2, 2)),
          ],
          shapeBorder: RectangleShapeBorder(
            borderRadius:
                DynamicBorderRadius.all(DynamicRadius.circular(4.toPXLength)),
          ),
        )
      });

  @override
  bool get isPopupMenuSliderThumbContained => true;

  @override
  Responsive<Style> get buttonStyle => Responsive({
        smallScreen: _baseStyle.copyWith(
          width: _TileDimension.small,
          height: _TileDimension.small,
          padding: const EdgeInsets.symmetric(vertical: 10),
          shapeBorder: RectangleShapeBorder(
              borderRadius: DynamicBorderRadius.all(
                  DynamicRadius.circular(10.toPXLength)),
              border: const DynamicBorderSide(width: 1, color: Colors.teal)),
          shadows: [
            ShapeShadow(
                blurRadius: 10,
                spreadRadius: 1,
                color: Colors.grey.shade700,
                offset: const Offset(0, 9)),
            const ShapeShadow(
                blurRadius: 0, color: Colors.teal, offset: Offset(0, 10)),
            ShapeShadow(
                blurRadius: 0,
                spreadRadius: -1,
                gradient: LinearGradient(colors: [
                  Colors.tealAccent.shade400,
                  Colors.tealAccent.shade700
                ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                offset: const Offset(0, 9)),
          ],
          transform: SmoothMatrix4()..translate(0.toPXLength, -10.toPXLength),
          textStyle: DynamicTextStyle(
            fontSize: 20.toPXLength,
            color: Colors.teal,
            fontWeight: FontWeight.w800,
            fontFamily: "GoogleSans",
            shadows: _engraveShadow,
          ),
        ),
        middleScreen: _baseStyle.copyWith(
          width: _TileDimension.medium,
          height: _TileDimension.medium,
          textStyle: DynamicTextStyle(
            fontSize: 24.toPXLength,
            color: Colors.teal,
            fontWeight: FontWeight.w800,
            fontFamily: "GoogleSans",
            shadows: _engraveShadow,
          ),
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
          padding: const EdgeInsets.symmetric(vertical: 10),
          textStyle: DynamicTextStyle(
            fontSize: 20.toPXLength,
            color: Colors.teal,
            fontWeight: FontWeight.w800,
            fontFamily: "GoogleSans",
            shadows: _engraveShadow,
          ),
          shapeBorder: RectangleShapeBorder(
              borderRadius: DynamicBorderRadius.all(
                  DynamicRadius.circular(10.toPXLength)),
              border: const DynamicBorderSide(width: 1, color: Colors.teal)),
          shadows: [
            ShapeShadow(
                blurRadius: 6,
                spreadRadius: 1,
                color: Colors.grey.shade700,
                offset: const Offset(0, 6)),
            const ShapeShadow(
                blurRadius: 0, color: Colors.teal, offset: Offset(0, 7)),
            ShapeShadow(
                blurRadius: 0,
                spreadRadius: -1,
                gradient: LinearGradient(colors: [
                  Colors.tealAccent.shade400,
                  Colors.tealAccent.shade700
                ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                offset: const Offset(0, 6)),
          ],
          transform: SmoothMatrix4()..translate(0.toPXLength, -7.toPXLength),
        ),
        middleScreen: _baseStyle.copyWith(
          width: _TileDimension.medium,
          height: _TileDimension.medium,
          textStyle: DynamicTextStyle(
            fontSize: 24.toPXLength,
            color: Colors.teal,
            fontWeight: FontWeight.w800,
            fontFamily: "GoogleSans",
            shadows: _engraveShadow,
          ),
          shadows: [
            ShapeShadow(
                blurRadius: 10,
                spreadRadius: 1,
                color: Colors.grey.shade700,
                offset: const Offset(0, 10)),
            const ShapeShadow(
                blurRadius: 0, color: Colors.teal, offset: Offset(0, 11)),
            ShapeShadow(
                blurRadius: 0,
                spreadRadius: -1,
                gradient: LinearGradient(colors: [
                  Colors.tealAccent.shade400,
                  Colors.tealAccent.shade700
                ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                offset: const Offset(0, 10)),
          ],
          transform: SmoothMatrix4()..translate(0.toPXLength, -11.toPXLength),
        ),
        largeScreen: _baseStyle.copyWith(
          width: _TileDimension.large,
          height: _TileDimension.large,
          shadows: [
            ShapeShadow(
                blurRadius: 10,
                spreadRadius: 1,
                color: Colors.grey.shade700,
                offset: const Offset(0, 10)),
            const ShapeShadow(
                blurRadius: 0, color: Colors.teal, offset: Offset(0, 11)),
            ShapeShadow(
                blurRadius: 0,
                spreadRadius: -1,
                gradient: LinearGradient(colors: [
                  Colors.tealAccent.shade400,
                  Colors.tealAccent.shade700
                ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                offset: const Offset(0, 10)),
          ],
          transform: SmoothMatrix4()..translate(0.toPXLength, -11.toPXLength),
        )
      });

  @override
  Responsive<Style> get pressedStyle => Responsive({
        smallScreen: _baseStyle.copyWith(
          width: _TileDimension.small,
          height: _TileDimension.small,
          padding: const EdgeInsets.symmetric(vertical: 10),
          textStyle: DynamicTextStyle(
            fontSize: 20.toPXLength,
            color: Colors.teal,
            fontWeight: FontWeight.w800,
            fontFamily: "GoogleSans",
            shadows: _engraveShadow,
          ),
          shapeBorder: RectangleShapeBorder(
              borderRadius: DynamicBorderRadius.all(
                  DynamicRadius.circular(10.toPXLength)),
              border: const DynamicBorderSide(width: 1, color: Colors.teal)),
          shadows: [
            ShapeShadow(
                blurRadius: 3,
                spreadRadius: 1,
                color: Colors.grey.shade700,
                offset: const Offset(0, 3)),
            const ShapeShadow(
                blurRadius: 0, color: Colors.teal, offset: Offset(0, 2)),
            ShapeShadow(
                blurRadius: 0,
                spreadRadius: -1,
                gradient: LinearGradient(colors: [
                  Colors.tealAccent.shade400,
                  Colors.tealAccent.shade700
                ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                offset: const Offset(0, 1)),
          ],
          transform: SmoothMatrix4()..translate(0.toPXLength, -2.toPXLength),
        ),
        middleScreen: _baseStyle.copyWith(
          width: _TileDimension.medium,
          height: _TileDimension.medium,
          textStyle: DynamicTextStyle(
            fontSize: 24.toPXLength,
            color: Colors.teal,
            fontWeight: FontWeight.w800,
            fontFamily: "GoogleSans",
            shadows: _engraveShadow,
          ),
          shadows: [
            ShapeShadow(
                blurRadius: 3,
                spreadRadius: 1,
                color: Colors.grey.shade700,
                offset: const Offset(0, 3)),
            const ShapeShadow(
                blurRadius: 0, color: Colors.teal, offset: Offset(0, 2)),
            ShapeShadow(
                blurRadius: 0,
                spreadRadius: -1,
                gradient: LinearGradient(colors: [
                  Colors.tealAccent.shade400,
                  Colors.tealAccent.shade700
                ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                offset: const Offset(0, 1)),
          ],
          transform: SmoothMatrix4()..translate(0.toPXLength, -2.toPXLength),
        ),
        largeScreen: _baseStyle.copyWith(
          width: _TileDimension.large,
          height: _TileDimension.large,
          shadows: [
            ShapeShadow(
                blurRadius: 3,
                spreadRadius: 1,
                color: Colors.grey.shade700,
                offset: const Offset(0, 3)),
            const ShapeShadow(
                blurRadius: 0, color: Colors.teal, offset: Offset(0, 2)),
            ShapeShadow(
                blurRadius: 0,
                spreadRadius: -1,
                gradient: LinearGradient(colors: [
                  Colors.tealAccent.shade400,
                  Colors.tealAccent.shade700
                ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                offset: const Offset(0, 1)),
          ],
          transform: SmoothMatrix4()..translate(0.toPXLength, -2.toPXLength),
        )
      });

  @override
  bool get isLogoColored => false;

  @override
  DynamicTextStyle get menuActiveStyle => DynamicTextStyle(
          color: Colors.teal.shade900,
          fontWeight: FontWeight.bold,
          fontFamily: "GoogleSans",
          shadows: const [
            Shadow(
                blurRadius: 0.5,
                color: Color.fromARGB(60, 255, 255, 255),
                offset: Offset(-0.2, -1)),
            Shadow(
                blurRadius: 0.5,
                color: Color.fromARGB(60, 255, 255, 255),
                offset: Offset(-0.5, -0.5)),
            Shadow(
                blurRadius: 0.5,
                color: Color.fromARGB(60, 255, 255, 255),
                offset: Offset(-0.8, -0.2)),
            Shadow(
                blurRadius: 0.5,
                color: Color.fromARGB(200, 0, 0, 0),
                offset: Offset(0.2, 1)),
            Shadow(
                blurRadius: 0.5,
                color: Color.fromARGB(200, 0, 0, 0),
                offset: Offset(0.5, 0.5)),
            Shadow(
                blurRadius: 0.5,
                color: Color.fromARGB(200, 0, 0, 0),
                offset: Offset(0.8, 0.2)),
          ]);

  @override
  Color get menuUnderlineColor => Colors.teal;

  @override
  DynamicTextStyle get menuInactiveStyle => const DynamicTextStyle(
        color: PuzzleColors.grey3,
        fontFamily: "GoogleSans",
        shadows: _engraveShadow,
      );

  @override
  String get tilePressSoundAsset => "assets/audio/keyboard_click.mp3";

  @override
  PuzzleLayoutDelegate get layoutDelegate => const SimplePuzzleLayoutDelegate();
}

final _baseStyle = Style(
    alignment: Alignment.center,
    padding: const EdgeInsets.symmetric(vertical: 20),
    backgroundDecoration: BoxDecoration(color: Colors.tealAccent.shade100),
    shapeBorder: RectangleShapeBorder(
        borderRadius:
            DynamicBorderRadius.all(DynamicRadius.circular(20.toPXLength)),
        border: const DynamicBorderSide(width: 1, color: Colors.teal)),
    shadows: [
      ShapeShadow(
          blurRadius: 10,
          spreadRadius: 1,
          color: Colors.grey.shade700,
          offset: const Offset(0, 14)),
      const ShapeShadow(
          blurRadius: 0, color: Colors.teal, offset: Offset(0, 15)),
      ShapeShadow(
          blurRadius: 0,
          spreadRadius: -1,
          gradient: LinearGradient(
              colors: [Colors.tealAccent.shade400, Colors.tealAccent.shade700],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
          offset: const Offset(0, 14)),
    ],
    transform: SmoothMatrix4()..translate(0.toPXLength, -15.toPXLength),
    textStyle: DynamicTextStyle(
      fontSize: 28.toPXLength,
      color: Colors.teal.shade700,
      fontWeight: FontWeight.w900,
      fontFamily: "GoogleSans",
      shadows: _engraveShadow,
    ),
    textAlign: TextAlign.center,
    mouseCursor: SystemMouseCursors.click);

abstract class _TileDimension {
  static Dimension small = Dimension.min(56.0.toPXLength, 96.toPercentLength);
  static Dimension medium = Dimension.min(90.0.toPXLength, 96.toPercentLength);
  static Dimension large = Dimension.min(110.0.toPXLength, 96.toPercentLength);
}

const List<Shadow> _engraveShadow = [
  Shadow(
      blurRadius: 0.5,
      color: Color.fromARGB(60, 255, 255, 255),
      offset: Offset(0.2, 1)),
  Shadow(
      blurRadius: 0.5,
      color: Color.fromARGB(60, 255, 255, 255),
      offset: Offset(0.5, 0.5)),
  Shadow(
      blurRadius: 0.5,
      color: Color.fromARGB(60, 255, 255, 255),
      offset: Offset(0.8, 0.2)),
  Shadow(
      blurRadius: 0.5,
      color: Color.fromARGB(200, 0, 0, 0),
      offset: Offset(-0.2, -1)),
  Shadow(
      blurRadius: 0.5,
      color: Color.fromARGB(200, 0, 0, 0),
      offset: Offset(-0.5, -0.5)),
  Shadow(
      blurRadius: 0.5,
      color: Color.fromARGB(200, 0, 0, 0),
      offset: Offset(-0.8, -0.2)),
];
