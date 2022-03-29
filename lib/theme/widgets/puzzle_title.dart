import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:very_good_slide_puzzle/layout/layout.dart';
import 'package:very_good_slide_puzzle/theme/theme.dart';
import 'package:very_good_slide_puzzle/typography/typography.dart';
import 'package:very_good_slide_puzzle/helpers/helpers.dart';

import 'package:responsive_property/responsive_property.dart';

/// {@template puzzle_title}
/// Displays the title of the puzzle in the given color.
/// {@endtemplate}
class PuzzleTitle extends StatelessWidget {
  /// {@macro puzzle_title}
  const PuzzleTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  /// The title to be displayed.
  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = context.select((ThemeBloc bloc) => bloc.state.theme);
    final titleStyle = theme.titleTextStyle.toTextStyle(
        screenSize: MediaQuery.of(context).size,
        parentFontSize: DefaultTextStyle.of(context).style.fontSize ?? 14.0);

    double dilationFactor = context.getTimeDilation();

    return ResponsiveLayoutBuilder(
      small: (context, child) => Center(
        child: child,
      ),
      medium: (context, child) => Center(
        child: child,
      ),
      large: (context, child) => SizedBox(
        width: 350,
        child: child,
      ),
      child: (currentSize) {
        final textStyle = titleStyle.merge(Responsive({
              smallScreen: PuzzleTextStyle.headline4,
              middleScreen: PuzzleTextStyle.headline3,
              largeScreen: PuzzleTextStyle.headline2,
            }).resolve(context) ??
            PuzzleTextStyle.headline2);

        final textAlign = currentSize != ResponsiveLayoutSize.large
            ? TextAlign.center
            : TextAlign.left;

        return AnimatedDefaultTextStyle(
          style: textStyle,
          duration:
              PuzzleThemeAnimationDuration.textStyle.dilate(dilationFactor),
          child: Text(
            title,
            key: ValueKey(titleStyle),
            textAlign: textAlign,
          ),
        );
      },
    );
  }
}
