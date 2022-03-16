import 'dart:async';
import 'dart:io' show Platform;

import 'package:just_audio/just_audio.dart';
import 'package:animated_styled_widget/animated_styled_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import 'package:responsive_property/responsive_property.dart';
import 'package:very_good_slide_puzzle/helpers/audio_player.dart';
import 'package:very_good_slide_puzzle/l10n/l10n.dart';
import 'package:very_good_slide_puzzle/layout/layout.dart';
import 'package:very_good_slide_puzzle/models/models.dart';
import 'package:very_good_slide_puzzle/puzzle/puzzle.dart';
import 'package:very_good_slide_puzzle/puzzle_solver/puzzle_solver.dart';

import 'package:very_good_slide_puzzle/theme/theme.dart';
import 'package:very_good_slide_puzzle/game_config/game_config.dart';

import 'package:decorated_icon/decorated_icon.dart';

/// {@template puzzle_shuffle_button}
/// Displays the button to shuffle the puzzle.
/// {@endtemplate}
@visibleForTesting
class SimplePuzzleShuffleButton extends StatelessWidget {
  /// {@macro puzzle_shuffle_button}
  const SimplePuzzleShuffleButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = context.select((ThemeBloc bloc) => bloc.state.theme);

    List<Shadow>? _textShadow =
        theme.tileStyle.resolve(context)?.textStyle?.shadows;

