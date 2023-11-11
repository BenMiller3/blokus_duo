part of 'game_bloc.dart';

@immutable
abstract class GameEvent {}

class PieceSelectedEvent extends GameEvent {
  final Piece piece;

  PieceSelectedEvent(this.piece);
}

class PiecePlacedEvent extends GameEvent {
  final Piece piece;
  final int x;
  final int y;

  PiecePlacedEvent(this.piece, this.x, this.y);
}

class PieceHoveredEvent extends GameEvent {
  final Piece piece;
  final Offset position;

  PieceHoveredEvent(this.piece, this.position);
}

class EndTurnEvent extends GameEvent {}
