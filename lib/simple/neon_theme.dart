import 'package:animated_styled_widget/animated_styled_widget.dart';
import 'package:flutter/material.dart';
import 'package:responsive_property/responsive_property.dart';
import 'package:very_good_slide_puzzle/layout/layout.dart';
import 'package:very_good_slide_puzzle/simple/simple.dart';

/// {@template simple_theme}
/// The simple puzzle theme.
/// {@endtemplate}
class NeonTheme extends SimpleTheme {
  /// {@macro simple_theme}
  const NeonTheme() : super();

  @override
  @override
  Map<Locale, String> get name => {
        const Locale("en"): 'Neon',
        const Locale("es"): 'Neón',
        const Locale("zh"): "霓虹"
      };

  @override
  bool get hasTimer => false;

  @override
  DynamicTextStyle get nameTextStyle => const DynamicTextStyle(
        color: Colors.white70,
        fontFamily: "Night-Club-70s",
        shadows: [
          Shadow(blurRadius: 2, color: Color(0xFFFCEC0C), offset: Offset(0, 0)),
          Shadow(blurRadius: 4, color: Color(0xFFFCEC0C), offset: Offset(0, 0)),
          Shadow(blurRadius: 1, color: Color(0xFFFCEC0C), offset: Offset(0, 0))
        ],
      );

  @override
  DynamicTextStyle get titleTextStyle => const DynamicTextStyle(
        color: Color(0xFFFCEC0C),
        fontFamily: "Night-Club-70s",
        fontWeight: FontWeight.bold,
        shadows: [
          Shadow(blurRadius: 5, color: Color(0xFFFCEC0C), offset: Offset(0, 0)),
          Shadow(
              blurRadius: 20, color: Color(0xFFFCEC0C), offset: Offset(0, 0)),
          Shadow(blurRadius: 1, color: Color(0xFFFCEC0C), offset: Offset(0, 0))
        ],
      );

  @override
  DynamicTextStyle get defaultTextStyle => const DynamicTextStyle(
        color: Colors.white,
        fontFamily: "Beon",
        shadows: [
          Shadow(blurRadius: 5, color: Colors.white, offset: Offset(0, 0)),
        ],
      );

