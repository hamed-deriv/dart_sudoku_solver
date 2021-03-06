import 'package:dart_sudoku_solver/dart_sudoku_solver.dart';

final List<List<int>> board = [
  [7, 0, 2, 0, 5, 0, 6, 0, 0],
  [0, 0, 0, 0, 0, 3, 0, 0, 0],
  [1, 0, 0, 0, 0, 9, 5, 0, 0],
  [8, 0, 0, 0, 0, 0, 0, 9, 0],
  [0, 4, 3, 0, 0, 0, 7, 5, 0],
  [0, 9, 0, 0, 0, 0, 0, 0, 8],
  [0, 0, 9, 7, 0, 0, 0, 0, 5],
  [0, 0, 0, 2, 0, 0, 0, 0, 0],
  [0, 0, 7, 0, 4, 0, 2, 0, 3]
];

void main(List<String> arguments) {
  final SudoKuSolver solver = SudoKuSolver();

  print("Initial board:\n");
  solver.printBoard(board);

  print("Solved board:\n");
  solver.solve(board);
}
