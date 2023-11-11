// lib/blocs/game_bloc/game_bloc.dart

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../models/piece.dart'; // Adjust the import path as necessary

part 'game_event.dart';
part 'game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  GameBloc() : super(GameInitial());

  @override
  Stream<GameState> mapEventToState(
      GameEvent event,
      ) async* {
    if (event is PiecePlacedEvent) {
      // Handle the piece placement
      // Update the board, switch the current player, update scores, etc.
      // Yield a new state
    } else if (event is PieceHoveredEvent) {
      // Yield a state to show the piece preview
    } else if (event is EndTurnEvent) {
      // Switch the player and yield a new state
    }
    // Handle other events...
  }
}
