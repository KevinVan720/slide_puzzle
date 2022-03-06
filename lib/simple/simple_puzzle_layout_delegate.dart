import 'dart:async';

import 'package:animated_styled_widget/animated_styled_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:just_audio/just_audio.dart';
import 'package:responsive_property/responsive_property.dart';
import 'package:very_good_slide_puzzle/audio_control/audio_control.dart';
import 'package:very_good_slide_puzzle/helpers/audio_player.dart';
import 'package:very_good_slide_puzzle/l10n/l10n.dart';
import 'package:very_good_slide_puzzle/layout/layout.dart';
import 'package:very_good_slide_puzzle/models/models.dart';
import 'package:very_good_slide_puzzle/puzzle/puzzle.dart';
import 'package:very_good_slide_puzzle/puzzle_solver/puzzle_solver.dart';
import 'package:very_good_slide_puzzle/simple/simple.dart';
import 'package:very_good_slide_puzzle/theme/theme.dart';
import 'package:very_good_slide_puzzle/typography/typography.dart';
import 'package:very_good_slide_puzzle/game_config/game_config.dart';

/// {@template simple_puzzle_layout_delegate}
/// A delegate for computing the layout of the puzzle UI
/// that uses a [SimpleTheme].
/// {@endtemplate}
class SimplePuzzleLayoutDelegate extends PuzzleLayoutDelegate {
  /// {@macro simple_puzzle_layout_delegate}
  const SimplePuzzleLayoutDelegate();

  @override
  Widget startSectionBuilder(PuzzleState state) {
    return ResponsiveLayoutBuilder(
      small: (_, child) => child!,
      medium: (_, child) => child!,
      large: (_, child) => Padding(
        padding: const EdgeInsets.only(left: 50, right: 32),
        child: child,
      ),
      child: (_) => SimpleStartSection(state: state),
    );
  }

  @override
  Widget endSectionBuilder(PuzzleState state) {
    return Column(
      children: [
        const ResponsiveGap(
          small: 32,
          medium: 48,
        ),
        ResponsiveLayoutBuilder(
          small: (_, child) => const SimplePuzzleControls(
            key: Key('simple_puzzle_controls'),
          ),
          medium: (_, child) => const SimplePuzzleControls(
            key: Key('simple_puzzle_controls'),
          ),
          large: (_, __) => const SizedBox(),
        ),
        const ResponsiveGap(
          small: 32,
          medium: 48,
        ),
      ],
    );
  }

  @override
  Widget backgroundBuilder(PuzzleState state) {
    return Container();
  }

  @override
  Widget boardBuilder(int size, List<Widget> tiles) {
    return Column(
      children: [
        const ResponsiveGap(
          small: 32,
          medium: 48,
          large: 96,
        ),
        SimplePuzzleBoard(
          //key: const Key('simple_puzzle_board_large'),
          size: size,
          tiles: tiles,
        ),
        const ResponsiveGap(
          large: 96,
        ),
      ],
    );
  }

  @override
  Widget tileBuilder(Tile tile, PuzzleState state) {
    return ResponsiveLayoutBuilder(
      small: (_, __) => SimplePuzzleTile(
        key: Key('simple_puzzle_tile_${tile.value}_small'),
        tile: tile,
        tileFontSize: _TileFontSize.small,
        state: state,
      ),
      medium: (_, __) => SimplePuzzleTile(
        key: Key('simple_puzzle_tile_${tile.value}_medium'),
        tile: tile,
        tileFontSize: _TileFontSize.medium,
        state: state,
      ),
      large: (_, __) => SimplePuzzleTile(
        key: Key('simple_puzzle_tile_${tile.value}_large'),
        tile: tile,
        tileFontSize: _TileFontSize.large,
        state: state,
      ),
    );
  }

  @override
  Widget whitespaceTileBuilder() {
    return const SizedBox();
  }

  @override
  List<Object?> get props => [];
}

/// {@template simple_start_section}
/// Displays the start section of the puzzle based on [state].
/// {@endtemplate}
@visibleForTesting
class SimpleStartSection extends StatelessWidget {
  /// {@macro simple_start_section}
  const SimpleStartSection({
    Key? key,
    required this.state,
  }) : super(key: key);

