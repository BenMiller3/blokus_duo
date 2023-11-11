// events.dart
import 'dart:ui';

import '../models/piece.dart';

abstract class GameEvent {}

class PiecePlacedEvent extends GameEvent {
  final Piece piece;
  final int x;
  final int y;

  PiecePlacedEvent(this.piece, this.x, this.y);
}

// more events as needed...

// states.dart
abstract class GameState {}

class GameInitialState extends GameState {}

class PieceHoverState extends GameState {
  final Piece hoveringPiece;
  final Offset hoverPosition;

  PieceHoverState(this.hoveringPiece, this.hoverPosition);
}