int cols = 10;
int rows = 20;
int[][] grid = new int[cols][rows];
int blockSize;
Shape currentShape;

void setup() {
  size(400, 800);
  blockSize = width / cols;
  currentShape = new Shape();
}

void draw() {
  background(0);
  currentShape.show();
  drawGrid();
}

void drawGrid() {
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      if (grid[i][j] != 0) {
        fill(255);
        stroke(0);
        rect(i * blockSize, j * blockSize, blockSize, blockSize);
      }
    }
  }
}

void keyPressed() {
  if (keyCode == LEFT) {
    currentShape.move(-1, 0);
  } else if (keyCode == RIGHT) {
    currentShape.move(1, 0);
  } else if (keyCode == DOWN) {
    currentShape.move(0, 1);
  } else if (keyCode == UP) {
    currentShape.rotate();
  }
}

void moveDownEvent() {
  currentShape.move(0, 1);
}

void updateGrid() {
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      grid[i][j] = 0;
    }
  }
  currentShape.updateGrid();
}

void checkRows() {
  for (int j = rows - 1; j >= 0; j--) {
    boolean full = true;
    for (int i = 0; i < cols; i++) {
      if (grid[i][j] == 0) {
        full = false;
        break;
      }
    }
    if (full) {
      for (int k = j; k > 0; k--) {
        for (int i = 0; i < cols; i++) {
          grid[i][k] = grid[i][k - 1];
        }
      }
      for (int i = 0; i < cols; i++) {
        grid[i][0] = 0;
      }
    }
  }
}

void gameOver() {
  noLoop();
  textAlign(CENTER, CENTER);
  textSize(32);
  fill(255, 0, 0);
  text("Game Over", width / 2, height / 2);
}

void mousePressed() {
  moveDownEvent();
}

void mouseReleased() {
  // Do nothing
}

void mouseMoved() {
  // Do nothing
}

void mouseDragged() {
  // Do nothing
}
