// lib/blocs/game_bloc/game_state.dart

part of 'game_bloc.dart';

@immutable
abstract class GameState {}

class GameInitial extends GameState {}

class PieceHoverState extends GameState {
  final Piece hoveringPiece;
  final Offset hoverPosition;

  PieceHoverState(this.hoveringPiece, this.hoverPosition);
}

class PiecePlacedState extends GameState {
  final List<List<int>> board;
  final int currentPlayer;
  final int scorePlayer1;
  final int scorePlayer2;

  PiecePlacedState(this.board, this.currentPlayer, this.scorePlayer1, this.scorePlayer2);
}

// More states as needed...
