float x1, y1, x2, y2;

float theta = 0;

int time = 0;

float thMult1 = 4;
float thMult2 = 1;

void setup() {
  size(500, 500);

  x1 = width/2+25*cos(theta*thMult1);
  y1 = height/2+25*sin(theta*thMult1);
  x2 = width/2+25*cos(theta*thMult2);
  y2 = height/2+25*sin(theta*thMult2);

  strokeWeight(1);
  stroke(255, 255, 255, 20);

  background(0);
}

void draw() {
  fill(255);
  ellipse(width/2, height/2, 10, 10);

  noFill();
  ellipse(x1, y1, 12, 12);
  ellipse(x2, y2, 12, 12);

  if (time%1 == 0) {
    line(x1, y1, x2, y2);
  }

  ellipse(width/2, height/2, 200, 200);
  x1 = width/2+100*cos(theta*thMult1+HALF_PI);
  y1 = height/2+100*sin(theta*thMult1+HALF_PI);

  ellipse(width/2, height/2, 300, 300);
  x2 = width/2+150*cos(theta*thMult2);
  y2 = height/2+150*sin(theta*thMult2);

  theta+=0.005;

  time++;
}

void mouseClicked() {
  background(0);
}
