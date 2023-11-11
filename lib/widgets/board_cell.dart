// lib/widgets/board_cell.dart

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/game_bloc/game_bloc.dart';
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
    return GestureDetector(
      onTap: () {
        // Dispatch an event to the bloc when a piece is placed
        final piece = // get the piece information somehow
        context.read<GameBloc>().add(PiecePlacedEvent(piece, x, y));
      },
      // Cell decoration and other UI logic...
    );
  }
}