  /// The state of the puzzle.
  final PuzzleState state;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ResponsiveGap(
          small: 20,
          medium: 43,
          large: 101,
        ),
        PuzzleName(
          key: puzzleNameKey,
        ),
        const ResponsiveGap(large: 16),
        SimplePuzzleTitle(
          status: state.puzzleStatus,
        ),
        const ResponsiveGap(
          small: 12,
          medium: 16,
          large: 32,
        ),
        NumberOfMovesAndTilesLeft(
          key: numberOfMovesAndTilesLeftKey,
          numberOfMoves: state.numberOfMoves,
          numberOfTilesLeft: state.numberOfTilesLeft,
        ),
        const ResponsiveGap(
          small: 12,
          medium: 16,
          large: 32,
        ),
        ResponsiveLayoutBuilder(
          small: (_, __) => const SizedBox(),
          medium: (_, __) => const SizedBox(),
          large: (_, __) => const SimplePuzzleControls(
            key: Key('simple_puzzle_controls'),
          ),
        ),
      ],
    );
  }
}

/// {@template simple_puzzle_title}
/// Displays the title of the puzzle based on [status].
///
/// Shows the success state when the puzzle is completed,
/// otherwise defaults to the Puzzle Challenge title.
/// {@endtemplate}
@visibleForTesting
class SimplePuzzleTitle extends StatelessWidget {
  /// {@macro simple_puzzle_title}
  const SimplePuzzleTitle({
    Key? key,
    required this.status,
  }) : super(key: key);

  /// The status of the puzzle.
  final PuzzleStatus status;

  @override
  Widget build(BuildContext context) {
    return PuzzleTitle(
      key: puzzleTitleKey,
      title: status == PuzzleStatus.complete
          ? context.l10n.puzzleCompleted
          : context.l10n.puzzleChallengeTitle,
    );
  }
}

/// {@template simple_puzzle_board}
/// Display the board of the puzzle in a [size]x[size] layout
/// filled with [tiles]. Each tile is spaced with [spacing].
/// {@endtemplate}
@visibleForTesting
class SimplePuzzleBoard extends StatelessWidget {
  /// {@macro simple_puzzle_board}
  const SimplePuzzleBoard({
    Key? key,
    required this.size,
    required this.tiles,
  }) : super(key: key);

  /// The size of the board.
  final int size;

  /// The tiles to be displayed on the board.
  final List<Widget> tiles;

  @override
  Widget build(BuildContext context) {
    final theme = context.select((ThemeBloc bloc) => bloc.state.theme);
    double tileSize = theme.tileSize.resolve(context) ?? 72;
    double tileGap = theme.tileGapSize.resolve(context) ?? 4;

    return Container(
      width: tileSize * size + tileGap * (size + 1),
      height: tileSize * size + tileGap * (size + 1),
      clipBehavior: Clip.none,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          StyledContainer(
              style: theme.boardBackgroundStyle.resolve(context) ?? Style(),
              child: AspectRatio(
                aspectRatio: 1,
                child: SizedBox(
                  width: tileSize * size + tileGap * (size - 1),
                  height: tileSize * size + tileGap * (size - 1),
                ),
              )),
          GridView.count(
            padding: const EdgeInsets.all(3),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: size,
            mainAxisSpacing: tileGap,
            crossAxisSpacing: tileGap,
            clipBehavior: Clip.none,
            children: tiles,
          )
        ],
      ),
    );
  }
}

abstract class _TileFontSize {
  static double small = 36;
  static double medium = 50;
  static double large = 54;
}

/// {@template simple_puzzle_tile}
/// Displays the puzzle tile associated with [tile] and
/// the font size of [tileFontSize] based on the puzzle [state].
/// {@endtemplate}
@visibleForTesting
class SimplePuzzleTile extends StatefulWidget {
  const SimplePuzzleTile({
    Key? key,
    required this.tile,
    required this.tileFontSize,
    required this.state,
    AudioPlayerFactory? audioPlayer,
  })  : _audioPlayerFactory = audioPlayer ?? getAudioPlayer,
        super(key: key);

  /// The tile to be displayed.
  final Tile tile;

  /// The font size of the tile to be displayed.
  final double tileFontSize;

  /// The state of the puzzle.
  final PuzzleState state;

  final AudioPlayerFactory _audioPlayerFactory;

  @override
  _SimplePuzzleTileState createState() => _SimplePuzzleTileState();
}

class _SimplePuzzleTileState extends State<SimplePuzzleTile> {
  AudioPlayer? _audioPlayer;
  late final Timer _timer;

