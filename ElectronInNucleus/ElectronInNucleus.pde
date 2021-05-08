float theta = 0;
float w, h;
boolean circle = false;

cPoint[] c = new cPoint[28];

void setup() {
  size(500, 500);
  colorMode(HSB, 360, 100, 100);
  
  w = 100;
  h = -100;

  background(0);

  stroke(255);

  w/=2;
  h/=2;

  for (int i = 0; i < c.length; i++) {
    c[i] = new cPoint(width/2, height/2, w*(i <= 1 ? 1.5:(i <= 9 ? 2:2.5)), h*(i <= 1 ? 1.5:(i <= 9 ? 2:2.5)), 1.2, (i<=1 ? i*180:(i<=9?i*(180.0/8):i*10)), 0);
  }
  //                                                 cPoint(float xt, float yt, float wt, float ht, float tO, float sO, float eRt) {
}

void draw() {
  stroke(255);
  fill(0, 0, 0, 20);
  rect(-10, -10, width+20, height+20);

  if (circle) {
    strokeWeight(1);
    stroke(0, 0, 100);
    ellipse(width/2, height/2, w*2, h*2);
  }
  for (int i = 0; i < c.length; i++) {
    c[i].display();
  }

  theta+=0.04;
}

void mouseClicked() {
  circle = !circle;
}

class cPoint {
  float x, y;
  float w, h;
  float thOff;
  float stOff;
  float eR;

  cPoint(float xt, float yt, float wt, float ht, float tO, float sO, float eRt) {
    x = xt;
    y = yt;
    w = wt;
    h = ht;
    thOff = tO;
    stOff = sO;
    eR = eRt;
    eR = 0;
  }

  void display() {
    pushMatrix();
    translate(x, y);
    rotate(degrees(eR));
    strokeWeight(10);
    stroke(abs(degrees(theta*thOff+stOff+eR))%360, 100, 100);
    point(cos(theta*thOff+stOff)*w, sin(theta*thOff+stOff)*h);
    popMatrix();
  }
}
