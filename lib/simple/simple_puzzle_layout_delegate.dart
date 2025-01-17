import 'dart:async';
import 'dart:math';

import 'package:animated_styled_widget/animated_styled_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:very_good_slide_puzzle/audio_control/audio_control.dart';
import 'package:very_good_slide_puzzle/l10n/l10n.dart';
import 'package:very_good_slide_puzzle/layout/layout.dart';
import 'package:very_good_slide_puzzle/models/models.dart';
import 'package:very_good_slide_puzzle/puzzle/puzzle.dart';
import 'package:very_good_slide_puzzle/simple/simple.dart';
import 'package:very_good_slide_puzzle/theme/theme.dart';
import 'package:very_good_slide_puzzle/helpers/helpers.dart';

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
  Widget boardBuilder(PuzzleSize size, List<Widget> tiles) {
    return Column(
      children: [
        const ResponsiveGap(
          small: 14,
          medium: 20,
          large: 96,
        ),
        SimplePuzzleBoard(
          key: const Key('simple_puzzle_board'),
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
    return SimplePuzzleTile(
      key: ValueKey('simple_puzzle_tile_${tile.value}'),
      tile: tile,
      state: state,
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
          small: 14,
          medium: 20,
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
          medium: 14,
          large: 32,
        ),
        NumberOfMovesAndTilesLeft(
          key: numberOfMovesAndTilesLeftKey,
          numberOfMoves: state.numberOfMoves,
          numberOfTilesLeft: state.numberOfTilesLeft,
        ),
        const ResponsiveGap(
          small: 12,
          medium: 14,
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
  final PuzzleSize size;

  /// The tiles to be displayed on the board.
  final List<Widget> tiles;

  @override
  Widget build(BuildContext context) {
    final theme = context.select((ThemeBloc bloc) => bloc.state.theme);
    double tileSize = theme.tileSize.resolve(context) ?? 72;
    double tileGap = theme.tileGapSize.resolve(context) ?? 4;

    return SizedBox(
      width: min(tileSize * size.width + tileGap * (size.width + 1),
          MediaQuery.of(context).size.width),
      height: min(tileSize * size.height + tileGap * (size.height + 1),
          MediaQuery.of(context).size.width),
      child: Stack(
        //clipBehavior: Clip.none,
        alignment: Alignment.center,
        fit: StackFit.passthrough,
        children: [
          ///The board background
          StyledContainer(
              style: theme.boardBackgroundStyle.resolve(context) ?? Style(),
              child: Container()),
          ...tiles
        ],
      ),
    );
  }
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
    required this.state,
  }) : super(key: key);

  /// The tile to be displayed.
  final Tile tile;

  /// The state of the puzzle.
  final PuzzleState state;

  @override
  _SimplePuzzleTileState createState() => _SimplePuzzleTileState();
}

class _SimplePuzzleTileState extends State<SimplePuzzleTile> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.select((ThemeBloc bloc) => bloc.state.theme);
    double tileSize = theme.tileSize.resolve(context) ?? 72;

    final size = widget.state.puzzle.getDimension();

    double timeDilation = context.getTimeDilation();

    Widget _tile = StyledButton(
      key: UniqueKey(),
      curve: Curves.easeInOut,
      duration: PuzzleThemeAnimationDuration.puzzleTileScale
          .dilate(context.getTimeDilation()),
      style: theme.tileStyle.resolve(context) ?? Style(),
      hoveredStyle: theme.tileHoverStyle.resolve(context) ?? Style(),
      pressedStyle: theme.tilePressedStyle.resolve(context) ?? Style(),
      disabledStyle: theme.tileStyle
              .resolve(context)
              ?.copyWith(mouseCursor: SystemMouseCursors.forbidden) ??
          Style(),
      onPressed: widget.state.puzzleStatus == PuzzleStatus.incomplete &&
              widget.state.isAutoSolving == false
          ? () async {
              await Future.delayed(PuzzleThemeAnimationDuration.puzzleTileScale
                  .dilate(timeDilation / 2));

              context.read<PuzzleBloc>().add(TileTapped(widget.tile));
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
    );

    return AnimatedAlign(
      alignment: FractionalOffset(
        (widget.tile.currentPosition.x - 1) / (size.width - 1),
        (widget.tile.currentPosition.y - 1) / (size.height - 1),
      ),
      duration:
          theme.tileMoveAnimationDuration.dilate(context.getTimeDilation()),
      curve: theme.tileMoveAnimationCurve,
      child: ConstrainedBox(
          constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width / size.width,
              maxHeight: MediaQuery.of(context).size.width / size.height),
          child: SizedBox.square(
            dimension: tileSize,
            child: _tile,
          )),
    );
  }
}
