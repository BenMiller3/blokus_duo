class GameState {
  static const int boardSize = 14;
  List<List<int>> board = List.generate(boardSize, (i) => List.filled(boardSize, 0));
  int currentPlayer = 1;
  int scoreP1 = 0;
  int scoreP2 = 0;

  // Method to switch the current player
  void switchPlayer() {
    currentPlayer = currentPlayer == 1 ? 2 : 1;
    // Additional logic as needed
  }

  // Method to update the score
  void updateScore(int player, int score) {
    if (player == 1) {
      scoreP1 += score;
    } else {
      scoreP2 += score;
    }
  }

// Add other game-related methods here
}