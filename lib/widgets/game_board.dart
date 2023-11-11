import 'dart:math';

import 'package:flutter/material.dart';
import '../data/pieces.dart';
import '../models/game_state.dart';
import 'board_cell.dart';
import 'pieces_carousel.dart';
import '../models/piece.dart';

class GameBoard extends StatefulWidget {
  @override
  _GameBoardState createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  static const int boardSize = 14; // Blokus Duo board is 14x14
  List<List<int>> board =
  List.generate(boardSize, (i) => List.filled(boardSize, 0));
  List<Piece> availablePieces = allPieces; // Start with all pieces available

  Piece? hoveringPiece; // The piece that is currently being dragged.
  Offset? hoverPosition; // The grid position where the piece is hovering.

  final Color gridLineColor = Colors.grey.shade300; // Softer grid lines
  final Color boardColor = const Color(0xFFD9B99B); // Beige background color
  final double cellSize = 30.0; // The size of each grid cell

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blokus Duo'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: boardColor,
              child: Stack(
                children: [
                  buildBoard(),
                  if (hoveringPiece != null && hoverPosition != null)
                    buildPreview(context, hoverPosition!, hoveringPiece!),
                ],
              ),
            ),
          ),
          PiecesCarousel(
            player: 1, // Assuming player 1 for now
            availablePieces: availablePieces,
            onPieceSelected: (piece) {
              setState(() {
                availablePieces.remove(piece);
                // Trigger rebuild to update the pieces carousel
              });
            },
          ),
        ],
      ),
    );
  }

  Widget buildBoard() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: GameState.boardSize,
        mainAxisSpacing: 1,
        crossAxisSpacing: 1,
      ),
      itemCount: GameState.boardSize * GameState.boardSize,
      itemBuilder: (context, index) {
        int x = index % GameState.boardSize;
        int y = index ~/ GameState.boardSize;
        var color = gameState.board[y][x] != 0 ? Colors.greenAccent : boardColor;

        return BoardCell(
          x: x,
          y: y,
          color: color,
          onPiecePlaced: (piece) {
            // Your existing logic for handling piece placement
            placePiece(x, y, piece);
          },
        );
      },
    );
  }

  Widget buildPreview(BuildContext context, Offset position, Piece piece) {
    // Calculate the offset for the top-left corner of the piece's preview
    int gridX = position.dx.toInt();
    int gridY = position.dy.toInt();

    // Adjust the preview position so it doesn't overflow the board boundaries
    int previewWidth = piece.shape[0].length;
    int previewHeight = piece.shape.length;
    gridX = min(boardSize - previewWidth, gridX);
    gridY = min(boardSize - previewHeight, gridY);

    // Generate the preview rows for the piece
    List<Widget> previewRows = piece.shape.map((row) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: row.map((cell) {
          return Container(
            width: cellSize,
            height: cellSize,
            decoration: BoxDecoration(
              color: cell == 1 ? piece.color.withOpacity(0.5) : Colors.transparent,
              border: cell == 1 ? Border.all(color: piece.color) : null,
            ),
          );
        }).toList(),
      );
    }).toList();

    // Calculate the left and top offsets for the preview
    double leftOffset = gridX * cellSize;
    double topOffset = gridY * cellSize;

    // Return the positioned preview
    return Positioned(
      left: leftOffset,
      top: topOffset,
      child: Column(children: previewRows),
    );
  }


  bool canPlacePiece(int x, int y, Piece piece) {
    // Check if the piece fits within the board bounds
    for (int i = 0; i < piece.shape.length; i++) {
      for (int j = 0; j < piece.shape[i].length; j++) {
        if (piece.shape[i][j] == 1) {
          int boardX = x + j;
          int boardY = y + i;
          // Check if the position is within the board and empty
          if (boardY >= boardSize ||
              boardX >= boardSize ||
              board[boardY][boardX] != 0) {
            return false;
          }
        }
      }
    }
    return true;
  }

  void placePiece(int x, int y, Piece piece) {
    if (canPlacePiece(x, y, piece)) {
      setState(() {
        for (int i = 0; i < piece.shape.length; i++) {
          for (int j = 0; j < piece.shape[i].length; j++) {
            if (piece.shape[i][j] == 1) {
              board[y + i][x + j] =
              1; //piece.player; // Assign player's number to the board
            }
          }
        }
        availablePieces.remove(piece); // Remove piece from the available list
      });
    }
  }
}
