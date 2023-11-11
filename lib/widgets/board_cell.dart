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
    // Use GestureDetector or InkWell to handle taps
    return GestureDetector(
      onTap: () {
        // TODO: Trigger onPiecePlaced with the correct piece
      },
      child: Container(
        // styling as before...
      ),
    );
  }
}