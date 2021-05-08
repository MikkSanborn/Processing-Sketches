box box1 = new box(random(0, width), random(0, height), random(-4, 4), random(-4, 4), random(0, 255), random(0, 255), random(0, 255), random(-.2, .2));
box[] cuBe = new box[100];

float xd, yd; // x-destination, y-destination
float inc = 3;
float thetaA;

boolean gravOn = false;

void setup() {
  size(1000, 1000);
  
  xd = width/2;
  yd = height/2;

  for (int i = 0; i < cuBe.length; i++) {
    cuBe[i] = new box(random(0, width), random(0, height), random(-4, 4), random(-4, 4), random(0, 255), random(0, 255), random(0, 255), random(-.2, .2));
  }

  background(0);
}

void draw() {
  fill(0, 0, 0, 25);
  rect(-2, -2, width+4, height+4);
  
  thetaA += 0.05;
  
  // xd = mouseX;
  // yd = mouseY;

  pushMatrix();
  translate(xd, yd);
  scale(2);
  rotate(thetaA);
  pushMatrix();
  translate(-xd, -yd);
  for (int i = 0; i < cuBe.length; i++) {
    cuBe[i].display();
    cuBe[i].move();
    cuBe[i].gravitate();
  }
  popMatrix();
  popMatrix();
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

    w = (width+height)/2/25/4;
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
      cuBe[i] = new box(cuBe[i].x, cuBe[i].y, random(random(random(-12, 12))), random(random(random(-12, 12))), cuBe[i].r, cuBe[i].g, cuBe[i].b, random(-.2, .2));
    }
  }
}
