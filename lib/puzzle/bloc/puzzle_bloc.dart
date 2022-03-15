// ignore_for_file: public_member_api_docs

import 'dart:async';
import 'dart:math';
import 'package:flutter/foundation.dart';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:just_audio/just_audio.dart';
import 'package:very_good_slide_puzzle/models/models.dart';
import 'package:very_good_slide_puzzle/game_config/game_config.dart';
import 'package:very_good_slide_puzzle/puzzle_solver/puzzle_solver.dart';
import 'package:very_good_slide_puzzle/helpers/audio_player.dart';

part 'puzzle_event.dart';
part 'puzzle_state.dart';

class PuzzleBloc extends Bloc<PuzzleEvent, PuzzleState> {
  PuzzleBloc(this.gameConfigBloc, {required this.random})
      : super(const PuzzleState()) {
    on<PuzzleInitialized>(_onPuzzleInitialized);
    on<TileTapped>(_onTileTapped);
    on<PuzzleReset>(_onPuzzleReset);
    on<PuzzleAutoSolving>(_onPuzzleAutoSolving);

    ///when the game config changes, initialize the puzzle again
    gameConfigStreamSubscription = gameConfigBloc.stream.listen((state) {
      _size = state.puzzleSize;
      _difficulty = state.puzzleDifficulty;
      _initializePuzzle(true);
    });
  }

  final GameConfigBloc gameConfigBloc;

  late final StreamSubscription gameConfigStreamSubscription;

  PuzzleSize _size = const PuzzleSize(4, 4);

  PuzzleDifficulty _difficulty = PuzzleDifficulty.hard;

  final Random random;

  void _onPuzzleInitialized(
    PuzzleInitialized event,
    Emitter<PuzzleState> emit,
  ) {
    _initializePuzzle(event.shufflePuzzle);
  }

  void _initializePuzzle(bool shufflePuzzle) {
    final puzzle = _generatePuzzle(_size, shuffle: shufflePuzzle);
    emit(
      PuzzleState(
        puzzle: puzzle.sort(),
        numberOfCorrectTiles: puzzle.getNumberOfCorrectTiles(),
      ),
    );
  }

  void _onTileTapped(TileTapped event, Emitter<PuzzleState> emit) {
    final tappedTile = event.tile;
    if (state.puzzleStatus == PuzzleStatus.incomplete) {
      if (state.puzzle.isTileMovable(tappedTile)) {
        final mutablePuzzle = Puzzle(
            size: _size,
            tiles: [...state.puzzle.tiles],
            tilesHistory: [...state.puzzle.tilesHistory]);
        final puzzle = mutablePuzzle.moveTiles(tappedTile, []);
        if (puzzle.isComplete()) {
          emit(
            state.copyWith(
              puzzle: puzzle.sort(),
              puzzleStatus: PuzzleStatus.complete,
              tileMovementStatus: TileMovementStatus.moved,
              numberOfCorrectTiles: puzzle.getNumberOfCorrectTiles(),
              numberOfMoves: state.numberOfMoves + 1,
              lastTappedTile: tappedTile,
            ),
          );
        } else {
          emit(
            state.copyWith(
              puzzle: puzzle.sort(),
              tileMovementStatus: TileMovementStatus.moved,
              numberOfCorrectTiles: puzzle.getNumberOfCorrectTiles(),
              numberOfMoves: state.numberOfMoves + 1,
              lastTappedTile: tappedTile,
            ),
          );
        }
      } else {
        emit(
          state.copyWith(tileMovementStatus: TileMovementStatus.cannotBeMoved),
        );
      }
    } else {
      emit(
        state.copyWith(tileMovementStatus: TileMovementStatus.cannotBeMoved),
      );
    }
  }

  ///If reset to some given puzzle, don't reset the moves.
  void _onPuzzleReset(PuzzleReset event, Emitter<PuzzleState> emit) {
    Puzzle puzzle = event.puzzle ?? _generatePuzzle(_size);
    emit(
      PuzzleState(
          puzzle: puzzle.sort(),
          numberOfMoves: event.puzzle == null ? 0 : state.numberOfMoves + 1,
          numberOfCorrectTiles: puzzle.getNumberOfCorrectTiles(),
          puzzleStatus: puzzle.isComplete()
              ? PuzzleStatus.complete
              : PuzzleStatus.incomplete,
          isAutoSolving: state.isAutoSolving,
          tileMovementStatus: puzzle.isComplete()
              ? TileMovementStatus.cannotBeMoved
              : state.tileMovementStatus),
    );
  }

