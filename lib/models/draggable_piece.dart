import 'package:blocks_duo/models/piece.dart';
import 'package:flutter/material.dart';

class DraggablePiece extends StatelessWidget {
  final Piece piece;
  final VoidCallback onDragCompleted;

  DraggablePiece({required this.piece, required this.onDragCompleted});

  @override
  Widget build(BuildContext context) {
    return Draggable<Piece>(
      data: piece,
      child: PieceWidget(piece: piece), // Your existing PieceWidget to display the piece
      feedback: Material(
        child: Opacity(
          opacity: 0.7,
          child: PieceWidget(piece: piece), // Slightly transparent version of the PieceWidget
        ),
      ),
      onDragCompleted: onDragCompleted,
    );
  }
}
