int[][] pixelValues;

int scale = 10;

void setup() {
  size(500, 500);
  frameRate(2);

  pixelValues = new int[width/scale][height/scale];
  
  key = 'r';
  keyPressed();
}

void draw() {
  pushMatrix();
  translate(0, 0);
  scale(scale);

  background(0);
  for (int i = 0; i < pixelValues.length; i++) {
    for (int j = 0; j < pixelValues[i].length; j++) {
      stroke(pixelValues[i][j], pixelValues[i][j], pixelValues[i][j]);
      point(i, j);
    }
  }

  popMatrix();
}

void keyPressed() {
  if (key == 'r') {
    for (int i = 0; i < pixelValues.length; i++) {
      for (int j = 0; j < pixelValues[i].length; j++) {
        pixelValues[i][j] = (int) random(0, 255);
      }
    }
  } else if (key == 's') {
    println("\"sorting\"");
    for (int i = 0; i < pixelValues.length-2; i++) {
      for (int j = 0; j < pixelValues[i].length-2; j++) {
        pixelValues[i][j] -= pixelValues[i+2][j+2];
      }
    }
  } else if (key == 'a') {
    
  }
}
