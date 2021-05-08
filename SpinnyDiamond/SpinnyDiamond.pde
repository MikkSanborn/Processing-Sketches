float t = 0;
float theta = 0;
float r = 150;
int amount = 6;

float px, py;

void setup() {
  size(500, 500);

  noFill();
  strokeWeight(3);
  stroke(255);
}

void draw() {
  background(0);

  for (int i = -amount/2; i <= amount/2; i++) {
    theta = 1+PI*sin(t+i/1.0)/5;
    float x = r*cos(theta);
    float y = r*sin(theta)+.2*(x-px);
    if (i != -amount/2) {
      line(width/2, height/2, width/2+x, height/2+y); // base to points
      line(width/2+x, height/2+y, width/2-80, 80); // tip to points
      line(width/2+x, height/2+y, width/2+px, height/2+py); // point to point
      px = x;
      py = y;
    }
  }

  t+=0.03;
}

void keyPressed() {
  if (key == 'P') {
    noLoop();
  }
}
