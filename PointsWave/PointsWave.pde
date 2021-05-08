int count = 10;
int r = 15;
int drawType = 1; // 1 = along x, 2 == along y, 3 == along x&y
float thInc = -0.25;
float countWaves = 8;
float[][] pos = new float[count][count];

float theta = 0;

void setup() {
  size(500, 500, P3D);

  for (int x = 0; x < pos.length; x++) {
    for (int y = 0; y < pos[0].length; y++) {
      pos[x][y] = r*TWO_PI/width*x*y;
      pos[x][y] = 0;
    }
  }
  strokeWeight(3);

  countWaves*=4; // for some reason it will show cW/4 by default... adjusting here
}

void draw() {
  pushMatrix();
  translate(0, 0, -200);
  background(0);
  rotateX(TWO_PI*mouseX/width);

  for (int x = 0; x < pos.length; x++) {
    for (int y = 0; y < pos[0].length; y++) {
      strokeWeight(3);
      stroke(x*width/255.0, y*width/255.0, 0);
      point(x*width/count, y*width/count, pos[x][y]);

      if (x > 0 && y > 0) {
        strokeWeight(1);
        line(x*width/count, y*width/count, pos[x][y], (x-1)*width/count, y*width/count, pos[x-1][y]);
        line(x*width/count, y*width/count, pos[x][y], x*width/count, (y-1)*width/count, pos[x][y-1]);
      }

      changePos(x, y);
    }
  }
  theta += thInc;
  popMatrix();
}

void changePos(int x, int y) {
  if (drawType == 1) {
    pos[x][y] = r*sin(theta+(countWaves*TWO_PI*x/width));
  } else if (drawType == 2) {
    pos[x][y] = r*sin(theta+(countWaves*TWO_PI*y/width));
  } else if (drawType == 3) {
    pos[x][y] = r*sin(theta+(countWaves*TWO_PI*x*y/width/width));
  }
}

void mouseClicked() {
  println(pos[0][0]);
}
