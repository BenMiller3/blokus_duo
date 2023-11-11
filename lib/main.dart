import 'package:blocks_duo/widgets/game_board.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/game_bloc/game_bloc.dart';

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
      home: BlocProvider(
        create: (context) => GameBloc(),
        child: GameBoard(),
      ),
    );
  }
}
