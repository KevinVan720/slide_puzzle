// ignore_for_file: public_member_api_docs

import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:very_good_slide_puzzle/models/models.dart';
import 'package:very_good_slide_puzzle/game_config/game_config.dart';

part 'puzzle_event.dart';
part 'puzzle_state.dart';

class PuzzleBloc extends Bloc<PuzzleEvent, PuzzleState> {
  PuzzleBloc(this.gameConfigBloc, {required this.random})
      : super(const PuzzleState()) {
    on<PuzzleInitialized>(_onPuzzleInitialized);
    on<TileTapped>(_onTileTapped);
    on<PuzzleReset>(_onPuzzleReset);
    on<PuzzleAutoSolvingUpdate>(_onPuzzleAutoSolvingUpdate);

    ///when the game config changes, initialize the puzzle again
    gameConfigStreamSubscription = gameConfigBloc.stream.listen((state) {
      _size = state.puzzleSize;
      _difficulty = state.puzzleDifficulty;
      _initializePuzzle(true);
    });
  }

  final GameConfigBloc gameConfigBloc;

  late final StreamSubscription gameConfigStreamSubscription;

  int _size = 4;

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

  void _onPuzzleAutoSolvingUpdate(
    PuzzleAutoSolvingUpdate event,
    Emitter<PuzzleState> emit,
  ) {
    emit(
      state.copyWith(
          numberOfMoves: event.isAutoSolving ? 0 : state.numberOfMoves,
          isAutoSolving: event.isAutoSolving),
    );
  }

  @override
  Future<void> close() {
    gameConfigStreamSubscription.cancel();
    return super.close();
  }

  /// Build a randomized, solvable puzzle of the given size.
  Puzzle _generatePuzzle(int size, {bool shuffle = true}) {
    final correctPositions = <Position>[];
    final currentPositions = <Position>[];
    final whitespacePosition = Position(x: size, y: size);

    // Create all possible board positions.
    for (var y = 1; y <= size; y++) {
      for (var x = 1; x <= size; x++) {
        if (x == size && y == size) {
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

    var puzzle = Puzzle(tiles: tiles, tilesHistory: const []);

    int correctTile;

    ///hard coded difficulty settings
    switch (_difficulty) {
      case PuzzleDifficulty.easy:
        correctTile = 5;
        break;
      case PuzzleDifficulty.hard:
        correctTile = 0;
        break;
      default:
        correctTile = 0;
    }

    if (shuffle) {
      // Assign the tiles new current positions until the puzzle is solvable
      while (!puzzle.isSolvable() ||
          puzzle.getNumberOfCorrectTiles() > correctTile) {
        final mutablePuzzle = Puzzle(
            tiles: [...puzzle.tiles], tilesHistory: [...puzzle.tilesHistory]);

        int id = random.nextInt(_size * _size);

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
    int size,
    List<Position> correctPositions,
    List<Position> currentPositions,
  ) {
    final whitespacePosition = Position(x: size, y: size);
    return [
      for (int i = 1; i <= size * size; i++)
        if (i == size * size)
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
}
