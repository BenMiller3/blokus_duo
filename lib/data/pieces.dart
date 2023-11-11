// pieces.dart
import 'package:flutter/material.dart';
import '../models/piece.dart';

final List<Piece> allPieces = [
  Piece([
    [1]
  ]),
  Piece([
    [1],
    [1]
  ]),
  Piece([
    [1],
    [1],
    [1]
  ]),
  Piece([
    [1, 0],
    [1, 1]
  ]),
  Piece([
    [1, 0, 0],
    [1, 1, 1]
  ]),
  Piece([
    [1, 0],
    [1, 1],
    [1, 0]
  ]),
  Piece([
    [1, 1],
    [1, 1]
  ]),
  Piece([
    [1, 0],
    [1, 1],
    [0, 1]
  ]),
  Piece([
    [1],
    [1],
    [1],
    [1],
    [1]
  ]),
  Piece([
    [0, 1],
    [0, 1],
    [0, 1],
    [1, 1]
  ]),
  Piece([
    [0, 1],
    [0, 1],
    [1, 1],
    [1, 0]
  ]),
  Piece([
    [0, 1],
    [1, 1],
    [1, 1]
  ]),
  Piece([
    [1, 1],
    [0, 1],
    [1, 1]
  ]),
  Piece([
    [1, 0],
    [1, 1],
    [1, 0],
    [1, 0]
  ]),
  Piece([
    [0, 1, 0],
    [0, 1, 0],
    [1, 1, 1]
  ]),
  Piece([
    [1, 0, 0],
    [1, 0, 0],
    [1, 1, 1]
  ]),
  Piece([
    [1, 1, 0],
    [0, 1, 1],
    [0, 0, 1]
  ]),
  Piece([
    [1, 0, 0],
    [1, 1, 1],
    [0, 0, 1]
  ]),
  Piece([
    [0, 1, 0],
    [1, 1, 1],
    [0, 1, 0]
  ]),
];

Color getPlayerColor(int player) {
  // Define player colors here
  switch (player) {
    case 1:
      return Colors.blue;
    case 2:
      return Colors.red;
    default:
      return Colors.grey;
  }
}

List<Piece> initializePlayerPieces(int player) {
  Color color = getPlayerColor(player);
  return allPieces.map((piece) => Piece(piece.shape, color: color)).toList();
}
