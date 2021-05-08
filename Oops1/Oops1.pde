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
    theta = -HALF_PI+PI*sin(t+i/1.0)/5;
    println(py);
    float x = r*cos(theta);
    float y = r*sin(theta);
    float y2 = (y-py)*4.0;
    if (i != -amount/2) {
      line(width/2, height/2, width/2+x, height/2+y);
      line(width/2+x, height/2+y2, width/2+px, height/2+py+(y2-y));
      px = x;
      py = y;
    }
  }

  t+=0.03;
}
