import 'package:flutter/cupertino.dart';

import '../models/piece.dart';

class PiecePreview extends StatelessWidget {
  final Offset position;
  final Piece piece;
  final double cellSize;

  const PiecePreview({
    Key? key,
    required this.position,
    required this.piece,
    required this.cellSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text("todo remove");
  }
}
