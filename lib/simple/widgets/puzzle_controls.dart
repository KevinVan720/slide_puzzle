import 'dart:async';

import 'package:animated_styled_widget/animated_styled_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import 'package:responsive_property/responsive_property.dart';
import 'package:very_good_slide_puzzle/l10n/l10n.dart';
import 'package:very_good_slide_puzzle/layout/layout.dart';
import 'package:very_good_slide_puzzle/models/models.dart';
import 'package:very_good_slide_puzzle/puzzle/puzzle.dart';
import 'package:very_good_slide_puzzle/puzzle_solver/puzzle_solver.dart';

import 'package:very_good_slide_puzzle/theme/theme.dart';
import 'package:very_good_slide_puzzle/typography/typography.dart';
import 'package:very_good_slide_puzzle/game_config/game_config.dart';

/// {@template puzzle_shuffle_button}
/// Displays the button to shuffle the puzzle.
/// {@endtemplate}
@visibleForTesting
class SimplePuzzleShuffleButton extends StatelessWidget {
  /// {@macro puzzle_shuffle_button}
  const SimplePuzzleShuffleButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PuzzleButton(onPressed: () {
      context.read<PuzzleBloc>().add(const PuzzleReset(null));
    }, child: Builder(builder: (context) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.refresh_sharp,
            size: 17,
            color: DefaultTextStyle.of(context).style.color,
          ),
          const Gap(10),
          Text(context.l10n.puzzleShuffle),
        ],
      );
    }));
  }
}

class SimplePuzzleDifficultySelectButton extends StatelessWidget {
  const SimplePuzzleDifficultySelectButton({Key? key, required this.difficulty})
      : super(key: key);

  final PuzzleDifficulty difficulty;

  @override
  Widget build(BuildContext context) {
    final theme = context.select((ThemeBloc bloc) => bloc.state.theme);

    final gameConfig = context.select((GameConfigBloc bloc) => bloc.state);
    final selectedStyle = theme.menuActiveStyle.toTextStyle(
        screenSize: MediaQuery.of(context).size,
        parentFontSize: DefaultTextStyle.of(context).style.fontSize ?? 14.0);
    final unselectedStyle = theme.menuInactiveStyle.toTextStyle(
        screenSize: MediaQuery.of(context).size,
        parentFontSize: DefaultTextStyle.of(context).style.fontSize ?? 14.0);
    return TextButton(
      style: ButtonStyle(
          overlayColor: MaterialStateProperty.all(Colors.transparent)),
      onPressed: gameConfig.puzzleDifficulty == difficulty
          ? null
          : () {
              context
                  .read<GameConfigBloc>()
                  .add(PuzzleSetDifficulty(difficulty));
            },
      child: AnimatedDefaultTextStyle(
        style: gameConfig.puzzleDifficulty == difficulty
            ? selectedStyle.merge(PuzzleTextStyle.bodySmall)
            : unselectedStyle.merge(PuzzleTextStyle.bodySmall),
        duration: PuzzleThemeAnimationDuration.textStyle,
        child: difficulty == PuzzleDifficulty.easy
            ? Text(context.l10n.puzzleDifficultyEasy)
            : Text(context.l10n.puzzleDifficultyHard),
      ),
    );
  }
}

class SimplePuzzleSizeSelectButton extends StatelessWidget {
  const SimplePuzzleSizeSelectButton({Key? key, required this.size})
      : super(key: key);

  final int size;

  @override
  Widget build(BuildContext context) {
    final theme = context.select((ThemeBloc bloc) => bloc.state.theme);
    final gameConfig = context.select((GameConfigBloc bloc) => bloc.state);
    final selectedStyle = theme.menuActiveStyle.toTextStyle(
        screenSize: MediaQuery.of(context).size,
        parentFontSize: DefaultTextStyle.of(context).style.fontSize ?? 14.0);
    final unselectedStyle = theme.menuInactiveStyle.toTextStyle(
        screenSize: MediaQuery.of(context).size,
        parentFontSize: DefaultTextStyle.of(context).style.fontSize ?? 14.0);
    return TextButton(
      style: ButtonStyle(
          overlayColor: MaterialStateProperty.all(Colors.transparent)),
      onPressed: gameConfig.puzzleSize == size
          ? null
          : () {
              context.read<GameConfigBloc>().add(PuzzleSetSize(size));
            },
      child: AnimatedDefaultTextStyle(
        style: gameConfig.puzzleSize == size
            ? selectedStyle.merge(PuzzleTextStyle.bodySmall)
            : unselectedStyle.merge(PuzzleTextStyle.bodySmall),
        duration: PuzzleThemeAnimationDuration.textStyle,
        child: Text(size.toString() + "×" + size.toString()),
      ),
    );
  }
}

class SimplePuzzleSolveButton extends StatefulWidget {
  const SimplePuzzleSolveButton({Key? key}) : super(key: key);

  @override
  State<SimplePuzzleSolveButton> createState() =>
      _SimplePuzzleSolveButtonState();
}

class _SimplePuzzleSolveButtonState extends State<SimplePuzzleSolveButton> {
  ///The async process of solving and updating the puzzle

  Future<void>? getSolutionAndUpdatePuzzle;

