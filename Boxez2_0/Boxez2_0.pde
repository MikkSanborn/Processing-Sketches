box box1 = new box(random(0, width), random(0, height), random(-4, 4), random(-4, 4), random(0, 255), random(0, 255), random(0, 255), random(-.2, .2));
box[] cuBe = new box[500];

float sC = 3.5; // speed cap

boolean bounce = false; // bounce or warp from wall to wall

float xd, yd; // x-destination, y-destination
float inc = 8;
int r = 42;
int g = 160;
int b = 200;

boolean gravOn = false;

void setup() {
  size(1960, 1080);

  frameRate(120);

  xd = width/2;
  yd = height/2;

  for (int i = 0; i < cuBe.length; i++) {
    cuBe[i] = new box(random(0, width), random(0, height), random(-sC, sC), random(-sC, sC), random(0, 255), random(0, 255), random(0, 255), random(-.2, .2));
  }

  background(0);

  r = 255;
  g = 255;
  b = 255;
}

void draw() {
  fill(r, g, b, 15);
  rect(-2, -2, width+4, height+4);

  if (keyPressed && key == 'c') {
    r = (int) random(0, 256);
    g = (int) random(0, 256);
    b = (int) random(0, 256);
  }

  xd = mouseX;
  yd = mouseY;

  for (int i = 0; i < cuBe.length; i++) {
    cuBe[i].display();
    cuBe[i].move();
    cuBe[i].gravitate();
  }
}

class box {
  float x, y, xs, ys;
  float r, g, b;
  float theta, thetaInc;
  int w;
  boolean grav = false;

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

    w = 12;
  }

  void display() {
    pushMatrix();
    translate(x, y);
    rotate(theta);
    theta += thetaInc;
    noStroke();
    fill(r, g, b);
    r+=random(-10, 10);
    g+=random(-10, 10);
    b+=random(-10, 10);
    if (r > 255 || r < 0) {
      r = 122;
    }
    if (g > 255 || g < 0) {
      g = 122;
    }
    if (b > 255 || b < 0) {
      b = 122;
    }
    rect(-w/2, -w/2, w, w);
    popMatrix();
  }

  void move() {
    x += xs;
    y += ys;

    if (bounce) {
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
    } else {
      if (x-w*2 > width) {
        x = 0-w;
      }
      if (x+w*2 < 0) {
        x = width+w;
      }
      if (y-w*2 > height) {
        y = 0-w;
      }
      if (y+w*2 < 0) {
        y = height+w;
      }
    }
  }

  void gravitate() {
    // destination is center
    if (mousePressed) {
      grav = true;
    }

    if (gravOn) { // used to be 'grav', grav is now obsolete
      if (x >= xd) {
        x -= (dist(x, 0, xd, 0)/width)*inc;
      } else {
        x += (dist(x, 0, xd, 0)/width)*inc;
      }
      if (y >= yd) {
        y -= (dist(0, y, 0, yd)/height)*inc;
      } else {
        y += (dist(0, y, 0, yd)/height)*inc;
      }
      xs*=0.99;
      ys*=0.99;
      thetaInc*=0.99;
      // inc*=1.0001;
    }
  }
}

void mouseClicked() {
  if (gravOn == false) {
    gravOn = true;
  } else {
    gravOn = false;

    for (int i = 0; i < cuBe.length; i++) {
      cuBe[i] = new box(cuBe[i].x, cuBe[i].y, random(random(-sC*2, sC*2))*1.2, random(random(-sC*2, sC*2))*1.2, cuBe[i].r, cuBe[i].g, cuBe[i].b, random(-.2, .2));
    }
  }
}
