import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:very_good_slide_puzzle/layout/layout.dart';
import 'package:very_good_slide_puzzle/theme/theme.dart';
import 'package:very_good_slide_puzzle/typography/typography.dart';

/// {@template puzzle_title}
/// Displays the title of the puzzle in the given color.
/// {@endtemplate}
class PuzzleTitle extends StatelessWidget {
  /// {@macro puzzle_title}
  const PuzzleTitle({
    Key? key,
    required this.title,
    this.color,
  }) : super(key: key);

  /// The title to be displayed.
  final String title;

  /// The color of [title], defaults to [PuzzleTheme.titleColor].
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final theme = context.select((ThemeBloc bloc) => bloc.state.theme);
    final titleStyle = theme.titleTextStyle.toTextStyle(
        screenSize: MediaQuery.of(context).size,
        parentFontSize: DefaultTextStyle.of(context).style.fontSize ?? 14.0);

    return ResponsiveLayoutBuilder(
      small: (context, child) => Center(
        child: SizedBox(
          width: 300,
          child: Center(
            child: child,
          ),
        ),
      ),
      medium: (context, child) => Center(
        child: child,
      ),
      large: (context, child) => SizedBox(
        width: 350,
        child: child,
      ),
      child: (currentSize) {
        final textStyle = titleStyle.merge(
            currentSize == ResponsiveLayoutSize.large
                ? PuzzleTextStyle.headline2
                : PuzzleTextStyle.headline3);

        final textAlign = currentSize != ResponsiveLayoutSize.large
            ? TextAlign.center
            : TextAlign.left;

        return AnimatedDefaultTextStyle(
          style: textStyle,
          duration: PuzzleThemeAnimationDuration.textStyle,
          child: Text(
            title,
            textAlign: textAlign,
          ),
        );
      },
    );
  }
}