  @override
  Widget build(BuildContext context) {
    final state = context.select((PuzzleBloc bloc) => bloc.state);
    final theme = context.select((ThemeBloc bloc) => bloc.state.theme);

    return state.puzzle.isComplete()
        ? PuzzleAnimatedContainer(
            style: theme.buttonStyle.resolve(context) ?? Style(),
            child: _solvedRow(),
          )
        : FutureBuilder<void>(
            future: getSolutionAndUpdatePuzzle,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.none) {
                return PuzzleButton(onPressed: () async {
                  setState(() {
                    getSolutionAndUpdatePuzzle = _solvePuzzle(state.puzzle);
                  });
                }, child: Builder(builder: (context) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.question_mark,
                        size: 16,
                        color: DefaultTextStyle.of(context).style.color,
                      ),
                      const Gap(10),
                      Text(context.l10n.puzzleSolve),
                    ],
                  );
                }));
              }

              Style? style;
              Widget row;

              if (snapshot.hasError) {
                style = theme.buttonStyle.resolve(context);
                row = _noSolutionRow();
              } else if (snapshot.hasData) {
                style = theme.buttonStyle.resolve(context);
                row = _solvedRow();
              } else {
                style = theme.pressedStyle.resolve(context);
                row = _solvingRow();
              }

              return PuzzleAnimatedContainer(
                style: style ?? Style(),
                child: row,
              );
            });
  }

  ///The actual computation of solving the puzzle
  ///The compute() method on the web is not working as expected so the UI would block.
  static List<Puzzle> _solvePuzzleComputation(Puzzle puzzle) {
    var solver = PuzzleSolver(
        startPuzzle: puzzle, heuristic: const ManhattanHeuristic());
    List<Puzzle> rst = solver.IDAstar().keys.toList();
    rst.removeAt(0);
    return rst;
  }

  Future<void> _solvePuzzle(Puzzle puzzle) async {
    List<List<Tile>> history = removeRedundantMoves(puzzle.tilesHistory.reversed
        .map((e) => e
          ..toList()
          ..sort((tileA, tileB) {
            return tileA.currentPosition.compareTo(tileB.currentPosition);
          }))
        .toList());

    ///Only the last 20 steps or so are solved by IDA*, the previous moves just rewind
    ///I do this because the IDA* method can be really slow on some puzzle config which
    ///will behave terrible on the web because the compute method is not working on the
    ///web right now.
    int relaxMoves = 16;

    if (history.length > relaxMoves) {
      int rewindMoves = history.length - relaxMoves;
      puzzle = Puzzle(tiles: history[rewindMoves - 1]);
    }

    context.read<PuzzleBloc>().add(const PuzzleAutoSolvingUpdate(true));

    await compute(_solvePuzzleComputation, puzzle).then((value) async {
      ///Rewind the puzzle until the move from the solution is not too far away
      if (history.length > relaxMoves) {
        int rewindMoves = history.length - relaxMoves;
        history = history.sublist(0, rewindMoves) +
            value.map((e) => e.tiles).toList();
        history = removeRedundantMoves(history);
      } else {
        history = value.map((e) => e.tiles).toList();
      }

      ///push the puzzle states with 1 sec interval
      await Future.forEach(
          history,
          (List<Tile> tiles) =>
              Future.delayed(const Duration(milliseconds: 1000), () {
                context
                    .read<PuzzleBloc>()
                    .add(PuzzleReset(Puzzle(tiles: tiles)));
              }));
    });

    context.read<PuzzleBloc>().add(const PuzzleAutoSolvingUpdate(false));

    setState(() {
      getSolutionAndUpdatePuzzle = null;
    });
  }

  ///When generate a puzzle, some config in the history may be the same, we can remove the puzzles between
  ///two same puzzle config
  List<List<Tile>> removeRedundantMoves(List<List<Tile>> history) {
    int i = 0;
    while (i < history.length) {
      int lastId = history.lastIndexWhere((e) => listEquals(e, history[i]));
      //print(i.toString() + ", " + lastId.toString());
      if (lastId != -1 && lastId != i) {
        history = history.sublist(0, i) + history.sublist(lastId);
        i = 0;
      } else {
        i += 1;
      }
    }
    return history;
  }

  Widget _solvedRow() {
    return Builder(builder: (context) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.check,
            size: 20,
            color: DefaultTextStyle.of(context).style.color,
          ),
          const Gap(10),
          Text(context.l10n.puzzleSolved),
        ],
      );
    });
  }

  Widget _solvingRow() {
    return Builder(builder: (context) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              width: 18,
              height: 18,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: DefaultTextStyle.of(context).style.color,
              )),
          const Gap(10),
          Text(context.l10n.puzzleSolving),
        ],
      );
    });
  }

  Widget _noSolutionRow() {
    return Builder(builder: (context) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error,
            size: 20,
            color: DefaultTextStyle.of(context).style.color,
          ),
          const Gap(10),
          Text(context.l10n.puzzleSolveError),
        ],
      );
    });
  }
}

class SimplePuzzleControls extends StatelessWidget {
  const SimplePuzzleControls({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: Responsive({
            smallScreen: CrossAxisAlignment.center,
            middleScreen: CrossAxisAlignment.center,
            largeScreen: CrossAxisAlignment.start
          }).resolve(context) ??
          CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            SimplePuzzleDifficultySelectButton(
                difficulty: PuzzleDifficulty.easy),
            SimplePuzzleDifficultySelectButton(
                difficulty: PuzzleDifficulty.hard),
          ],
        ),
        const ResponsiveGap(
          small: 20,
          medium: 20,
          large: 32,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            SimplePuzzleSizeSelectButton(size: 3),
            SimplePuzzleSizeSelectButton(size: 4),
            SimplePuzzleSizeSelectButton(size: 5),
          ],
        ),
        const ResponsiveGap(
          small: 20,
          medium: 20,
          large: 32,
        ),
        const SimplePuzzleShuffleButton(),
        const ResponsiveGap(
          small: 20,
          medium: 20,
          large: 32,
        ),
        const SimplePuzzleSolveButton(),
      ],
    );
  }
}
