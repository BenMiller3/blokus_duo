import 'package:flutter/cupertino.dart';

import '../models/piece.dart';

class BoardCell extends StatelessWidget {
  final int x, y;
  final Color color;
  final Function(Piece) onPiecePlaced;

  const BoardCell({
    Key? key,
    required this.x,
    required this.y,
    required this.color,
    required this.onPiecePlaced,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
  }
}
