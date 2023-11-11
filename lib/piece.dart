// piece.dart
import 'package:flutter/material.dart';

class Piece {
  final List<List<int>> shape;
  final Color color;

  Piece(this.shape, {this.color = Colors.yellow});
}

class PieceWidget extends StatelessWidget {
  final Piece piece;

  const PieceWidget({Key? key, required this.piece}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // The size of the container can be adjusted based on the piece size
      width: piece.shape[0].length * 30.0,
      // Assuming each block is 30x30 pixels
      height: piece.shape.length * 30.0,
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(), // The grid is not scrollable
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: piece.shape[0].length,
        ),
        itemCount: piece.shape.length * piece.shape[0].length,
        itemBuilder: (context, index) {
          int row = index ~/ piece.shape[0].length;
          int col = index % piece.shape[0].length;
          bool isPiecePart = piece.shape[row][col] == 1;

          return Container(
            decoration: BoxDecoration(
              color: isPiecePart ? piece.color : Colors.transparent,
              border: isPiecePart ? Border.all(color: Colors.black) : null,
            ),
          );
        },
      ),
    );
  }
}
