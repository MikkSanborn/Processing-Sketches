float t = 0;
float theta = 0;
float r = 150;
int amount = (int) 8;

float px, py;

void setup() {
  size(500, 500);

  noFill();
  strokeWeight(1);
  stroke(255, 120);
}

void draw() {
  background(0);

  int MIN = -amount/2;
  int MAX = amount/2;

  float sb = 1.02; // space between?

  float w = 0.3; // 0.2 is default

  float fX = 0; // first X
  float fY = 0; // first Y

  for (int i = MIN; i <= MAX; i++) {
    theta = -1.57+PI*sin(t+i/sb)*w;
    float x = r*cos(theta);
    float y = r*sin(theta)+.2*(x-px);
    if (i != MIN && i!= MAX) {
      stroke(255);
      line(width/2, height/2, width/2+x, height/2+y); // base to points
      line(width/2+x, height/2+y, width/2, 40); // tip to points
      if (i != MIN+1) { 
        stroke(0, 0, 255);
        line(width/2+x, height/2+y, width/2+px, height/2+py); // point to point
      } else {
        line(width/2+x, height/2+y, width/2+fX, height/2+fY);
      }
    } else {
      fX = x;
      fY = y;
    }
    px = x;
    py = y;
  }

  t+=0.03;
}

void keyPressed() {
  if (key == 'P') {
    noLoop();
  }
}
