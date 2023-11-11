import 'dart:math';

import 'package:flutter/material.dart';
import 'pieces.dart';
import 'pieces_carousel.dart';
import 'piece.dart';

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
      body: Container(
        color: boardColor,
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  buildBoard(),
                  if (hoveringPiece != null && hoverPosition != null)
                    buildPreview(context, hoverPosition!, hoveringPiece!),
                ],
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
      ),
    );
  }

  Widget buildBoard() {
    // Returns a grid view that represents the board
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: boardSize,
        mainAxisSpacing: 1,
        crossAxisSpacing: 1,
      ),
      itemCount: boardSize * boardSize,
      itemBuilder: (context, index) {
        int x = index % boardSize;
        int y = index ~/ boardSize;
        var color = board[y][x] != 0 ? Colors.greenAccent : boardColor;

        return DragTarget<Piece>(
          onWillAccept: (piece) {
            setState(() {
              hoveringPiece = piece;
              hoverPosition = Offset(x.toDouble(), y.toDouble());
            });
            return piece != null && canPlacePiece(x, y, piece);
          },
          onLeave: (piece) {
            setState(() {
              hoveringPiece = null;
              hoverPosition = null;
            });
          },
          onAccept: (piece) {
            placePiece(x, y, piece);
          },
          builder: (context, candidateData, rejectedData) {
            return Container(
              decoration: BoxDecoration(
                border: Border.all(color: gridLineColor),
                color: color,
              ),
            );
          },
        );
      },
    );
  }

  Widget buildPreview(BuildContext context, Offset position, Piece piece) {
    // Calculate the position for the preview
    int gridX =
        max(0, min(position.dx.toInt(), boardSize - piece.shape[0].length));
    int gridY =
        max(0, min(position.dy.toInt(), boardSize - piece.shape.length));

    // Generate the preview rows for the piece
    List<Widget> previewRows = [];
    for (var row in piece.shape) {
      List<Widget> previewCols = [];
      for (var cell in row) {
        previewCols.add(Container(
          width: cellSize,
          height: cellSize,
          decoration: BoxDecoration(
            color:
                cell == 1 ? piece.color.withOpacity(0.5) : Colors.transparent,
            border: cell == 1 ? Border.all(color: piece.color) : null,
          ),
        ));
      }
      previewRows.add(Row(children: previewCols));
    }

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
