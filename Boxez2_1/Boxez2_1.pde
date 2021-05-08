box box1 = new box(random(0, width), random(0, height), random(-4, 4), random(-4, 4), random(0, 255), random(0, 255), random(0, 255), random(-.2, .2));
box[] cuBe = new box[1000];
boolean grav = false;

void setup() {
  size(1960, 1080);
  
  for (int i = 0; i < cuBe.length; i++) {
    cuBe[i] = new box(random(0, width), random(0, height), random(-4, 4), random(-4, 4), random(0, 255), random(0, 255), random(0, 255), random(-.2, .2));
  }

  background(0);
}

void draw() {
  fill(0, 0, 0, 20);
  rect(-2, -2, width+4, height+4);

  box1.display();
  box1.move();
  box1.gravitate();

  for (int i = 0; i < cuBe.length; i++) {
    cuBe[i].display();
    cuBe[i].move();
    cuBe[i].gravitate();
  }
}

void mouseClicked() {
  grav = !grav;
}

class box {
  float x, y, xs, ys;
  float r, g, b;
  float theta, thetaInc;
  int w;
  // boolean grav = false;

  box(float xt, float yt, float xst, float yst, float rt, float gt, float bt, float thetaInct) {
    x = xt;
    y = yt;
    xs = xst;
    ys = yst;
    r = rt;
    g = gt;
    b = bt;
    theta = 0;
    thetaInc = thetaInct;

    w = 20;
  }

  void display() {
    pushMatrix();
    translate(x, y);
    rotate(theta);
    theta += thetaInc;
    noStroke();
    fill(r, g, b);
    rect(-w/2, -w/2, w, w);
    popMatrix();
  }

  void move() {
    x += xs;
    y += ys;

    if (x-w/2 <= 0) {
      xs*=-1;
      x = w/2+1;
    } else if (x+w/2 > width) {
      xs*=-1;
      x = width-w/2-1;
    }
    if (y-w/2 <=0) {
      ys*=-1;
      y = w/2+1;
    } else if (y+w/2 >= height) {
      ys*=-1;
      y = height-w/2-1;
    }
  }

  void gravitate() {
    // destination is center

    if (grav) {
      if (x >= width/2) {
        x -= 1/(dist(x, 0, width/2, 0)/width);
      } else {
        x += 1/(dist(x, 0, width/2, 0)/width);
      }
      if (y >= height/2) {
        y -= 1/(dist(0, y, 0, height/2)/height);
      } else {
        y += 1/(dist(0, y, 0, height/2)/height);
      }
      xs*=0.99;
      ys*=0.99;
      thetaInc*=0.99;
    }
  }
}
