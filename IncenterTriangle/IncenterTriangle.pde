float[][] pos = new float[3][2]; // 3 points, 2 parts (x, y)
float xf, yf, r;
float a, b, c;

void setup() {
  size(500, 500);
  pos[0][0] = 100.0;
  pos[0][1] = 150;
  pos[1][0] = 278;
  pos[1][1] = 379;
  pos[2][0] = 84;
  pos[2][1] = 437;

  noFill();
  stroke(255);
}

void draw() {
  background(0);

  adjustPoints();

  updateVars();

  strokeWeight(8);
  stroke(0, 255, 0);
  triangle(pos[0][0], pos[0][1], pos[1][0], pos[1][1], pos[2][0], pos[2][1]);

  stroke(0, 0, 255);
  ellipse(xf, yf, r*2, r*2);

  stroke(255, 0, 0);
  point(xf, yf);

  strokeWeight(3);
  line(pos[0][0], pos[0][1], xf, yf);
  line(pos[1][0], pos[1][1], xf, yf);
  line(pos[2][0], pos[2][1], xf, yf);
}

void updateVars() {
  float m1 = (pos[0][1]-pos[1][1])/(pos[0][0]-pos[1][0]);
  float m2 = (pos[1][0]-pos[0][0])/(pos[0][1]-pos[1][1]);
  float b1 = pos[0][1]-m1*pos[0][0]; // b = y - mx
  float b2 = yf-m2*xf;
  a = sqrt(sq(pos[1][0]-pos[2][0])+sq(pos[1][1]-pos[2][1]));
  b = sqrt(sq(pos[2][0]-pos[0][0])+sq(pos[2][1]-pos[0][1]));
  c = sqrt(sq(pos[0][0]-pos[1][0])+sq(pos[0][1]-pos[1][1]));
  float A = sqrt((a+b+c)*(b+c)*(a+c)*(a+b));
  xf = (a*pos[0][0]+b*pos[1][0]+c*pos[2][0])/(a+b+c);
  yf = (a*pos[0][1]+b*pos[1][1]+c*pos[2][1])/(a+b+c);
  r = 2*A/(a+b+c);
  float xN = ((m1-m2)/(b2-b1));
  float yN = m1*xN+b1;
  xN = (b2-b1)/(m1-m2);
  yN = (b2*m1-b1*m2)/(m1-m2);
  strokeWeight(8);
  stroke(255);
  strokeWeight(10);
  point(xN, yN);
  r = sqrt(sq(xf-xN)+sq(yf-yN));
}

void adjustPoints() {
  if (mousePressed) {
    if (key == 'a') {
      pos[0][0] = mouseX;
      pos[0][1] = mouseY;
    }
    if (key == 'b') {
      pos[1][0] = mouseX+.25;
      pos[1][1] = mouseY+.25;
    }
    if (key == 'c') {
      pos[2][0] = mouseX+.5;
      pos[2][1] = mouseY+.5;
    }
  }
}

void mouseWheel() {
  pos[0][0] = random(0, 500);
  pos[0][1] = random(0, 500);
  pos[1][0] = random(0, 500)+.25;
  pos[1][1] = random(0, 500)+.25;
  pos[2][0] = random(0, 500)+.5;
  pos[2][1] = random(0, 500)+.5;
}
