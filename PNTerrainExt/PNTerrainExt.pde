float a = 50;

float zMax = 200; // z-maximum
float zMin = 300; // z-minimum
float oM = 2; // offset multiplier

int cols, rows;
int scl = 20;
int w = 2000;
int h = 1600;

float flying = 0;

float[][] terrain;

void setup() {
  size(600, 600, P3D);
  colorMode(HSB, 360, 100, 100, 100);
  cols = w/scl;
  rows = h/scl;

  terrain = new float[cols][rows];
}

void draw() {

  if (keyPressed && key == 't') {
    zMax = mouseY*oM;
  }
  if (keyPressed && key == 'b') { 
    zMin = mouseY*oM;
  }

  zMax = 200;
  zMin = 200;

  flying -= 0.2;

  float yoff = flying;
  for (int y = 0; y < rows; y++) {
    float xoff = 0;
    for (int x = 0; x < cols; x++) {
      if (abs(map(noise(xoff, yoff), 0, 1, -200, 200)) < 75) {
        terrain[x][y] = map(noise(xoff, yoff), 0, 1, -zMin, zMax); // 200
      } else {
        if (abs(map(noise(xoff, yoff), 0, 1, -200, 200)) < 100) {
          terrain[x][y] = map(noise(xoff, yoff), 0, 1, -zMin*1.5, zMax*1.5); // 300
        } else {
          terrain[x][y] = map(noise(xoff, yoff), 0, 1, -zMin*2, zMax*2); // 400
        }
      }
      xoff += 0.2;
    }
    yoff += 0.2;
  }

  background(0);
  stroke(0, 0, 100, 50);
  strokeWeight(1);
  // noFill();

  translate(width/2, height/2);
  rotateX(PI/3);
  translate(-w/2, -h*0.75);
  for (int y = 0; y < rows-1; y++) {
    beginShape(TRIANGLE_STRIP);
    for (int x = 0; x < cols; x++) {
      fill(terrain[x][y]/1.5+50, terrain[x][y]/3+70, terrain[x][y]/2+65, a);
      vertex(x*scl, y*scl, terrain[x][y]);
      vertex(x*scl, (y+1)*scl, terrain[x][y+1]);
    }
    endShape();
  }
}

void keyReleased() {
  if (key == 's') {
    noLoop();
  }
}
