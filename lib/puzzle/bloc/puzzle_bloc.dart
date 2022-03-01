// ignore_for_file: public_member_api_docs

import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:very_good_slide_puzzle/models/models.dart';

part 'puzzle_event.dart';
part 'puzzle_state.dart';

class PuzzleBloc extends Bloc<PuzzleEvent, PuzzleState> {
  PuzzleBloc(this._size, {this.random}) : super(const PuzzleState()) {
    on<PuzzleInitialized>(_onPuzzleInitialized);
    on<TileTapped>(_onTileTapped);
    on<PuzzleReset>(_onPuzzleReset);
    on<PuzzleSetDifficulty>(_onPuzzleSetDifficulty);
    on<PuzzleAutoSolvingUpdate>(_onPuzzleAutoSolvingUpdate);
  }

  final int _size;

  final Random? random;

  void _onPuzzleInitialized(
    PuzzleInitialized event,
    Emitter<PuzzleState> emit,
  ) {
    final puzzle = _generatePuzzle(_size,
        shuffle: event.shufflePuzzle, difficulty: state.puzzleDifficulty);
    emit(
      PuzzleState(
        puzzle: puzzle.sort(),
        numberOfCorrectTiles: puzzle.getNumberOfCorrectTiles(),
      ),
    );
  }

  void _onPuzzleSetDifficulty(
    PuzzleSetDifficulty event,
    Emitter<PuzzleState> emit,
  ) {
    emit(
      state.copyWith(puzzleDifficulty: event.puzzleDifficulty),
    );
  }

  void _onPuzzleAutoSolvingUpdate(
    PuzzleAutoSolvingUpdate event,
    Emitter<PuzzleState> emit,
  ) {
    if (event.isAutoSolving) {
      emit(
        state.copyWith(isAutoSolving: event.isAutoSolving, numberOfMoves: 0),
      );
    } else {
      emit(
        state.copyWith(isAutoSolving: event.isAutoSolving),
      );
    }
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
    Puzzle puzzle = event.puzzle ??
        _generatePuzzle(_size, difficulty: state.puzzleDifficulty);
    emit(
      PuzzleState(
        puzzle: puzzle.sort(),
        isAutoSolving: state.isAutoSolving,
        numberOfMoves: event.puzzle == null ? 0 : state.numberOfMoves + 1,
        numberOfCorrectTiles: puzzle.getNumberOfCorrectTiles(),
        puzzleDifficulty: state.puzzleDifficulty,
      ),
    );
  }

  /// Build a randomized, solvable puzzle of the given size.
  Puzzle _generatePuzzle(int size,
      {bool shuffle = true,
      PuzzleDifficulty difficulty = PuzzleDifficulty.hard}) {
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

    /*if (shuffle) {
      // Randomize only the current tile posistions.
      currentPositions.shuffle(random);
    }*/

    var tiles = _getTileListFromPositions(
      size,
      correctPositions,
      currentPositions,
    );

    var puzzle = Puzzle(tiles: tiles, tilesHistory: []);

    int correctTile;

    ///hard coded difficulty settings
    switch (difficulty) {
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

        int id = random!.nextInt(_size * _size);

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
