import 'package:very_good_slide_puzzle/layout/layout.dart';
import 'package:very_good_slide_puzzle/simple/simple.dart';
import 'package:very_good_slide_puzzle/theme/themes/themes.dart';
import 'package:responsive_property/responsive_property.dart';
import 'package:animated_styled_widget/animated_styled_widget.dart';

/// {@template simple_theme}
/// The simple puzzle theme.
/// {@endtemplate}
abstract class SimpleTheme extends PuzzleTheme {
  /// {@macro simple_theme}
  const SimpleTheme() : super();

  @override
  bool get hasTimer => false;

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
  PuzzleLayoutDelegate get layoutDelegate => const SimplePuzzleLayoutDelegate();
}
