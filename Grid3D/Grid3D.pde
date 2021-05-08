float[][] points = new float[25][25];
float dX; // delta x (distance between x points)
float dY;

void setup() {
  size(500, 500, P3D);

  dX = width/points.length;
  dY = height/points[0].length;

  points[0][0] = random(-10, 10);
  for (int i = 1; i < points.length; i++) {
    for (int j = 1; j < points[0].length; j++) {
      points[i][j] = random(-10, 10)+(points[i-1][j]+points[i][j-1])/2;
    }
  }

  stroke(255);
}

void draw() {
  background(0);
  
  pushMatrix();
  translate(width/2, height/2);
  rotateX(-0.1);
  rotateY((float) mouseY/width * TWO_PI);
  rotateZ((float) mouseX/width * TWO_PI);

  for (int i = 1; i < points.length; i++) {
    for (int j = 1; j < points[0].length; j++) {
      strokeWeight(3);
      point(dX*i, dY*j, points[i][j]);
      strokeWeight(1);
      line(dX*i, dY*i, points[i][j], dX*(i-1), dY*(j), points[i-1][j]);
      line(dX*i, dY*i, points[i][j], dX*(i), dY*(j-1), points[i][j-1]);
      // println(dX*i + "   " + dY*j + "   " + points[i][j]);
    }
  }
  popMatrix();
}
