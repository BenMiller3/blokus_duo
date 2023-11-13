// lib/blocs/game_bloc/game_event.dart

part of 'game_bloc.dart';

@immutable
abstract class GameEvent {}

class GameStarted extends GameEvent {}

class PiecePlaced extends GameEvent {
  final Piece piece;
  final int x;
  final int y;

  PiecePlaced({required this.piece, required this.x, required this.y});
}

class PieceHovered extends GameEvent {
  final Piece piece;
  final Offset position;

  PieceHovered({required this.piece, required this.position});
}

class EndTurn extends GameEvent {}
