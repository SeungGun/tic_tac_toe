class Player {
  static const x = "X";
  static const o = "O";
  static const empty = "";
}

class Game {
  static final boardLength = 9;
  static final blocSize = 100.0;

  List<String>? board;

  static List<String>? initGameBoard() =>
      List.generate(boardLength, (index) => Player.empty);

  bool winnerCheck(
      String player, int index, List<int> scoreboard, int gridSize) {
    int row = index ~/ 3;
    int co1 = index % 3;
    int score = player == "X" ? 1 : -1;

    scoreboard[row] += score; // (r, c)에 해당하는 위치의 row 체크
    scoreboard[gridSize + co1] += score; // (r, c)에 해당하는 위치의 col 체크
    if (row == co1) scoreboard[2 * gridSize] += score; // 왼쪽 -> 오른쪽으로 가는 대각선 체크
    if (gridSize - 1 - co1 == row) scoreboard[2 * gridSize + 1] += score; // 오른쪽 -> 왼쪽으로 가는 대각선 체크

    if (scoreboard.contains(3) || scoreboard.contains(-3)) {
      return true;
    }

    return false;
  }
}
