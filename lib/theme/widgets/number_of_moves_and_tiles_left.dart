import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:very_good_slide_puzzle/l10n/l10n.dart';
import 'package:very_good_slide_puzzle/layout/layout.dart';
import 'package:very_good_slide_puzzle/theme/theme.dart';
import 'package:very_good_slide_puzzle/typography/typography.dart';
import 'package:very_good_slide_puzzle/helpers/helpers.dart';

/// {@template number_of_moves_and_tiles_left}
/// Displays how many moves have been made on the current puzzle
/// and how many puzzle tiles are not in their correct position.
/// {@endtemplate}
class NumberOfMovesAndTilesLeft extends StatelessWidget {
  /// {@macro number_of_moves_and_tiles_left}
  const NumberOfMovesAndTilesLeft({
    Key? key,
    required this.numberOfMoves,
    required this.numberOfTilesLeft,
    this.color,
  }) : super(key: key);

  /// The number of moves to be displayed.
  final int numberOfMoves;

  /// The number of tiles left to be displayed.
  final int numberOfTilesLeft;

  /// The color of texts that display [numberOfMoves] and [numberOfTilesLeft].
  /// Defaults to [PuzzleTheme.defaultColor].
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final theme = context.select((ThemeBloc bloc) => bloc.state.theme);
    final l10n = context.l10n;
    final textStyle = theme.defaultTextStyle.toTextStyle(
        screenSize: MediaQuery.of(context).size,
        parentFontSize: DefaultTextStyle.of(context).style.fontSize ?? 14.0);

    double dilationFactor = context.getTimeDilation();

    return ResponsiveLayoutBuilder(
      small: (context, child) => child!,
      medium: (context, child) => child!,
      large: (context, child) => child!,
      child: (currentSize) {
        final mainAxisAlignment = currentSize == ResponsiveLayoutSize.large
            ? MainAxisAlignment.start
            : MainAxisAlignment.center;

        final bodyTextStyle = currentSize == ResponsiveLayoutSize.small
            ? PuzzleTextStyle.bodySmall
            : PuzzleTextStyle.body;

        return Semantics(
          label: l10n.puzzleNumberOfMovesAndTilesLeftLabelText(
            numberOfMoves.toString(),
            numberOfTilesLeft.toString(),
          ),
          child: ExcludeSemantics(
            child: Row(
              key: const Key('number_of_moves_and_tiles_left'),
              mainAxisAlignment: mainAxisAlignment,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                AnimatedDefaultTextStyle(
                  key: const Key('number_of_moves_and_tiles_left_moves'),
                  style: textStyle.merge(PuzzleTextStyle.headline4),
                  duration: PuzzleThemeAnimationDuration.textStyle
                      .dilate(dilationFactor),
                  child: Text(
                    numberOfMoves.toString(),
                    key: ValueKey(numberOfMoves),
                  ),
                ),
                AnimatedDefaultTextStyle(
                  style: textStyle.merge(bodyTextStyle),
                  duration: PuzzleThemeAnimationDuration.textStyle
                      .dilate(dilationFactor),
                  child: Text(' ${l10n.puzzleNumberOfMoves} | '),
                ),
                AnimatedDefaultTextStyle(
                  key: const Key('number_of_moves_and_tiles_left_tiles_left'),
                  style: textStyle.merge(PuzzleTextStyle.headline4),
                  duration: PuzzleThemeAnimationDuration.textStyle
                      .dilate(dilationFactor),
                  child: Text(
                    numberOfTilesLeft.toString(),
                    key: ValueKey(numberOfTilesLeft),
                  ),
                ),
                AnimatedDefaultTextStyle(
                  style: textStyle.merge(bodyTextStyle),
                  duration: PuzzleThemeAnimationDuration.textStyle
                      .dilate(dilationFactor),
                  child: Text(' ${l10n.puzzleNumberOfTilesLeft}'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
