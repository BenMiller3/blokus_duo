// lib/widgets/board_cell.dart

import 'package:flutter/material.dart';

import '../models/piece.dart';

class BoardCell extends StatelessWidget {
  final int x, y;
  final Color color;
  final void Function(Piece piece) onPiecePlaced;

  const BoardCell({
    Key? key,
    required this.x,
    required this.y,
    required this.color,
    required this.onPiecePlaced,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Here, you would typically have some UI to let the user choose a piece
        // For this example, let's assume a piece is already selected and just call onPiecePlaced
        // onPiecePlaced(selectedPiece);
      },
      child: Container(
        decoration: BoxDecoration(
          color: color,
          border: Border.all(color: Colors.black),
        ),
      ),
    );
  }
}
