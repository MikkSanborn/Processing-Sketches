float theta = 0;
float w, h;
float sc = 1.0; // speedscale
boolean circle = false;

cPoint c1;
cPoint c2;
cPoint[] c = new cPoint[250];

void setup() {
  size(1960, 1080);
  colorMode(HSB, 360, 100, 100);
  
  w = 250;
  h = -250;

  background(0);

  stroke(255);

  w/=2;
  h/=2;

  c1 = new cPoint(width/2, height/2, w, h, 1, 0, 0);
  c2 = new cPoint(width/2, height/2, w, h, -1, 180, 0);

  for (int i = 0; i < c.length; i++) {
    c[i] = new cPoint(random(0, width), random(0, height), w*random(0.1, 2), h*random(0.1, 2), random(-sc, sc), random(0, 360), random(0, 360));
  }
}

void draw() {
  // background(0);
  stroke(255);
  fill(0, 0, 0, 8);
  rect(-10, -10, width+20, height+20);

  if (circle) {
    strokeWeight(1);
    stroke(0, 0, 100);
    ellipse(width/2, height/2, w*2, h*2);
  }
  // c1.display();
  // c2.display();
  for (int i = 0; i < c.length; i++) {
    c[i].display();
  }
  /*
  strokeWeight(10);
   stroke(degrees(theta)%360, 100, 100);
   point(cos(theta)*w+width/2, sin(theta)*h+height/2);
   stroke(360+degrees(-theta*QUARTER_PI)%360, 100, 100);
   point(cos(-theta*QUARTER_PI)*w+width/2, sin(-theta*QUARTER_PI)*h+height/2);
   */

  theta+=0.04;
}

void mouseClicked() {
  // circle = !circle;
  
  for (int i = 0; i < c.length; i++) {
    c[i] = new cPoint(random(0, width), random(0, height), w*random(0.1, 2), h*random(0.1, 2), random(-sc, sc), random(0, 360), random(0, 360));
  }
}

void mouseWheel() {
  background(0);
  draw();
}

class cPoint {
  float x, y;
  float w, h;
  float thOff;
  float stOff;
  float eR;
  float col;

  cPoint(float xt, float yt, float wt, float ht, float tO, float sO, float eRt) {
    x = xt;
    y = yt;
    w = wt;
    h = ht;
    thOff = tO;
    stOff = sO;
    eR = eRt;
    eR = 0;
    col = random(0, 360);
  }

  void display() {
    pushMatrix();
    translate(x, y);
    rotate(degrees(eR));
    strokeWeight(10);
    stroke(abs(degrees(theta*thOff+stOff+eR))%360, 100, 100);
    // stroke(random(0, 360), 100, 100);
    // stroke(random(0, 360));
    // stroke(col, 100, 100);
    // stroke(col);
    point(cos(theta*thOff+stOff)*w, sin(theta*thOff+stOff)*h);
    popMatrix();
  }
}
