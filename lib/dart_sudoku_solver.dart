class SudoKuSolver {
  static final int _gridSize = 9;

  bool _isNumberInRow({
    required List<List<int>> board,
    required int row,
    required int number,
  }) {
    for (int i = 0; i < _gridSize; i++) {
      if (board[row][i] == number) {
        return true;
      }
    }

    return false;
  }

  bool _isNumberInColumn({
    required List<List<int>> board,
    required int column,
    required int number,
  }) {
    for (int i = 0; i < _gridSize; i++) {
      if (board[i][column] == number) {
        return true;
      }
    }

    return false;
  }

  bool _isNumberInBox({
    required List<List<int>> board,
    required int row,
    required int column,
    required int number,
  }) {
    final int boxRowStart = row - (row % 3);
    final int boxColumnStart = column - (column % 3);

    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        if (board[boxRowStart + i][boxColumnStart + j] == number) {
          return true;
        }
      }
    }

    return false;
  }

  bool _isValidPlacement({
    required List<List<int>> board,
    required int row,
    required int column,
    required int number,
  }) =>
      !_isNumberInRow(board: board, row: row, number: number) &&
      !_isNumberInColumn(board: board, column: column, number: number) &&
      !_isNumberInBox(board: board, row: row, column: column, number: number);

  void printBoard(List<List<int>> board) {
    for (int i = 0; i < _gridSize; i++) {
      print(
        '${board[i][0]} ${board[i][1]} ${board[i][2]}  ${board[i][3]} ${board[i][4]} ${board[i][5]}  ${board[i][6]} ${board[i][7]} ${board[i][8]}',
      );

      if ((i + 1) % 3 == 0) {
        print('\n');
      }
    }
  }

  bool solve(List<List<int>> board) {
    for (int i = 0; i < _gridSize; i++) {
      for (int j = 0; j < _gridSize; j++) {
        if (board[i][j] == 0) {
          for (int k = 1; k <= _gridSize; k++) {
            if (_isValidPlacement(board: board, row: i, column: j, number: k)) {
              board[i][j] = k;
              solve(board);
              board[i][j] = 0;
            }
          }

          return false;
        }
      }
    }

    printBoard(board);

    return true;
  }
}
