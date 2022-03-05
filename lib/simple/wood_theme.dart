import 'package:animated_styled_widget/animated_styled_widget.dart';
import 'package:flutter/material.dart';
import 'package:responsive_property/responsive_property.dart';
import 'package:very_good_slide_puzzle/layout/layout.dart';
import 'package:very_good_slide_puzzle/simple/simple.dart';

/// {@template simple_theme}
/// The simple puzzle theme.
/// {@endtemplate}
class WoodTheme extends SimpleTheme {
  /// {@macro simple_theme}
  const WoodTheme() : super();

  @override
  @override
  Map<Locale, String> get name => {
        const Locale("en"): 'Wood',
        const Locale("es"): 'Madera',
        const Locale("zh"): "木质"
      };

  @override
  bool get hasTimer => false;

  @override
  DynamicTextStyle get nameTextStyle => DynamicTextStyle(
      letterSpacing: 1.toPXLength,
      fontSize: 40.toPXLength,
      fontFamily: "Pacifico-Regular",
      fontWeight: FontWeight.w700,
      color: const Color(0xFFC0A080).withOpacity(0.8),
      shadows: _engraveShadowLarge);

  @override
  DynamicTextStyle get titleTextStyle => DynamicTextStyle(
      letterSpacing: 2.toPXLength,
      fontSize: 40.toPXLength,
      fontFamily: "DSZierschrift",
      fontWeight: FontWeight.w900,
      color: Colors.black.withOpacity(0.7),
      shadows: _engraveShadowLarge);

  @override
  DynamicTextStyle get defaultTextStyle => DynamicTextStyle(
      letterSpacing: 1.toPXLength,
      fontSize: 40.toPXLength,
      fontFamily: "Pacifico-Regular",
      fontWeight: FontWeight.w700,
      color: const Color(0xFFC0A080).withOpacity(0.8),
      shadows: _engraveShadowLarge);

  @override
  Responsive<double> get tileSize => Responsive({
        smallScreen: 76,
        middleScreen: 106,
        largeScreen: 116,
      });

  @override
  Responsive<double> get tileGapSize => Responsive({
        smallScreen: 0,
        middleScreen: 0,
        largeScreen: 0,
      });

  @override
  Responsive<Style> get boardBackgroundStyle => Responsive({
        allScreen: Style(
            padding: const EdgeInsets.all(10),
            backgroundDecoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    colorFilter: ColorFilter.mode(
                        Colors.brown.shade300.withOpacity(0.4),
                        BlendMode.lighten),
                    image: const AssetImage('assets/images/wood_grain.png'))),
            shapeBorder: RoundedRectangleShapeBorder(
                borderRadius: DynamicBorderRadius.all(
                    DynamicRadius.circular(1.toPXLength)),
                borderSides: RectangleBorderSides.only(
                    bottom: DynamicBorderSide(
                        color: Colors.brown.shade400, width: 8),
                    top: const DynamicBorderSide(
                        gradient: LinearGradient(
                            colors: [
                              Color(0xFF311919),
                              Color(0xFF301818),
                            ],
                            stops: [
                              0,
                              0.8
                            ],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight),
                        width: 8),
                    right: const DynamicBorderSide(
                        gradient: LinearGradient(
                            colors: [
                              Color(0xFF5A3823),
                              Color(0xFF583420),
                            ],
                            stops: [
                              0,
                              0.8
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter),
                        width: 8),
                    left: const DynamicBorderSide(
                        gradient: LinearGradient(
                            colors: [
                              Color(0xFF483024),
                              Color(0xFF402020),
                            ],
                            stops: [
                              0,
                              0.8
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter),
                        width: 8))))
      });

