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
        smallScreen: defaultBaseStyle.copyWith(
          width: 72.0.toPXLength,
          height: 72.0.toPXLength,
          textStyle: DynamicTextStyle(
            letterSpacing: 1.toPXLength,
            fontSize: 28.toPXLength,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
          backgroundDecoration:
              const BoxDecoration(color: PuzzleColors.primary6),
        ),
        middleScreen: defaultBaseStyle.copyWith(
          width: 100.0.toPXLength,
          height: 100.0.toPXLength,
          textStyle: DynamicTextStyle(
            letterSpacing: 1.toPXLength,
            fontSize: 32.toPXLength,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
          backgroundDecoration:
              const BoxDecoration(color: PuzzleColors.primary6),
        ),
        largeScreen: defaultBaseStyle.copyWith(
          width: 112.0.toPXLength,
          height: 112.0.toPXLength,
          textStyle: DynamicTextStyle(
            letterSpacing: 1.toPXLength,
            fontSize: 36.toPXLength,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
          backgroundDecoration:
              const BoxDecoration(color: PuzzleColors.primary6),
        ),
      });

  @override
  Responsive<Style> get hoverStyle => Responsive({
        smallScreen: defaultBaseStyle.copyWith(
          width: 72.0.toPXLength,
          height: 72.0.toPXLength,
          textStyle: DynamicTextStyle(
            letterSpacing: 1.toPXLength,
            fontSize: 28.toPXLength,
            fontWeight: FontWeight.w900,
            color: Colors.grey.shade50,
          ),
          backgroundDecoration:
              const BoxDecoration(color: PuzzleColors.primary5),
        ),
        middleScreen: defaultBaseStyle.copyWith(
          width: 100.0.toPXLength,
          height: 100.0.toPXLength,
          textStyle: DynamicTextStyle(
            letterSpacing: 1.toPXLength,
            fontSize: 32.toPXLength,
            fontWeight: FontWeight.w900,
            color: Colors.grey.shade50,
          ),
          backgroundDecoration:
              const BoxDecoration(color: PuzzleColors.primary5),
        ),
        largeScreen: defaultBaseStyle.copyWith(
          width: 112.0.toPXLength,
          height: 112.0.toPXLength,
          textStyle: DynamicTextStyle(
            letterSpacing: 1.toPXLength,
            fontSize: 36.toPXLength,
            fontWeight: FontWeight.w900,
            color: Colors.grey.shade50,
          ),
          backgroundDecoration:
              const BoxDecoration(color: PuzzleColors.primary5),
        ),
      });

  @override
  Responsive<Style> get pressedStyle => Responsive({
        smallScreen: defaultBaseStyle.copyWith(
          width: 72.0.toPXLength,
          height: 72.0.toPXLength,
          textStyle: DynamicTextStyle(
            letterSpacing: 1.toPXLength,
            fontSize: 28.toPXLength,
            fontWeight: FontWeight.w900,
            color: Colors.grey.shade50,
          ),
          backgroundDecoration:
              const BoxDecoration(color: PuzzleColors.primary4),
        ),
        middleScreen: defaultBaseStyle.copyWith(
          width: 100.0.toPXLength,
          height: 100.0.toPXLength,
          textStyle: DynamicTextStyle(
            letterSpacing: 1.toPXLength,
            fontSize: 32.toPXLength,
            fontWeight: FontWeight.w900,
            color: Colors.grey.shade50,
          ),
          backgroundDecoration:
              const BoxDecoration(color: PuzzleColors.primary4),
        ),
        largeScreen: defaultBaseStyle.copyWith(
          width: 112.0.toPXLength,
          height: 112.0.toPXLength,
          textStyle: DynamicTextStyle(
            letterSpacing: 1.toPXLength,
            fontSize: 36.toPXLength,
            fontWeight: FontWeight.w900,
            color: Colors.grey.shade50,
          ),
          backgroundDecoration:
              const BoxDecoration(color: PuzzleColors.primary4),
        ),
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
  String get audioControlOnAsset => 'assets/images/audio_control/simple_on.png';

  @override
  String get audioControlOffAsset =>
      'assets/images/audio_control/simple_off.png';

  @override
  PuzzleLayoutDelegate get layoutDelegate => const SimplePuzzleLayoutDelegate();
}

final defaultBaseStyle = Style(
    alignment: Alignment.center,
    childAlignment: Alignment.center,
    backgroundDecoration: const BoxDecoration(color: PuzzleColors.primary6),
    shapeBorder: const RoundedRectangleShapeBorder(
        borderRadius: DynamicBorderRadius.all(
            DynamicRadius.circular(Length(10, unit: LengthUnit.px)))),
    mouseCursor: SystemMouseCursors.click);
