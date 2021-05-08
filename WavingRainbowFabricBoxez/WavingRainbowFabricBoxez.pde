int perW = 1080/25;
int perH = 1080/25;
float r = 5*PI;
float initThetaFrequency = 0.008;
float thetaDeltaSpeed = .0175;
float alpha = 255;
float pointSize = 5;
float[][] theta = new float[perW][perH];
float[][][] points = new float[perW][perH][3];
box[][] boxPoints = new box[perW][perH];
// [1] = x pos, [2] = y pos, [3] = (x, y)
boolean gravOn = true; // true: to original location, false: to mouse

void setup() {
  size(1080, 1080);
  colorMode(HSB, width, height, 100);
  strokeWeight(pointSize);

  for (int i = 0; i < points.length; i++) {
    for (int j = 0; j < points[0].length; j++) {
      points[i][j][0] = width/perW*i;
      points[i][j][1] = height/perH*j;
      theta[i][j] = initThetaFrequency*i*j; // 2d wave (ripple)
      points[i][j][2] = random(1, pointSize*2/3);
      // theta[i][j] = initThetaFrequency*i; // linear wave
      boxPoints[i][j] = new box(points[i][j][0], points[i][j][1], random(-4, 4), random(-4, 4), points[i][j][0], points[i][j][1], 100, random(-.2, .2));
    }
  }
}

void draw() {
  background(0, 0, 0);

  for (int i = 0; i < points.length; i++) {
    for (int j = 0; j < points[0].length; j++) {
      strokeWeight(pointSize);
      points[i][j][0] = cos(theta[i][j])*r+(width/perW*i);
      points[i][j][1] = sin(theta[i][j])*r+(height/perH*j);
      stroke(points[i][j][0], points[i][j][1], 100, alpha);
      point(points[i][j][0], points[i][j][1]);
      theta[i][j] += thetaDeltaSpeed;
      strokeWeight(pointSize/5);
      // strokeWeight(points[i][j][2]);
      stroke(points[i][j][0], points[i][j][1], 100, alpha);
      fill(points[i][j][0], points[i][j][1], 100, alpha/2);
      if (i > 0 && j > 0) {
        // line(points[i][j][0], points[i][j][1], points[i-1][j][0], points[i-1][j][1]);
        // line(points[i][j][0], points[i][j][1], points[i][j-1][0], points[i][j-1][1]);
        quad(points[i][j][0], points[i][j][1], points[i-1][j][0], points[i-1][j][1], points[i-1][j-1][0], points[i-1][j-1][1], points[i][j-1][0], points[i][j-1][1]);
      }
    }
  }

  for (int i = 0; i < points.length; i++) {
    for (int j = 0; j < points[0].length; j++) {
      if (gravOn) {
        // boxPoints[i][j].x = points[i][j][0];
        // boxPoints[i][j].y = points[i][j][1];
      }
      boxPoints[i][j].display();
      boxPoints[i][j].gravitate(points[i][j][0], points[i][j][1]);
    }
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

    w = 4;
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
    boolean bounce = true; // generally, this will be global, but here it is always off
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

  void gravitate(float xd, float yd) {
    float inc = 8; // idk why 8
    // destination is center
    if (mousePressed) {
      grav = true;
    }

    if (gravOn) { // to original point
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
      if (dist(x, y, xd, yd) < 10) {
        x = xd;
        y = yd;
      }
    }
    /*if (!gravOn) { // to mouse
      xd = mouseX;
      yd = mouseY;
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
      xs*=0.98;
      ys*=0.98;
      thetaInc*=0.98;
      // inc*=1.0001;
    }*/
  }
}

void mouseClicked() {
  gravOn = !gravOn;
  println(gravOn);
}
