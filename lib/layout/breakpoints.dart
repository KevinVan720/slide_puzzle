import 'package:responsive_property/responsive_property.dart';

/// Defines the breakpoints for the puzzle UI.
abstract class PuzzleBreakpoints {
  /// Max width for a small layout.
  static const double small = 576;

  /// Max width for a medium layout.
  static const double medium = 1280;

  /// Max width for a large layout.
  static const double large = 1440;
}

const smallScreen = ScreenScope(maxWidth: 576);

const middleScreen = ScreenScope(minWidth: 576, maxWidth: 1280);

const largeScreen = ScreenScope(minWidth: 1280);

const allScreen = ScreenScope(minWidth: 0);