  @override
  void initState() {
    super.initState();

    /// Delay the initialization of the audio player for performance reasons,
    /// to avoid dropping frames when the theme is changed.
    _timer = Timer(const Duration(milliseconds: 500), () {
      _audioPlayer = widget._audioPlayerFactory();
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _audioPlayer?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.select((ThemeBloc bloc) => bloc.state.theme);

    return AudioControlListener(
      audioPlayer: _audioPlayer,
      child: StyledButton(
        curve: Curves.easeInOut,
        duration: PuzzleThemeAnimationDuration.puzzleTileScale,
        style: theme.buttonStyle.resolve(context) ?? Style(),
        hoveredStyle: theme.hoverStyle.resolve(context) ?? Style(),
        pressedStyle: theme.pressedStyle.resolve(context) ?? Style(),
        onPressed: widget.state.puzzleStatus == PuzzleStatus.incomplete
            ? () async {
                final duration = await _audioPlayer?.setAsset(
                  theme.tilePressSoundAsset,
                );
                if (duration != null) {
                  unawaited(_audioPlayer?.replay());
                }

                context.read<PuzzleBloc>().add(TileTapped(widget.tile));
                /*await Future.delayed(Duration(
                    milliseconds: (PuzzleThemeAnimationDuration
                                .puzzleTileScale.inMilliseconds /
                            2)
                        .round()));*/
              }
            : null,
        child: Text(
          widget.tile.value.toString(),
          semanticsLabel: context.l10n.puzzleTileLabelText(
            widget.tile.value.toString(),
            widget.tile.currentPosition.x.toString(),
            widget.tile.currentPosition.y.toString(),
          ),
        ),
      ),
    );
  }
}

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

class SimplePuzzleControls extends StatefulWidget {
  const SimplePuzzleControls({Key? key}) : super(key: key);

  @override
  _SimplePuzzleControlsState createState() => _SimplePuzzleControlsState();
}

class _SimplePuzzleControlsState extends State<SimplePuzzleControls> {
  ///The async process of solving and updating the puzzle

  Future<void>? getSolutionAndUpdatePuzzle;

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
        _difficultySelectButtons(),
        const ResponsiveGap(
          small: 20,
          medium: 20,
          large: 32,
        ),
        _sizeSelectButtons(),
        const ResponsiveGap(
          small: 20,
          medium: 20,
          large: 32,
        ),
        _buildShuffleButton(),
        const ResponsiveGap(
          small: 20,
          medium: 20,
          large: 32,
        ),
        _buildSolveButton(),
      ],
    );
  }

  Widget _difficultySelectButtons() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _difficultySelectButton(PuzzleDifficulty.easy),
        _difficultySelectButton(PuzzleDifficulty.hard),
      ],
    );
  }

  Widget _difficultySelectButton(PuzzleDifficulty difficulty) {
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

  Widget _sizeSelectButtons() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _sizeSelectButton(3),
        _sizeSelectButton(4),
        _sizeSelectButton(5),
      ],
    );
  }

  Widget _sizeSelectButton(int size) {
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

  Widget _buildShuffleButton() {
    return PuzzleButton(onPressed: () {
      //setState(() {
      //  getSolutionAndUpdatePuzzle = null;
      //});
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

  Widget _buildSolveButton() {
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
  static List<Puzzle> solvePuzzleComputation(Puzzle puzzle) {
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

    await compute(solvePuzzleComputation, puzzle).then((value) async {
      ///Rewind the puzzle until the move from the solution is not too far away
      if (history.length > relaxMoves) {
        int rewindMoves = history.length - relaxMoves;
        history = history.sublist(0, rewindMoves) +
            value.map((e) => e.tiles).toList();
        history = removeRedundantMoves(history);
      } else {
        history = value.map((e) => e.tiles).toList();
      }

      /*for (int i = 0; i < history.length; i++) {
        Puzzle(tiles: history[i]).prettyPrint();
      }*/

      ///push the puzzle states with 1 sec interval
      await Future.forEach(
          history,
          (List<Tile> tiles) =>
              Future.delayed(const Duration(milliseconds: 1000), () {
                context
                    .read<PuzzleBloc>()
                    .add(PuzzleReset(Puzzle(tiles: tiles)));
              }));
      /*
      ///push the solved puzzle states with 1 sec interval
      await Future.forEach(
          value,
          (Tile t) => Future.delayed(const Duration(milliseconds: 1000), () {
                context.read<PuzzleBloc>().add(TileTapped(t));
              }));

         */
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
