boolean[][] grid;


void setup() {
  fullScreen();

  grid = new boolean[50][50]; //change me to change the size of the array to sort. first dimension is number of numbers to sort, second number is the maximum number.


  for (int i = 0; i < grid.length; i++) {
    int value = int(random(grid[i].length))+1;
    println(value);
    setNumber(i, value);
  }
}

void draw() {
  background(51);

  shiftTrues();

  for (int i = 0; i< grid.length; i++) {
    for (int j = 0; j< grid[i].length; j++) {
      float size = min(width/grid.length/1.0, height/grid[i].length/1.0);
      float xPos = i*width/grid.length/1.0+width/grid.length/2.0;
      float yPos = j*height/grid[i].length/1.0+height/grid[i].length/2.0;
      if (grid[i][j]) ellipse(xPos, height - yPos, size*.85, size*.85);
    }
  }
}

void keyPressed() {
  if (key == 'r') {
    for (int i = 0; i < grid.length; i++) {
      int value = int(random(grid[i].length))+1;
      println(value);
      setNumber(i, value);
    }
  }
}

void setNumber(int index, int val) {
  for (int i = 0; i < grid[index].length; i++) {
    if (i < val) {
      grid[index][i] = true;
    } else {
      grid[index][i] = false;
    }
  }
}

void shiftTrues() {
  for (int i = grid[0].length-1; i > 0; i--) {
    for (int j = grid.length-1; j > 0; j--) {
      if (!grid[j][i]) {
        boolean temp = grid[j][i];
        grid[j][i] = grid[j-1][i];
        grid[j-1][i] = temp;
      }
    }
  }
}
