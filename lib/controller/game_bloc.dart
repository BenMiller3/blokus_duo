import 'dart:async';
import 'dart:ui';

import '../models/piece.dart';

class GameBloc {
  final _stateController = StreamController<GameState>();
  Stream<GameState> get state => _stateController.stream;

  void dispatch(GameEvent event) {
    if (event is PiecePlacedEvent) {
      // Update the game state based on the event
      // Emit a new state
    }
    // Handle other event types...
  }

  void dispose() {
    _stateController.close();
  }
}