    return PuzzleButton(onPressed: () {
      context.read<PuzzleBloc>().add(const PuzzleReset(null));
    }, child: Builder(builder: (context) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DecoratedIcon(
            Icons.refresh_sharp,
            size: 17,
            color: DefaultTextStyle.of(context).style.color,
            shadows: _textShadow
                ?.map((e) => Shadow(
                    color: e.color, offset: e.offset, blurRadius: e.blurRadius))
                .toList(),
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

    return StyledButton(
      duration: PuzzleThemeAnimationDuration.puzzleTileScale
          .dilate(context.getTimeDilation()),
      style: gameConfig.puzzleDifficulty == difficulty
          ? theme.popupMenuPressedStyle.resolve(context)!
          : theme.popupMenuButtonStyle.resolve(context)!,
      hoveredStyle: theme.popupMenuHoverStyle.resolve(context),
      pressedStyle: theme.popupMenuPressedStyle.resolve(context),
      onPressed: gameConfig.puzzleDifficulty == difficulty
          ? null
          : () {
              context
                  .read<GameConfigBloc>()
                  .add(PuzzleSetDifficulty(difficulty));
            },
      child: difficulty == PuzzleDifficulty.easy
          ? Text(context.l10n.puzzleDifficultyEasy)
          : difficulty == PuzzleDifficulty.medium
              ? Text(context.l10n.puzzleDifficultyMedium)
              : Text(context.l10n.puzzleDifficultyHard),
    );
  }
}

class SimplePuzzleSizeSelectButton extends StatelessWidget {
  const SimplePuzzleSizeSelectButton({Key? key, required this.size})
      : super(key: key);

  final PuzzleSize size;

  @override
  Widget build(BuildContext context) {
    final theme = context.select((ThemeBloc bloc) => bloc.state.theme);
    final gameConfig = context.select((GameConfigBloc bloc) => bloc.state);
    return StyledButton(
      duration: PuzzleThemeAnimationDuration.puzzleTileScale
          .dilate(context.getTimeDilation()),
      style: gameConfig.puzzleSize == size
          ? theme.popupMenuPressedStyle.resolve(context)!
          : theme.popupMenuButtonStyle.resolve(context)!,
      hoveredStyle: theme.popupMenuHoverStyle.resolve(context),
      pressedStyle: theme.popupMenuPressedStyle.resolve(context),
      onPressed: gameConfig.puzzleSize == size
          ? null
          : () {
              context.read<GameConfigBloc>().add(PuzzleSetSize(size));
            },
      child: Text(
        size.width.toString() + " × " + size.height.toString(),
      ),
    );
  }
}

class SimplePuzzleSolveButton extends StatefulWidget {
  const SimplePuzzleSolveButton({
    Key? key,
    AudioPlayerFactory? audioPlayer,
  })  : _audioPlayerFactory = audioPlayer ?? getAudioPlayer,
        super(key: key);

  final AudioPlayerFactory _audioPlayerFactory;

  @override
  State<SimplePuzzleSolveButton> createState() =>
      _SimplePuzzleSolveButtonState();
}

class _SimplePuzzleSolveButtonState extends State<SimplePuzzleSolveButton> {
  AudioPlayer? _audioPlayer;
  late final Timer _timer;

  ///The async process of solving and updating the puzzle
  Future<void>? getSolutionAndUpdatePuzzle;

  @override
  void initState() {
    super.initState();

    /// Delay the initialization of the audio player for performance reasons,
    /// to avoid dropping frames when the theme is changed.
    /// linux and windows are not supported right now
    ///

    if (!kIsWeb && (Platform.isLinux || Platform.isWindows)) {
    } else {
      _timer = Timer(const Duration(milliseconds: 500), () {
        _audioPlayer = widget._audioPlayerFactory();
      });
    }
  }

  @override
  void dispose() {
    _timer.cancel();
    _audioPlayer?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = context.select((PuzzleBloc bloc) => bloc.state);
    final theme = context.select((ThemeBloc bloc) => bloc.state.theme);

    List<Shadow>? _textShadow =
        theme.tileStyle.resolve(context)?.textStyle?.shadows;

    return state.puzzle.isComplete()
        ? PuzzleAnimatedContainer(
            style: theme.buttonStyle.resolve(context) ??
                (theme.tileStyle.resolve(context) ?? Style()
                  ..width = null
                  ..height = null
                  ..padding =
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 5)),
            child: _solvedRow(_textShadow),
          )
        : FutureBuilder<void>(
            future: getSolutionAndUpdatePuzzle,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.none) {
                return PuzzleButton(onPressed: () async {
                  setState(() {
                    getSolutionAndUpdatePuzzle =
                        _solvePuzzle(state.puzzle, theme);
                  });
                }, child: Builder(builder: (context) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DecoratedIcon(
                        Icons.question_mark,
                        size: 17,
                        color: DefaultTextStyle.of(context).style.color,
                        shadows: _textShadow
                            ?.map((e) => Shadow(
                                color: e.color,
                                offset: e.offset,
                                blurRadius: e.blurRadius))
                            .toList(),
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
                style = theme.buttonStyle.resolve(context) ??
                    (theme.tileStyle.resolve(context) ?? Style()
                      ..width = null
                      ..height = null
                      ..padding = const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 5));
                row = _noSolutionRow(_textShadow);
              } else if (snapshot.hasData) {
                style = theme.buttonStyle.resolve(context) ??
                    (theme.tileStyle.resolve(context) ?? Style()
                      ..width = null
                      ..height = null
                      ..padding = const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 5));
                row = _solvedRow(_textShadow);
              } else {
                style = theme.buttonPressedStyle.resolve(context) ??
                    (theme.tilePressedStyle.resolve(context) ?? Style()
                      ..width = null
                      ..height = null
                      ..padding = const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 5));
                row = _solvingRow();
              }

              return PuzzleAnimatedContainer(
                style: style,
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

  Future<void> _solvePuzzle(Puzzle puzzle, PuzzleTheme theme) async {
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
      puzzle = Puzzle(size: puzzle.size, tiles: history[rewindMoves - 1]);
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
              Future.delayed(const Duration(milliseconds: 1000), () async {
                if (AudioPlayerExtension.isPlatformSupported) {
                  final duration = await _audioPlayer?.setAsset(
                    theme.tilePressSoundAsset,
                  );
                  unawaited(_audioPlayer?.replay());
                }

                context
                    .read<PuzzleBloc>()
                    .add(PuzzleReset(Puzzle(size: puzzle.size, tiles: tiles)));
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

      if (lastId != -1 && lastId != i) {
        history = history.sublist(0, i) + history.sublist(lastId);
        i = 0;
      } else {
        i += 1;
      }
    }
    return history;
  }

  Widget _solvedRow(List<Shadow>? _textShadow) {
    return Builder(builder: (context) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DecoratedIcon(
            Icons.check,
            size: 17,
            color: DefaultTextStyle.of(context).style.color,
            shadows: _textShadow
                ?.map((e) => Shadow(
                    color: e.color, offset: e.offset, blurRadius: e.blurRadius))
                .toList(),
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
              width: 12,
              height: 12,
              child: context
                      .select((ThemeBloc bloc) => bloc.state.theme)
                      .useCupertinoIndicator
                  ? CupertinoActivityIndicator(
                      color: DefaultTextStyle.of(context).style.color,
                    )
                  : CircularProgressIndicator(
                      strokeWidth: 2,
                      color: DefaultTextStyle.of(context).style.color,
                    )),
          const Gap(10),
          Text(context.l10n.puzzleSolving),
        ],
      );
    });
  }

  Widget _noSolutionRow(List<Shadow>? _textShadow) {
    return Builder(builder: (context) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DecoratedIcon(
            Icons.error,
            size: 17,
            color: DefaultTextStyle.of(context).style.color,
            shadows: _textShadow
                ?.map((e) => Shadow(
                    color: e.color, offset: e.offset, blurRadius: e.blurRadius))
                .toList(),
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
        ResponsiveLayoutBuilder(
          small: (_, child) => Column(
            children: const [
              SimplePuzzleShuffleButton(),
              ResponsiveGap(
                small: 20,
                medium: 20,
                large: 32,
              ),
              SimplePuzzleSolveButton(),
            ],
          ),
          medium: (_, child) => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: const [
              SimplePuzzleShuffleButton(),
              Gap(32),
              SimplePuzzleSolveButton(),
            ],
          ),
          large: (_, child) => Column(
            children: const [
              SimplePuzzleShuffleButton(),
              ResponsiveGap(
                small: 20,
                medium: 20,
                large: 32,
              ),
              SimplePuzzleSolveButton(),
            ],
          ),
        )
      ],
    );
  }
}
