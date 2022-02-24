import 'dart:ui';

import 'package:animated_styled_widget/animated_styled_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:neon/neon.dart';
import 'package:very_good_slide_puzzle/colors/colors.dart';
import 'package:very_good_slide_puzzle/layout/layout.dart';
import 'package:very_good_slide_puzzle/simple/simple.dart';
import 'package:very_good_slide_puzzle/theme/themes/themes.dart';
import 'package:responsive_property/responsive_property.dart';
import 'package:flutter/material.dart';

/// {@template simple_theme}
/// The simple puzzle theme.
/// {@endtemplate}
class KeyboardTheme extends SimpleTheme {
  /// {@macro simple_theme}
  const KeyboardTheme() : super();

  @override
  String get name => 'Keyboard';

  @override
  bool get hasTimer => false;

  @override
  DynamicTextStyle get nameTextStyle =>
      DynamicTextStyle(color: PuzzleColors.grey1);

  @override
  DynamicTextStyle get titleTextStyle => DynamicTextStyle(
      color: Colors.teal.shade100,
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.bold);

  @override
  DynamicTextStyle get defaultTextStyle => DynamicTextStyle(
      color: PuzzleColors.green50,
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.bold);

  @override
  Responsive<Style> get backgroundStyle => Responsive({
    allScreen: Style(
      backgroundDecoration: BoxDecoration(color: Colors.redAccent),
    ),
  });

  @override
  Responsive<Style> get buttonStyle => Responsive({
    smallScreen: keyBaseStyle.copyWith(
      width: 72.0.toPXLength,
      height: 72.0.toPXLength,
      textStyle: DynamicTextStyle(
          fontSize: 20.toPXLength,
          color: Colors.teal,
          fontWeight: FontWeight.w800),
    ),
    middleScreen: keyBaseStyle.copyWith(
      width: 100.0.toPXLength,
      height: 100.0.toPXLength,
      textStyle: DynamicTextStyle(
          fontSize: 24.toPXLength,
          color: Colors.teal,
          fontWeight: FontWeight.w800),
    ),
    largeScreen: keyBaseStyle.copyWith(
      width: 112.0.toPXLength,
      height: 112.0.toPXLength,
    )
  });

  @override
  Responsive<Style> get hoverStyle => Responsive({
    smallScreen: keyBaseStyle.copyWith(
      width: 72.0.toPXLength,
      height: 72.0.toPXLength,
      textStyle: DynamicTextStyle(
          fontSize: 20.toPXLength,
          color: Colors.teal,
          fontWeight: FontWeight.w800),
      shadows: [
        ShapeShadow(
            blurRadius: 10,
            spreadRadius: 1,
            color: Colors.grey.shade700,
            offset: Offset(0, 10)),
        ShapeShadow(
            blurRadius: 0, color: Colors.teal, offset: Offset(0, 11)),
        ShapeShadow(
            blurRadius: 0,
            spreadRadius: -1,
            gradient: LinearGradient(colors: [
              Colors.tealAccent.shade400,
              Colors.tealAccent.shade700
            ], begin: Alignment.centerLeft, end: Alignment.centerRight),
            offset: Offset(0, 10)),
      ],
      transform: SmoothMatrix4()..translate(0.toPXLength, -11.toPXLength),
    ),
    middleScreen: keyBaseStyle.copyWith(
      width: 100.0.toPXLength,
      height: 100.0.toPXLength,
      textStyle: DynamicTextStyle(
          fontSize: 24.toPXLength,
          color: Colors.teal,
          fontWeight: FontWeight.w800),
      shadows: [
        ShapeShadow(
            blurRadius: 10,
            spreadRadius: 1,
            color: Colors.grey.shade700,
            offset: Offset(0, 10)),
        ShapeShadow(
            blurRadius: 0, color: Colors.teal, offset: Offset(0, 11)),
        ShapeShadow(
            blurRadius: 0,
            spreadRadius: -1,
            gradient: LinearGradient(colors: [
              Colors.tealAccent.shade400,
              Colors.tealAccent.shade700
            ], begin: Alignment.centerLeft, end: Alignment.centerRight),
            offset: Offset(0, 10)),
      ],
      transform: SmoothMatrix4()..translate(0.toPXLength, -11.toPXLength),
    ),
    largeScreen: keyBaseStyle.copyWith(
      width: 112.0.toPXLength,
      height: 112.0.toPXLength,
      shadows: [
        ShapeShadow(
            blurRadius: 10,
            spreadRadius: 1,
            color: Colors.grey.shade700,
            offset: Offset(0, 10)),
        ShapeShadow(
            blurRadius: 0, color: Colors.teal, offset: Offset(0, 11)),
        ShapeShadow(
            blurRadius: 0,
            spreadRadius: -1,
            gradient: LinearGradient(colors: [
              Colors.tealAccent.shade400,
              Colors.tealAccent.shade700
            ], begin: Alignment.centerLeft, end: Alignment.centerRight),
            offset: Offset(0, 10)),
      ],
      transform: SmoothMatrix4()..translate(0.toPXLength, -11.toPXLength),
    )
  });

