// ignore_for_file: public_member_api_docs

part of 'game_config_bloc.dart';

enum PuzzleDifficulty { easy, medium, hard }

class GameConfigState extends Equatable {
  const GameConfigState({
    this.puzzleSize = const PuzzleSize(4, 4),
    this.puzzleDifficulty = PuzzleDifficulty.hard,

    ///TODO: cant make too big or too small puzzles
  }) : assert(true);

  /// The size of the puzzle
  final PuzzleSize puzzleSize;

  /// The difficulty of the puzzle.
  final PuzzleDifficulty puzzleDifficulty;

  GameConfigState copyWith({
    PuzzleSize? puzzleSize,
    PuzzleDifficulty? puzzleDifficulty,
  }) {
    return GameConfigState(
      puzzleSize: puzzleSize ?? this.puzzleSize,
      puzzleDifficulty: puzzleDifficulty ?? this.puzzleDifficulty,
    );
  }

  @override
  List<Object?> get props => [puzzleSize, puzzleDifficulty];
}