  void _onPuzzleAutoSolving (
    PuzzleAutoSolving event,
    Emitter<PuzzleState> emit,
  ) async {

    emit(
      state.copyWith(
          numberOfMoves: 0,
          isAutoSolving: true),
    );

    Puzzle puzzle=event.puzzle;

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
                  unawaited(event.player?.replay());
                }

                emit(
                  PuzzleState(
                      puzzle: Puzzle(size: puzzle.size, tiles: tiles).sort(),
                      numberOfMoves: state.numberOfMoves + 1,
                      numberOfCorrectTiles: puzzle.getNumberOfCorrectTiles(),
                      puzzleStatus: puzzle.isComplete()
                          ? PuzzleStatus.complete
                          : PuzzleStatus.incomplete,
                      isAutoSolving: state.isAutoSolving,
                      tileMovementStatus: puzzle.isComplete()
                          ? TileMovementStatus.cannotBeMoved
                          : state.tileMovementStatus),
                );
              }));
    });


    emit(
      state.copyWith(
        puzzleStatus: state.puzzle.isComplete()
            ? PuzzleStatus.complete
            : PuzzleStatus.incomplete,
          isAutoSolving: false),
    );

  }

  @override
  Future<void> close() {
    gameConfigStreamSubscription.cancel();
    return super.close();
  }

  /// Build a randomized, solvable puzzle of the given size.
  Puzzle _generatePuzzle(PuzzleSize size, {bool shuffle = true}) {
    final correctPositions = <Position>[];
    final currentPositions = <Position>[];
    final whitespacePosition = Position(x: size.width, y: size.height);

    // Create all possible board positions.
    for (var y = 1; y <= size.height; y++) {
      for (var x = 1; x <= size.width; x++) {
        if (x == size.width && y == size.height) {
          correctPositions.add(whitespacePosition);
          currentPositions.add(whitespacePosition);
        } else {
          final position = Position(x: x, y: y);
          correctPositions.add(position);
          currentPositions.add(position);
        }
      }
    }

    var tiles = _getTileListFromPositions(
      size,
      correctPositions,
      currentPositions,
    );

    var puzzle = Puzzle(size: size, tiles: tiles, tilesHistory: const []);

    int correctTile;

    ///hard coded difficulty settings
    switch (_difficulty) {
      case PuzzleDifficulty.easy:
        correctTile = (size.width * size.height * 2.0 / 4.0).round();
        break;
      case PuzzleDifficulty.medium:
        correctTile = (size.width * size.height * 1.0 / 4.0).round();
        break;
      case PuzzleDifficulty.hard:
        correctTile = 0;
        break;
      default:
        correctTile = 0;
    }

    if (shuffle) {
      /// Assign the tiles new current positions until the puzzle is solvable
      ///We are just moving tiles, the puzzle will always be solvable
      while (//!puzzle.isSolvable() ||
          puzzle.getNumberOfCorrectTiles() > correctTile) {
        final mutablePuzzle = Puzzle(
            size: size,
            tiles: [...puzzle.tiles],
            tilesHistory: [...puzzle.tilesHistory]);

        int id = random.nextInt(size.width * size.height);

        if (puzzle.isTileMovable(puzzle.tiles[id])) {
          puzzle = mutablePuzzle.moveTiles(puzzle.tiles[id], []);
        }
      }
    }

    return puzzle;
  }

  /// Build a list of tiles - giving each tile their correct position and a
  /// current position.
  List<Tile> _getTileListFromPositions(
    PuzzleSize size,
    List<Position> correctPositions,
    List<Position> currentPositions,
  ) {
    final whitespacePosition = Position(x: size.width, y: size.height);
    return [
      for (int i = 1; i <= size.width * size.height; i++)
        if (i == size.width * size.height)
          Tile(
            value: i,
            correctPosition: whitespacePosition,
            currentPosition: currentPositions[i - 1],
            isWhitespace: true,
          )
        else
          Tile(
            value: i,
            correctPosition: correctPositions[i - 1],
            currentPosition: currentPositions[i - 1],
          )
    ];
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
}