  @override
  Responsive<Style> get backgroundStyle => Responsive({
        allScreen: Style(
            backgroundDecoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
              Color(0xFF091833),
              Color(0xFF711C91),
            ])))
      });

  @override
  Responsive<Style> get buttonStyle => Responsive({
        smallScreen: _baseStyle.copyWith(
          width: _TileDimension.small,
          height: _TileDimension.small,
          shapeBorder: RoundedRectangleShapeBorder(
              borderRadius: DynamicBorderRadius.all(
                  DynamicRadius.circular(15.toPXLength)),
              borderSides: RectangleBorderSides.only(
                  top: DynamicBorderSide(
                      gradient: LinearGradient(colors: [
                        Colors.cyanAccent.shade100,
                        Colors.purpleAccent.shade100
                      ]),
                      width: 6),
                  bottom: const DynamicBorderSide(
                      gradient:
                          LinearGradient(colors: [Colors.cyan, Colors.purple]),
                      width: 12),
                  left: DynamicBorderSide(
                      color: Colors.cyanAccent.shade200, width: 6),
                  right: const DynamicBorderSide(
                      color: Colors.purpleAccent, width: 12))),
          textStyle: DynamicTextStyle(
            letterSpacing: 1.toPXLength,
            fontSize: 24.toPXLength,
            fontFamily: "Beon",
            fontWeight: FontWeight.w700,
            color: Colors.white,
            shadows: [
              const Shadow(
                  blurRadius: 5, color: Colors.white, offset: Offset(0, 0)),
              const Shadow(
                  blurRadius: 20, color: Colors.white, offset: Offset(0, 0)),
              const Shadow(
                  blurRadius: 1, color: Colors.white70, offset: Offset(0, 0))
            ],
          ),
        ),
        middleScreen: _baseStyle.copyWith(
          width: _TileDimension.medium,
          height: _TileDimension.medium,
          shapeBorder: RoundedRectangleShapeBorder(
              borderRadius: DynamicBorderRadius.all(
                  DynamicRadius.circular(15.toPXLength)),
              borderSides: RectangleBorderSides.only(
                  top: DynamicBorderSide(
                      gradient: LinearGradient(colors: [
                        Colors.cyanAccent.shade100,
                        Colors.purpleAccent.shade100
                      ]),
                      width: 8),
                  bottom: const DynamicBorderSide(
                      gradient:
                          LinearGradient(colors: [Colors.cyan, Colors.purple]),
                      width: 16),
                  left: DynamicBorderSide(
                      color: Colors.cyanAccent.shade200, width: 8),
                  right: const DynamicBorderSide(
                      color: Colors.purpleAccent, width: 16))),
        ),
        largeScreen: _baseStyle.copyWith(
          width: _TileDimension.large,
          height: _TileDimension.large,
          shapeBorder: RoundedRectangleShapeBorder(
              borderRadius: DynamicBorderRadius.all(
                  DynamicRadius.circular(15.toPXLength)),
              borderSides: RectangleBorderSides.only(
                  top: DynamicBorderSide(
                      gradient: LinearGradient(colors: [
                        Colors.cyanAccent.shade100,
                        Colors.purpleAccent.shade100
                      ]),
                      width: 10),
                  bottom: const DynamicBorderSide(
                      gradient:
                          LinearGradient(colors: [Colors.cyan, Colors.purple]),
                      width: 20),
                  left: DynamicBorderSide(
                      color: Colors.cyanAccent.shade200, width: 10),
                  right: const DynamicBorderSide(
                      color: Colors.purpleAccent, width: 20))),
        )
      });

  @override
  Responsive<Style> get hoverStyle => Responsive({
        smallScreen: _baseStyle.copyWith(
          width: _TileDimension.small,
          height: _TileDimension.small,
          shapeBorder: RoundedRectangleShapeBorder(
              borderRadius: DynamicBorderRadius.all(
                  DynamicRadius.circular(15.toPXLength)),
              borderSides: RectangleBorderSides.only(
                  top: DynamicBorderSide(
                      gradient: LinearGradient(colors: [
                        Colors.cyanAccent.shade100,
                        Colors.purpleAccent.shade100
                      ]),
                      width: 5),
                  bottom: const DynamicBorderSide(
                      gradient:
                          LinearGradient(colors: [Colors.cyan, Colors.purple]),
                      width: 10),
                  left: DynamicBorderSide(
                      color: Colors.cyanAccent.shade200, width: 5),
                  right: const DynamicBorderSide(
                      color: Colors.purpleAccent, width: 10))),
          textStyle: DynamicTextStyle(
            letterSpacing: 1.toPXLength,
            fontSize: 30.toPXLength,
            fontFamily: "Beon",
            fontWeight: FontWeight.w900,
            color: Colors.white,
            shadows: [
              const Shadow(
                  blurRadius: 10, color: Colors.white, offset: Offset(0, 0)),
              const Shadow(
                  blurRadius: 25, color: Colors.white, offset: Offset(0, 0)),
              const Shadow(
                  blurRadius: 5, color: Colors.white70, offset: Offset(0, 0))
            ],
          ),
        ),
        middleScreen: _baseStyle.copyWith(
          width: _TileDimension.medium,
          height: _TileDimension.medium,
          shapeBorder: RoundedRectangleShapeBorder(
              borderRadius: DynamicBorderRadius.all(
                  DynamicRadius.circular(15.toPXLength)),
              borderSides: RectangleBorderSides.only(
                  top: DynamicBorderSide(
                      gradient: LinearGradient(colors: [
                        Colors.cyanAccent.shade100,
                        Colors.purpleAccent.shade100
                      ]),
                      width: 7),
                  bottom: const DynamicBorderSide(
                      gradient:
                          LinearGradient(colors: [Colors.cyan, Colors.purple]),
                      width: 14),
                  left: DynamicBorderSide(
                      color: Colors.cyanAccent.shade200, width: 7),
                  right: const DynamicBorderSide(
                      color: Colors.purpleAccent, width: 14))),
          textStyle: DynamicTextStyle(
            letterSpacing: 1.toPXLength,
            fontSize: 30.toPXLength,
            fontFamily: "Beon",
            fontWeight: FontWeight.w900,
            color: Colors.white,
            shadows: [
              const Shadow(
                  blurRadius: 10, color: Colors.white, offset: Offset(0, 0)),
              const Shadow(
                  blurRadius: 25, color: Colors.white, offset: Offset(0, 0)),
              const Shadow(
                  blurRadius: 5, color: Colors.white70, offset: Offset(0, 0))
            ],
          ),
        ),
        largeScreen: _baseStyle.copyWith(
          width: _TileDimension.large,
          height: _TileDimension.large,
          shapeBorder: RoundedRectangleShapeBorder(
              borderRadius: DynamicBorderRadius.all(
                  DynamicRadius.circular(15.toPXLength)),
              borderSides: RectangleBorderSides.only(
                  top: DynamicBorderSide(
                      gradient: LinearGradient(colors: [
                        Colors.cyanAccent.shade100,
                        Colors.purpleAccent.shade100
                      ]),
                      width: 9),
                  bottom: const DynamicBorderSide(
                      gradient:
                          LinearGradient(colors: [Colors.cyan, Colors.purple]),
                      width: 18),
                  left: DynamicBorderSide(
                      color: Colors.cyanAccent.shade200, width: 9),
                  right: const DynamicBorderSide(
                      color: Colors.purpleAccent, width: 18))),
          textStyle: DynamicTextStyle(
            letterSpacing: 1.toPXLength,
            fontSize: 30.toPXLength,
            fontFamily: "Beon",
            fontWeight: FontWeight.w900,
            color: Colors.white,
            shadows: [
              const Shadow(
                  blurRadius: 10, color: Colors.white, offset: Offset(0, 0)),
              const Shadow(
                  blurRadius: 25, color: Colors.white, offset: Offset(0, 0)),
              const Shadow(
                  blurRadius: 5, color: Colors.white70, offset: Offset(0, 0))
            ],
          ),
        )
      });

  @override
  Responsive<Style> get pressedStyle => Responsive({
        smallScreen: _baseStyle.copyWith(
          width: _TileDimension.small,
          height: _TileDimension.small,
          shapeBorder: RoundedRectangleShapeBorder(
              borderRadius: DynamicBorderRadius.all(
                  DynamicRadius.circular(15.toPXLength)),
              borderSides: RectangleBorderSides.only(
                  top: DynamicBorderSide(
                      gradient: LinearGradient(colors: [
                        Colors.cyanAccent.shade100,
                        Colors.purpleAccent.shade100
                      ]),
                      width: 3),
                  bottom: const DynamicBorderSide(
                      gradient:
                          LinearGradient(colors: [Colors.cyan, Colors.purple]),
                      width: 6),
                  left: DynamicBorderSide(
                      color: Colors.cyanAccent.shade200, width: 3),
                  right: const DynamicBorderSide(
                      color: Colors.purpleAccent, width: 6))),
        ),
        middleScreen: _baseStyle.copyWith(
          width: _TileDimension.medium,
          height: _TileDimension.medium,
          shapeBorder: RoundedRectangleShapeBorder(
              borderRadius: DynamicBorderRadius.all(
                  DynamicRadius.circular(15.toPXLength)),
              borderSides: RectangleBorderSides.only(
                  top: DynamicBorderSide(
                      gradient: LinearGradient(colors: [
                        Colors.cyanAccent.shade100,
                        Colors.purpleAccent.shade100
                      ]),
                      width: 5),
                  bottom: const DynamicBorderSide(
                      gradient:
                          LinearGradient(colors: [Colors.cyan, Colors.purple]),
                      width: 10),
                  left: DynamicBorderSide(
                      color: Colors.cyanAccent.shade200, width: 5),
                  right: const DynamicBorderSide(
                      color: Colors.purpleAccent, width: 10))),
        ),
        largeScreen: _baseStyle.copyWith(
          width: _TileDimension.large,
          height: _TileDimension.large,
          shapeBorder: RoundedRectangleShapeBorder(
              borderRadius: DynamicBorderRadius.all(
                  DynamicRadius.circular(15.toPXLength)),
              borderSides: RectangleBorderSides.only(
                  top: DynamicBorderSide(
                      gradient: LinearGradient(colors: [
                        Colors.cyanAccent.shade100,
                        Colors.purpleAccent.shade100
                      ]),
                      width: 7),
                  bottom: const DynamicBorderSide(
                      gradient:
                          LinearGradient(colors: [Colors.cyan, Colors.purple]),
                      width: 14),
                  left: DynamicBorderSide(
                      color: Colors.cyanAccent.shade200, width: 7),
                  right: const DynamicBorderSide(
                      color: Colors.purpleAccent, width: 14))),
        )
      });

  @override
  bool get isLogoColored => false;

  @override
  DynamicTextStyle get menuActiveStyle => const DynamicTextStyle(
        color: Color(0xFFFCEC0C),
        fontFamily: "Beon",
        fontWeight: FontWeight.bold,
        shadows: [
          Shadow(blurRadius: 2, color: Color(0xFFFCEC0C), offset: Offset(0, 0)),
          Shadow(blurRadius: 4, color: Color(0xFFFCEC0C), offset: Offset(0, 0)),
          Shadow(blurRadius: 1, color: Color(0xFFFCEC0C), offset: Offset(0, 0))
        ],
      );

  @override
  Color get menuUnderlineColor => const Color(0xFFFCEC0C);

  @override
  Color get popupMenuBackgroundColor => Colors.purple.shade700;

  @override
  DynamicTextStyle get menuInactiveStyle => const DynamicTextStyle(
        color: Colors.white,
        fontFamily: "Beon",
        shadows: [
          Shadow(blurRadius: 5, color: Colors.white, offset: Offset(0, 0)),
        ],
      );

  @override
  String get audioControlOnAsset => 'assets/images/audio_control/simple_on.png';

  @override
  String get audioControlOffAsset =>
      'assets/images/audio_control/simple_off.png';

  @override
  PuzzleLayoutDelegate get layoutDelegate => const SimplePuzzleLayoutDelegate();
}