  @override
  Responsive<Style> get pressedStyle => Responsive({
    smallScreen: keyBaseStyle.copyWith(
      width: 72.0.toPXLength,
      height: 72.0.toPXLength,
      textStyle: DynamicTextStyle(
          fontSize: 20.toPXLength,
          color: Colors.teal,
          fontWeight: FontWeight.w800),
      shadows: [
        ShapeShadow(
            blurRadius: 3,
            spreadRadius: 1,
            color: Colors.grey.shade700,
            offset: Offset(0, 3)),
        ShapeShadow(
            blurRadius: 0, color: Colors.teal, offset: Offset(0, 2)),
        ShapeShadow(
            blurRadius: 0,
            spreadRadius: -1,
            gradient: LinearGradient(colors: [
              Colors.tealAccent.shade400,
              Colors.tealAccent.shade700
            ], begin: Alignment.centerLeft, end: Alignment.centerRight),
            offset: Offset(0, 1)),
      ],
      transform: SmoothMatrix4()..translate(0.toPXLength, -2.toPXLength),
    ),
    middleScreen: keyBaseStyle.copyWith(
      width: 100.0.toPXLength,
      height: 100.0.toPXLength,
      textStyle: DynamicTextStyle(
          fontSize: 24.toPXLength,
          color: Colors.teal,
          fontWeight: FontWeight.w800),
      shadows: [
        ShapeShadow(
            blurRadius: 3,
            spreadRadius: 1,
            color: Colors.grey.shade700,
            offset: Offset(0, 3)),
        ShapeShadow(
            blurRadius: 0, color: Colors.teal, offset: Offset(0, 2)),
        ShapeShadow(
            blurRadius: 0,
            spreadRadius: -1,
            gradient: LinearGradient(colors: [
              Colors.tealAccent.shade400,
              Colors.tealAccent.shade700
            ], begin: Alignment.centerLeft, end: Alignment.centerRight),
            offset: Offset(0, 1)),
      ],
      transform: SmoothMatrix4()..translate(0.toPXLength, -2.toPXLength),
    ),
    largeScreen: keyBaseStyle.copyWith(
      width: 112.0.toPXLength,
      height: 112.0.toPXLength,
      shadows: [
        ShapeShadow(
            blurRadius: 3,
            spreadRadius: 1,
            color: Colors.grey.shade700,
            offset: Offset(0, 3)),
        ShapeShadow(
            blurRadius: 0, color: Colors.teal, offset: Offset(0, 2)),
        ShapeShadow(
            blurRadius: 0,
            spreadRadius: -1,
            gradient: LinearGradient(colors: [
              Colors.tealAccent.shade400,
              Colors.tealAccent.shade700
            ], begin: Alignment.centerLeft, end: Alignment.centerRight),
            offset: Offset(0, 1)),
      ],
      transform: SmoothMatrix4()..translate(0.toPXLength, -2.toPXLength),
    )
  });

  @override
  bool get isLogoColored => false;

  @override
  DynamicTextStyle get menuActiveStyle =>
      DynamicTextStyle(color: PuzzleColors.black, fontWeight: FontWeight.bold);

  @override
  Color get menuUnderlineColor => Colors.teal;

  @override
  DynamicTextStyle get menuInactiveStyle =>
      DynamicTextStyle(color: PuzzleColors.grey3);

  @override
  String get audioControlOnAsset => 'assets/images/audio_control/simple_on.png';

  @override
  String get audioControlOffAsset =>
      'assets/images/audio_control/simple_off.png';

  @override
  PuzzleLayoutDelegate get layoutDelegate => const SimplePuzzleLayoutDelegate();
}

final keyBaseStyle = Style(
    alignment: Alignment.center,
    padding: EdgeInsets.symmetric(vertical: 20),
    backgroundDecoration: BoxDecoration(color: Colors.tealAccent.shade100),
    shapeBorder: RectangleShapeBorder(
        borderRadius:
        DynamicBorderRadius.all(DynamicRadius.circular(20.toPXLength)),
        border: DynamicBorderSide(width: 1, color: Colors.teal)),
    shadows: [
      ShapeShadow(
          blurRadius: 10,
          spreadRadius: 1,
          color: Colors.grey.shade700,
          offset: Offset(0, 14)),
      ShapeShadow(blurRadius: 0, color: Colors.teal, offset: Offset(0, 15)),
      ShapeShadow(
          blurRadius: 0,
          spreadRadius: -1,
          gradient: LinearGradient(
              colors: [Colors.tealAccent.shade400, Colors.tealAccent.shade700],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight),
          offset: Offset(0, 14)),
    ],
    transform: SmoothMatrix4()..translate(0.toPXLength, -15.toPXLength),
    textStyle: DynamicTextStyle(
        fontSize: 28.toPXLength,
        color: Colors.teal,
        fontWeight: FontWeight.w900),
    textAlign: TextAlign.center,
    mouseCursor: SystemMouseCursors.click);

