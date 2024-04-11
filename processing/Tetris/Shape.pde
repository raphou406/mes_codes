class Shape {
  int[][] shape;
  int col;
  int row;

  Shape() {
    col = cols / 2 - 1;
    row = 0;
    shape = generateRandomShape();
  }

  void show() {
    for (int i = 0; i < shape.length; i++) {
      for (int j = 0; j < shape[i].length; j++) {
        if (shape[i][j] != 0) {
          fill(255);
          stroke(0);
          rect((col + i) * blockSize, (row + j) * blockSize, blockSize, blockSize);
        }
      }
    }
  }

  void move(int moveCol, int moveRow) {
    if (isValidMove(col + moveCol, row + moveRow, shape)) {
      col += moveCol;
      row += moveRow;
    }
  }

  void rotate() {
    int[][] rotatedShape = rotateMatrix(shape);
    if (isValidMove(col, row, rotatedShape)) {
      shape = rotatedShape;
    }
  }

  void updateGrid() {
    for (int i = 0; i < shape.length; i++) {
      for (int j = 0; j < shape[i].length; j++) {
        if (shape[i][j] != 0) {
          grid[col + i][row + j] = 1;
        }
      }
    }
    checkRows();
    currentShape = new Shape();
  }

  boolean isValidMove(int newCol, int newRow, int[][] newShape) {
    for (int i = 0; i < newShape.length; i++) {
      for (int j = 0; j < newShape[i].length; j++) {
        if (newShape[i][j] != 0) {
          int colIndex = newCol + i;
          int rowIndex = newRow + j;

          if (colIndex < 0 || colIndex >= cols || rowIndex >= rows || (rowIndex > 0 && grid[colIndex][rowIndex] != 0)) {
            return false;
          }
        }
      }
    }
    return true;
  }

  int[][] rotateMatrix(int[][] mat) {
    int M = mat.length;
    int N = mat[0].length;
    int[][] result = new int[N][M];

    for (int i = 0; i < M; i++) {
      for (int j = 0; j < N; j++) {
        result[j][M - 1 - i] = mat[i][j];
      }
    }

    return result;
  }

  int[][] generateRandomShape() {
    int[][][] shapes = {
      { { 1, 1, 1, 1 } },
      { { 1, 1, 1 }, { 1 } },
      { { 1, 1, 1 }, { 0, 0, 1 } },
      { { 1, 1, 1 }, { 0, 1 } },
      { { 1, 1, 1 }, { 1, 0, 0 } },
      { { 1, 1 }, { 1, 1 } },
      { { 1, 1, 1 }, { 0, 1, 0 } }
    };

    return shapes[(int) random(shapes.length)];
  }
}