final _baseStyle = Style(
    alignment: Alignment.center,
    childAlignment: Alignment.center,
    padding: const EdgeInsets.all(3),
    backgroundDecoration: const BoxDecoration(
        gradient:
            LinearGradient(colors: [Colors.cyanAccent, Colors.purpleAccent])),
    shadows: [
      const ShapeShadow(
          blurRadius: 25,
          gradient:
              LinearGradient(colors: [Colors.cyanAccent, Colors.purpleAccent]),
          offset: Offset(0, 0)),
    ],
    textStyle: DynamicTextStyle(
      letterSpacing: 1.toPXLength,
      fontSize: 30.toPXLength,
      fontFamily: "Beon",
      fontWeight: FontWeight.w700,
      color: Colors.white,
      shadows: [
        const Shadow(blurRadius: 5, color: Colors.white, offset: Offset(0, 0)),
        const Shadow(blurRadius: 20, color: Colors.white, offset: Offset(0, 0)),
        const Shadow(blurRadius: 1, color: Colors.white70, offset: Offset(0, 0))
      ],
    ),
    textAlign: TextAlign.center,
    //shaderGradient:
    //    LinearGradient(colors: [Colors.purpleAccent, Colors.cyanAccent]),
    mouseCursor: SystemMouseCursors.click);

abstract class _TileDimension {
  static Dimension small = Dimension.min(72.0.toPXLength, 100.toPercentLength);
  static Dimension medium =
      Dimension.min(100.0.toPXLength, 100.toPercentLength);
  static Dimension large = Dimension.min(112.0.toPXLength, 100.toPercentLength);
}
