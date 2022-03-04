// ignore_for_file: public_member_api_docs

part of 'game_config_bloc.dart';

enum PuzzleDifficulty { easy, hard }

class GameConfigState extends Equatable {
  const GameConfigState({
    this.puzzleSize = 4,
    this.puzzleDifficulty = PuzzleDifficulty.hard,
  }) : assert(puzzleSize <= 5 && puzzleSize >= 2);

  /// The size of the puzzle
  final int puzzleSize;

  /// The difficulty of the puzzle.
  final PuzzleDifficulty puzzleDifficulty;

  GameConfigState copyWith({
    int? puzzleSize,
    PuzzleDifficulty? puzzleDifficulty,
  }) {
    return GameConfigState(
      puzzleSize: puzzleSize ?? this.puzzleSize,
      puzzleDifficulty: puzzleDifficulty ?? this.puzzleDifficulty,
    );
  }

  @override
  List<Object?> get props => [
        puzzleSize,
        puzzleDifficulty,
      ];
}