// lib/blocs/game_bloc/game_state.dart

part of 'game_bloc.dart';

@immutable
abstract class GameState {}

class GameInitial extends GameState {}

class GameLoading extends GameState {}

class GameLoaded extends GameState {
  final int boardSize;
  final List<List<int>> board;
  final int currentPlayer;
  final int scorePlayer1;
  final int scorePlayer2;

  GameLoaded({
    required this.boardSize,
    required this.board,
    required this.currentPlayer,
    required this.scorePlayer1,
    required this.scorePlayer2,
  });
}
