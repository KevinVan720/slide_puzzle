// ignore_for_file: public_member_api_docs

import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:very_good_slide_puzzle/models/models.dart';

part 'game_config_event.dart';
part 'game_config_state.dart';

class GameConfigBloc extends Bloc<GameConfigEvent, GameConfigState> {
  GameConfigBloc() : super(const GameConfigState()) {
    on<PuzzleSetSize>(_onPuzzleSetSize);
    on<PuzzleSetDifficulty>(_onPuzzleSetDifficulty);
  }

  void _onPuzzleSetSize(
    PuzzleSetSize event,
    Emitter<GameConfigState> emit,
  ) {
    emit(
      state.copyWith(puzzleSize: event.puzzleSize),
    );
  }

  void _onPuzzleSetDifficulty(
    PuzzleSetDifficulty event,
    Emitter<GameConfigState> emit,
  ) {
    emit(
      state.copyWith(puzzleDifficulty: event.puzzleDifficulty),
    );
  }
}
