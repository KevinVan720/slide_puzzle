// ignore_for_file: public_member_api_docs

part of 'game_config_bloc.dart';

abstract class GameConfigEvent extends Equatable {
  const GameConfigEvent();

  @override
  List<Object> get props => [];
}

/// The currently puzzle size has changed.
class PuzzleSetSize extends GameConfigEvent {
  const PuzzleSetSize(this.puzzleSize);

  final PuzzleSize puzzleSize;

  @override
  List<Object> get props => [puzzleSize];
}

/// The currently puzzle difficulty has changed.
class PuzzleSetDifficulty extends GameConfigEvent {
  const PuzzleSetDifficulty(this.puzzleDifficulty);

  final PuzzleDifficulty puzzleDifficulty;

  @override
  List<Object> get props => [puzzleDifficulty];
}
