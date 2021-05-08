float theta = 0;

void setup() {
  size(500, 500);
}

void draw() {
  pushMatrix();
  translate(width/2, height/2);
  rotate(HALF_PI*cos(radians(theta)));
  background(0);
  fill(255);
  rect(-40, 0, 80, 150);
  triangle(-40, 1, 0, -30, 40, 1);
  fill(0);
  triangle(-10, 25, 0, 0, 10, 25);
  noStroke();
  theta+=2;
  popMatrix();
}