  @override
  Responsive<Style> get backgroundStyle => Responsive({
        allScreen: Style(
            backgroundDecoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    colorFilter: ColorFilter.mode(
                        const Color(0xFF352525).withOpacity(0.5), BlendMode.darken),
                    image:
                        const AssetImage('assets/images/wood_background.jpg'))))
      });

  @override
  Responsive<Style> get buttonStyle => Responsive({
        smallScreen: _baseStyle.copyWith(
            width: _TileDimension.small,
            height: _TileDimension.small,
            textStyle: _baseStyle.textStyle?.copyWith(fontSize: 28.toPXLength),
            shapeBorder: RoundedRectangleShapeBorder(
                borderRadius: DynamicBorderRadius.all(
                    DynamicRadius.circular(1.toPXLength)),
                borderSides: RectangleBorderSides.only(
                    top: DynamicBorderSide(
                        gradient: LinearGradient(
                            colors: [
                              Colors.brown.shade200,
                              Colors.brown.shade300
                            ],
                            stops: const [
                              0,
                              0.5
                            ],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight),
                        width: 3),
                    bottom: const DynamicBorderSide(
                        gradient: LinearGradient(
                            colors: [
                              Color(0xFF311919),
                              Color(0xFF301818),
                            ],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight),
                        width: 6),
                    left: DynamicBorderSide(
                        gradient: LinearGradient(
                            colors: [
                              Colors.brown.shade500,
                              const Color(0xFF755144),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter),
                        width: 3.5),
                    right: const DynamicBorderSide(
                        gradient: LinearGradient(
                            colors: [
                              Color(0xFF322222),
                              Color(0xFF302020),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter),
                        width: 4)))),
        middleScreen: _baseStyle.copyWith(
            width: _TileDimension.medium,
            height: _TileDimension.medium,
            textStyle: _baseStyle.textStyle?.copyWith(fontSize: 32.toPXLength),
            shapeBorder: RoundedRectangleShapeBorder(
                borderRadius: DynamicBorderRadius.all(
                    DynamicRadius.circular(1.toPXLength)),
                borderSides: RectangleBorderSides.only(
                    top: DynamicBorderSide(
                        gradient: LinearGradient(
                            colors: [
                              Colors.brown.shade200,
                              Colors.brown.shade300
                            ],
                            stops: const [
                              0,
                              0.5
                            ],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight),
                        width: 4),
                    bottom: const DynamicBorderSide(
                        gradient: LinearGradient(
                            colors: [
                              Color(0xFF311919),
                              Color(0xFF301818),
                            ],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight),
                        width: 8),
                    left: DynamicBorderSide(
                        gradient: LinearGradient(
                            colors: [
                              Colors.brown.shade500,
                              const Color(0xFF755144),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter),
                        width: 4.5),
                    right: const DynamicBorderSide(
                        gradient: LinearGradient(
                            colors: [
                              Color(0xFF322222),
                              Color(0xFF302020),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter),
                        width: 5)))),
        largeScreen: _baseStyle.copyWith(
            width: _TileDimension.large,
            height: _TileDimension.large,
            shapeBorder: RoundedRectangleShapeBorder(
                borderRadius: DynamicBorderRadius.all(
                    DynamicRadius.circular(1.toPXLength)),
                borderSides: RectangleBorderSides.only(
                    top: DynamicBorderSide(
                        gradient: LinearGradient(
                            colors: [
                              Colors.brown.shade200,
                              Colors.brown.shade300
                            ],
                            stops: const [
                              0,
                              0.5
                            ],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight),
                        width: 5),
                    bottom: const DynamicBorderSide(
                        gradient: LinearGradient(
                            colors: [
                              Color(0xFF311919),
                              Color(0xFF301818),
                            ],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight),
                        width: 10),
                    left: DynamicBorderSide(
                        gradient: LinearGradient(
                            colors: [
                              Colors.brown.shade500,
                              const Color(0xFF755144),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter),
                        width: 5.5),
                    right: const DynamicBorderSide(
                        gradient: LinearGradient(
                            colors: [
                              Color(0xFF322222),
                              Color(0xFF302020),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter),
                        width: 6.5))))
      });

  @override
  Responsive<Style> get hoverStyle => buttonStyle;

  @override
  Responsive<Style> get pressedStyle => buttonStyle;

  @override
  bool get isLogoColored => false;

  @override
  DynamicTextStyle get menuActiveStyle => DynamicTextStyle(
        letterSpacing: 1.toPXLength,
        fontSize: 40.toPXLength,
        fontFamily: "Pacifico-Regular",
        fontWeight: FontWeight.w700,
        color: const Color(0xFFC0A080).withOpacity(0.8),
        shadows: _engraveShadowLarge,
        decoration: TextDecoration.underline,
        decorationColor: const Color(0xFFC0A080),
      );

  @override
  Color get menuUnderlineColor => const Color(0x00FFFFFF);

  @override
  Color get popupMenuBackgroundColor => Colors.brown.shade700;

  @override
  DynamicTextStyle get menuInactiveStyle => DynamicTextStyle(
        letterSpacing: 1.toPXLength,
        fontSize: 40.toPXLength,
        fontFamily: "Pacifico-Regular",
        fontWeight: FontWeight.w700,
        color: Colors.black,
        shadows: _engraveShadowSmall,
      );

  @override
  PuzzleLayoutDelegate get layoutDelegate => const SimplePuzzleLayoutDelegate();
}

final _baseStyle = Style(
    alignment: Alignment.center,
    childAlignment: Alignment.center,
    padding: const EdgeInsets.all(0),
    backgroundDecoration: BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.fill,
            colorFilter: ColorFilter.mode(
                const Color(0xFF403030).withOpacity(0.2), BlendMode.darken),
            image: const AssetImage('assets/images/wood_grain.png'))),
    textStyle: DynamicTextStyle(
        letterSpacing: 1.toPXLength,
        fontSize: 40.toPXLength,
        fontFamily: "Pacifico-Regular",
        fontWeight: FontWeight.w700,
        color: Colors.black.withOpacity(0.6),
        shadows: _engraveShadowSmall),
    textAlign: TextAlign.center,
    //shaderGradient:
    //    LinearGradient(colors: [Colors.purpleAccent, Colors.cyanAccent]),
    mouseCursor: SystemMouseCursors.click);

abstract class _TileDimension {
  static Dimension small = Dimension.min(76.0.toPXLength, 100.toPercentLength);
  static Dimension medium =
      Dimension.min(106.0.toPXLength, 100.toPercentLength);
  static Dimension large = Dimension.min(116.0.toPXLength, 100.toPercentLength);
}

List<Shadow> _engraveShadowSmall = [
  Shadow(
      blurRadius: 0.5,
      color: Colors.brown.shade900,
      offset: const Offset(1, 1)),
  Shadow(
      blurRadius: 0.5,
      color: Colors.brown.shade900,
      offset: const Offset(1, -1)),
  Shadow(
      blurRadius: 0.5,
      color: Colors.brown.shade900,
      offset: const Offset(-1, 1)),
  Shadow(
      blurRadius: 0.5,
      color: Colors.brown.shade900,
      offset: const Offset(-1, -1)),
  Shadow(
      blurRadius: 0.5,
      color: Colors.brown.shade900,
      offset: const Offset(1.414, 0)),
  Shadow(
      blurRadius: 0.5,
      color: Colors.brown.shade900,
      offset: const Offset(0, -1.414)),
  Shadow(
      blurRadius: 0.5,
      color: Colors.brown.shade900,
      offset: const Offset(-1.414, 0)),
  Shadow(
      blurRadius: 0.5,
      color: Colors.brown.shade900,
      offset: const Offset(0, 1.414))
];

List<Shadow> _engraveShadowLarge = [
  const Shadow(blurRadius: 0.5, color: Color(0xFF302018), offset: Offset(2, 2)),
  const Shadow(
      blurRadius: 0.5, color: Color(0xFF302018), offset: Offset(2, -2)),
  const Shadow(
      blurRadius: 0.5, color: Color(0xFF302018), offset: Offset(-2, 2)),
  const Shadow(
      blurRadius: 0.5, color: const Color(0xFF302018), offset: Offset(-2, -2)),
  const Shadow(blurRadius: 0.5, color: const Color(0xFF302018), offset: Offset(2.818, 0)),
  const Shadow(
      blurRadius: 0.5, color: Color(0xFF302018), offset: Offset(0, -2.818)),
  const Shadow(
      blurRadius: 0.5, color: const Color(0xFF302018), offset: Offset(-2.818, 0)),
  const Shadow(
      blurRadius: 0.5, color: Color(0xFF302018), offset: Offset(0, 2.818))
];
