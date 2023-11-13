// lib/blocs/game_bloc/game_bloc.dart

import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../models/piece.dart';

part 'game_event.dart';

part 'game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  GameBloc() : super(GameInitial());

  @override
  Stream<GameState> mapEventToState(GameEvent event) async* {
    if (event is GameStarted) {
      // Initialize the game
      yield GameLoading();
      // After initializing the game
      yield GameLoaded(
        boardSize: 14,
        board: List.generate(14, (_) => List.filled(14, 0)),
        currentPlayer: 1,
        scorePlayer1: 0,
        scorePlayer2: 0,
      );
    } else if (event is PiecePlaced) {
      // Update the game state with the placed piece
      // and yield a new state. You need to define the logic
      // based on your game rules.
    } else if (event is EndTurn) {
      // Change the current player and yield a new state
    }
    // Add other event handling
  }
}
