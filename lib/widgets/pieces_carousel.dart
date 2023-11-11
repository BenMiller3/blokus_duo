// pieces_carousel.dart
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../models/draggable_piece.dart'; // Make sure you import draggable_piece.dart
import '../models/piece.dart';

class PiecesCarousel extends StatelessWidget {
  final int player;
  final List<Piece> availablePieces;
  final Function(Piece) onPieceSelected;

  PiecesCarousel({
    Key? key,
    required this.player,
    required this.availablePieces,
    required this.onPieceSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 150,
        enableInfiniteScroll: false,
        viewportFraction: 0.25,
      ),
      items: availablePieces.map((piece) {
        return Builder(
          builder: (BuildContext context) {
            return DraggablePiece(
              piece: piece,
              onDragCompleted: () => onPieceSelected(piece),
            );
          },
        );
      }).toList(),
    );
  }
}
