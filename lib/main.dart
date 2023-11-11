import 'package:flutter/material.dart';
import 'game_board.dart';

void main() {
  runApp(BlokusDuoApp());
}

class BlokusDuoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blokus Duo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GameBoard(),
    );
  }
}
