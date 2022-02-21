import 'dart:ui';

import 'package:animated_styled_widget/animated_styled_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:very_good_slide_puzzle/colors/colors.dart';
import 'package:very_good_slide_puzzle/layout/layout.dart';
import 'package:very_good_slide_puzzle/simple/simple.dart';
import 'package:very_good_slide_puzzle/theme/themes/themes.dart';
import 'package:responsive_property/responsive_property.dart';

/// {@template simple_theme}
/// The simple puzzle theme.
/// {@endtemplate}
abstract class SimpleTheme extends PuzzleTheme {
  /// {@macro simple_theme}
  const SimpleTheme() : super();

  @override
  String get name => 'Simple';

  @override
  bool get hasTimer => false;

  @override
  DynamicTextStyle get nameTextStyle;

  @override
  DynamicTextStyle get titleTextStyle;

  @override
  DynamicTextStyle get defaultTextStyle;

  @override
  Responsive<Style> get backgroundStyle;

  @override
  Responsive<Style> get buttonStyle;

  @override
  Responsive<Style> get hoverStyle;

  @override
  Responsive<Style> get pressedStyle;

  @override
  bool get isLogoColored;

  @override
  Color get menuActiveColor;

  @override
  Color get menuUnderlineColor;

  @override
  Color get menuInactiveColor;

  @override
  String get audioControlOnAsset => 'assets/images/audio_control/simple_on.png';

  @override
  String get audioControlOffAsset =>
      'assets/images/audio_control/simple_off.png';

  @override
  PuzzleLayoutDelegate get layoutDelegate => const SimplePuzzleLayoutDelegate();

  @override
  List<Object?> get props => [
        name,
        audioControlOnAsset,
        audioControlOffAsset,
        hasTimer,
        nameTextStyle,
        titleTextStyle,
        backgroundStyle,
        defaultTextStyle,
        buttonStyle,
        hoverStyle,
        pressedStyle,
        isLogoColored,
        menuActiveColor,
        menuUnderlineColor,
        menuInactiveColor,
        layoutDelegate,
      ];
}
