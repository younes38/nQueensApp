class QueenSolver {
  final int max = 10;

  List<List<List<int>>> getSolutions() {
    List<List<List<int>>> finalSolutions = new List<List<List<int>>>();
    for (int i = 0; i < 4; i++) finalSolutions.add([]);
    for (int n = 4; n <= max; n++) {
      List<List<int>> sol = _getSolutionFor(n);

      finalSolutions.add(sol);
    }

    return finalSolutions;
  }

  List<int> col;

  bool isPossible(x, y) {
    for (int a = 0; a < x; a++) {
      int b = col[a];
      if (b == y || a + b == x + y || a - b == x - y) return false;
    }
    return true;
  }

  List<List<int>> solutionsForOneCase;
  void _solve(int i, int n) {
    if (i == n) {
      List<int> toAdd = new List<int>(n);
      for (int j = 0; j < n; j++) toAdd[j] = col[j];
      solutionsForOneCase.add(toAdd);
      return;
    }

    for (int j = 0; j < n; j++) {
      if (isPossible(i, j)) {
        col[i] = j;
        _solve(i + 1, n);
      }
    }
  }

  List<List<int>> _getSolutionFor(int n) {
    col = new List<int>(n);
    solutionsForOneCase = new List<List<int>>();
    _solve(0, n);
    return solutionsForOneCase;
  }
}
