import 'dart:async';

import 'package:animated_styled_widget/animated_styled_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:just_audio/just_audio.dart';
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
          small: (_, child) => const SimplePuzzleControls(),
          medium: (_, child) => const SimplePuzzleControls(),
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
    return Positioned(
      right: 0,
      bottom: 0,
      child: ResponsiveLayoutBuilder(
        small: (_, __) => SizedBox(
          width: 184,
          height: 118,
          child: Image.asset(
            'assets/images/simple_dash_small.png',
            key: const Key('simple_puzzle_dash_small'),
          ),
        ),
        medium: (_, __) => SizedBox(
          width: 380.44,
          height: 214,
          child: Image.asset(
            'assets/images/simple_dash_medium.png',
            key: const Key('simple_puzzle_dash_medium'),
          ),
        ),
        large: (_, __) => Padding(
          padding: const EdgeInsets.only(bottom: 53),
          child: SizedBox(
            width: 568.99,
            height: 320,
            child: Image.asset(
              'assets/images/simple_dash_large.png',
              key: const Key('simple_puzzle_dash_large'),
            ),
          ),
        ),
      ),
    );
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
        ResponsiveLayoutBuilder(
          small: (_, __) => SizedBox.square(
            dimension: _BoardSize.small,
            child: SimplePuzzleBoard(
              //key: const Key('simple_puzzle_board_small'),
              size: size,
              tiles: tiles,
              spacing: 2,
            ),
          ),
          medium: (_, __) => SizedBox.square(
            dimension: _BoardSize.medium,
            child: SimplePuzzleBoard(
              //key: const Key('simple_puzzle_board_medium'),
              size: size,
              tiles: tiles,
            ),
          ),
          large: (_, __) => SizedBox.square(
            dimension: _BoardSize.large,
            child: SimplePuzzleBoard(
              //key: const Key('simple_puzzle_board_large'),
              size: size,
              tiles: tiles,
            ),
          ),
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
          large: (_, __) => const SimplePuzzleControls(),
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

abstract class _BoardSize {
  static double small = 312;
  static double medium = 424;
  static double large = 472;
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
    this.spacing = 8,
  }) : super(key: key);

  /// The size of the board.
  final int size;

  /// The tiles to be displayed on the board.
  final List<Widget> tiles;

  /// The spacing between each tile from [tiles].
  final double spacing;

  @override
  Widget build(BuildContext context) {
    //print("board rebuild");

    return GridView.count(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: size,
      mainAxisSpacing: spacing,
      crossAxisSpacing: spacing,
      clipBehavior: Clip.none,
      children: tiles,
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

    // Delay the initialization of the audio player for performance reasons,
    // to avoid dropping frames when the theme is changed.
    _timer = Timer(const Duration(milliseconds: 500), () {
      _audioPlayer = widget._audioPlayerFactory()
        ..setAsset('assets/audio/tile_move.mp3');
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
                await Future.delayed(Duration(
                    milliseconds: (PuzzleThemeAnimationDuration
                                .puzzleTileScale.inMilliseconds /
                            2)
                        .round()));
                unawaited(_audioPlayer?.replay());
                context.read<PuzzleBloc>().add(TileTapped(widget.tile));
                await Future.delayed(Duration(
                    milliseconds: (PuzzleThemeAnimationDuration
                                .puzzleTileScale.inMilliseconds /
                            2)
                        .round()));
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
      children: [
        _difficultySelectButtons(),
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
      children: [
        _difficultySelectButton(PuzzleDifficulty.easy),
        _difficultySelectButton(PuzzleDifficulty.hard),
      ],
    );
  }

  Widget _difficultySelectButton(PuzzleDifficulty difficulty) {
    final theme = context.select((ThemeBloc bloc) => bloc.state.theme);
    final state = context.select((PuzzleBloc bloc) => bloc.state);
    final selectedStyle = theme.menuActiveStyle.toTextStyle(
        screenSize: MediaQuery.of(context).size,
        parentFontSize: DefaultTextStyle.of(context).style.fontSize ?? 14.0);
    final unselectedStyle = theme.menuInactiveStyle.toTextStyle(
        screenSize: MediaQuery.of(context).size,
        parentFontSize: DefaultTextStyle.of(context).style.fontSize ?? 14.0);
    return TextButton(
      style: ButtonStyle(
          overlayColor:
              MaterialStateProperty.all(theme.popupMenuBackgroundColor)),
      onPressed: state.puzzleDifficulty == difficulty
          ? null
          : () {
              context.read<PuzzleBloc>().add(PuzzleSetDifficulty(difficulty));
            },
      child: AnimatedDefaultTextStyle(
        style: state.puzzleDifficulty == difficulty
            ? selectedStyle.merge(PuzzleTextStyle.bodySmall)
            : unselectedStyle.merge(PuzzleTextStyle.bodySmall),
        duration: PuzzleThemeAnimationDuration.textStyle,
        child: difficulty == PuzzleDifficulty.easy
            ? Text(context.l10n.puzzleDifficultyEasy)
            : Text(context.l10n.puzzleDifficultyHard),
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

    return FutureBuilder<void>(
        future: getSolutionAndUpdatePuzzle,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.none) {
            return state.puzzle.isComplete()
                ? _solvedButton()
                : PuzzleButton(onPressed: () async {
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

          if (snapshot.hasError) {
            return _noSolutionButton();
          }
          if (snapshot.hasData) {
            return _solvedButton();
          }
          return _solvingButton();
        });
  }

  ///The actual computation of solving the puzzle
  ///The compute() method on the web is not working as expected so the UI would block.
  static List<Tile> solvePuzzleComputation(Puzzle puzzle) {
    var solver = PuzzleSolver(
        startPuzzle: puzzle, heuristic: const ManhattanHeuristic());
    List<Tile> rst = solver.IDAstar().values.toList();
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
    ///will behave terrible on the web.
    int relaxMoves = 16;

    if (history.length > relaxMoves) {
      int rewindMoves = history.length - relaxMoves;
      puzzle = Puzzle(tiles: history[rewindMoves - 1]);
    }

    context.read<PuzzleBloc>().add(PuzzleAutoSolvingUpdate(true));

    ///Rewind the puzzle and then solve it
    await compute(solvePuzzleComputation, puzzle).then((value) async {
      if (history.length > relaxMoves) {
        int rewindMoves = history.length - relaxMoves;

        ///push the rewind puzzle states with 1 sec interval
        await Future.forEach(
            history.sublist(0, rewindMoves),
            (List<Tile> tiles) =>
                Future.delayed(const Duration(milliseconds: 1000), () {
                  context
                      .read<PuzzleBloc>()
                      .add(PuzzleReset(Puzzle(tiles: tiles)));
                }));
      }

      ///push the solved puzzle states with 1 sec interval
      await Future.forEach(
          value,
          (Tile t) => Future.delayed(const Duration(milliseconds: 1000), () {
                context.read<PuzzleBloc>().add(TileTapped(t));
              }));
    });

    context.read<PuzzleBloc>().add(PuzzleAutoSolvingUpdate(false));

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

  Widget _solvedButton() {
    return PuzzleButton(
        onPressed: null,
        child: Builder(builder: (context) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.check,
                size: 17,
                color: DefaultTextStyle.of(context).style.color,
              ),
              const Gap(10),
              Text(context.l10n.puzzleSolved),
            ],
          );
        }));
  }

  Widget _solvingButton() {
    return PuzzleButton(
        onPressed: null,
        child: Builder(builder: (context) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  width: 17,
                  height: 17,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: DefaultTextStyle.of(context).style.color,
                  )),
              const Gap(10),
              Text(context.l10n.puzzleSolving),
            ],
          );
        }));
  }

  Widget _noSolutionButton() {
    return PuzzleButton(
        onPressed: null,
        child: Builder(builder: (context) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.error,
                size: 17,
                color: DefaultTextStyle.of(context).style.color,
              ),
              const Gap(10),
              Text(context.l10n.puzzleSolveError),
            ],
          );
        }));
  }
}
