import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:blokus_duo/blocs/game_bloc/game_bloc.dart';
import 'package:blokus_duo/widgets/board_cell.dart';

class GameBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // The GameBloc should be provided at the top of your widget tree, above this widget.
    return BlocBuilder<GameBloc, GameState>(
      builder: (context, state) {
        if (state is GameLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is GameLoaded) {
          return _buildGameBoard(context, state);
        } else {
          // This should never happen if your states are managed correctly.
          return Center(child: Text('Something went wrong!'));
        }
      },
    );
  }

  Widget _buildGameBoard(BuildContext context, GameLoaded state) {
    // This assumes GameLoaded state contains all the information needed to render the board.
    return Column(
      children: <Widget>[
        Expanded(
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: state.boardSize,
            ),
            itemCount: state.boardSize * state.boardSize,
            itemBuilder: (context, index) {
              final x = index % state.boardSize;
              final y = index ~/ state.boardSize;
              final cellColor = _getCellColor(state, x, y);

              return BoardCell(
                x: x,
                y: y,
                color: cellColor,
                onPiecePlaced: (piece) {
                  BlocProvider.of<GameBloc>(context).add(PiecePlacedEvent(piece, x, y));
                },
              );
            },
          ),
        ),
        // Your PiecesCarousel goes here, adjusted to work with the GameBloc.
      ],
    );
  }

  Color _getCellColor(GameLoaded state, int x, int y) {
    // Define how the color of the cell is determined based on the state of the game.
    // This function translates the game logic into visual representation.
    if (state.board[y][x] == 1) {
      return Colors.blue; // Color for player 1
    } else if (state.board[y][x] == 2) {
      return Colors.red; // Color for player 2
    }
    return Colors.white; // Default color for empty cells
  }
}
