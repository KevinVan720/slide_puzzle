import 'package:animated_styled_widget/animated_styled_widget.dart';
import 'package:flutter/material.dart';
import 'package:responsive_property/responsive_property.dart';
import 'package:very_good_slide_puzzle/layout/layout.dart';
import 'package:very_good_slide_puzzle/simple/simple.dart';
import 'package:very_good_slide_puzzle/theme/themes/themes.dart';

/// {@template simple_theme}
/// The simple puzzle theme.
/// {@endtemplate}
abstract class SimpleTheme extends PuzzleTheme {
  /// {@macro simple_theme}
  const SimpleTheme({this.luminance}) : super();

  @override
  bool get hasTimer => false;

  final ThemeLuminance? luminance;

  SimpleTheme copyWith({
    ThemeLuminance? luminance,
  });

  @override
  bool get useCupertinoIndicator => false;

  @override
  Curve get tileMoveAnimationCurve => Curves.easeInOut;

  @override
  Duration get tileMoveAnimationDuration =>
      PuzzleThemeAnimationDuration.puzzleTileTranslation;

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
  Responsive<Style> get popupMenuStyle => Responsive({allScreen: Style()});

  @override
  Responsive<Style> get popupMenuTileStyle => Responsive({allScreen: Style()});

  @override
  Responsive<Style> get popupMenuButtonStyle =>
      Responsive({allScreen: Style()});

  @override
  Responsive<Style> get popupMenuHoverStyle => Responsive({allScreen: Style()});

  @override
  Responsive<Style> get popupMenuPressedStyle =>
      Responsive({allScreen: Style()});

  @override
  Responsive<Style?> get popupMenuSliderThumbHoverStyle =>
      Responsive({allScreen: null});

  @override
  Responsive<Style?> get popupMenuSliderThumbPressedStyle =>
      Responsive({allScreen: null});

  @override
  Responsive<Style> get popupMenuSliderTrackStyle => Responsive({
        allScreen: Style(
          width: 80.toPercentLength,
          height: 2.toPXLength,
          backgroundDecoration: const BoxDecoration(color: Colors.blue),
        )
      });

  @override
  Responsive<Style?> get popupMenuSliderActiveTrackStyle =>
      Responsive({allScreen: null});

  @override
  Responsive<Style?> get popupMenuSliderTooltipStyle =>
      Responsive({allScreen: null});

  @override
  bool get isPopupMenuSliderThumbContained => false;

  @override
  String get tilePressSoundAsset => "assets/audio/tile_move.mp3";

  @override
  PuzzleLayoutDelegate get layoutDelegate => const SimplePuzzleLayoutDelegate();
}
