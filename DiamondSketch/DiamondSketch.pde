RotatingLine[] r = new RotatingLine[6];

void setup() {
  size(500, 500);

  float red = 5; // they're all going to be the same... might as well
  float tDO = -PI;

  /*
  r[0] = new RotatingLine(width/2, height/2, width/2, height/2+100, 0, 0.03, red, tDO);
   r[1] = new RotatingLine(width/2, height/2, width/2, height/2+100, 1, 0.03, red, tDO);
   r[2] = new RotatingLine(width/2, height/2, width/2, height/2+100, -1, 0.03, red, tDO);
   */

  for (int i = 0; i < r.length; i++) {
    r[i] = new RotatingLine(width/2, height/2, width/2, height/2+100, i, 0.03, red, tDO, (i == r.length-1 ? color(255, 0, 0):color(255)));
  }
}

void draw() {
  background(0);

  for (int i = 0; i < r.length; i++) {
    r[i].display();
    r[i].move();
  }
}

class RotatingLine {
  float x1, y1, x2, y2;
  float t, tInc;
  float reduct;
  float tDO; // theta display offset
  color c;

  RotatingLine(float x1, float y1, float x2, float y2, float t, float tInc, float reduct, float tDO, color c) {
    this.x1 = x1;
    this.y1 = y1;
    this.x2 = x2;
    this.y2 = y2;
    this.t = t;
    this.tInc = tInc;
    this.reduct = reduct;
    this.tDO = tDO;
    this.c = c;
  }

  void display() {
    pushMatrix();
    translate(x1, y1);
    rotate(PI*sin(t)/reduct+tDO);

    noFill();
    stroke(c);
    strokeWeight(3);
    line(0, 0, x2-x1, y2-y1);

    popMatrix();
  }

  void move() {
    t+=tInc;
    t%=TWO_PI;
  }
}
