// ignore_for_file: public_member_api_docs

part of 'game_config_bloc.dart';

abstract class GameConfigEvent extends Equatable {
  const GameConfigEvent();

  @override
  List<Object> get props => [];
}

class PuzzleSetSize extends GameConfigEvent {
  const PuzzleSetSize(this.puzzleSize);

  final int puzzleSize;

  @override
  List<Object> get props => [puzzleSize];
}

class PuzzleSetDifficulty extends GameConfigEvent {
  const PuzzleSetDifficulty(this.puzzleDifficulty);

  final PuzzleDifficulty puzzleDifficulty;

  @override
  List<Object> get props => [puzzleDifficulty];
}
