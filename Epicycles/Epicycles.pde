// Epicycles
// reference: http://brettcvz.github.io/epicycles/

int count = 2;
float tInc = 0.05;
boolean fade = false;

int minRe = 10; // re = repeats of shape (r)
int maxRe = 1000;
float reMult = .2;
// float reReduction = .75;
int minSp = 20; // sp = speed
int maxSp = 80;
float spReduction = 25;

float[] w = new float[count]; // speed of rotation
float[] r = new float[count]; // radius of circle
float[] io = new float[count]; // inital offset (written as ϕi on the website), values up to 2*π
int xo = 400; // x-original (x pos of center of first circle)
int yo = 400; // y-original (y pos of center of first circle)
float xp = 0; // x-prevoius
float yp = 0; // y-previous
float t = 0; // essentially theta

void setup() {
  size(800, 800);
  
  w[0] = 1.0;
  r[0] = 200;
  io[0] = 0;
  w[1] = 2.0;
  r[1] = 100;
  io[1] = 0;
  /*
  w[2] = 2.0;
  r[2] = 50;
  io[2] = 0;
  w[3] = 2.0;
  r[3] = 25;
  io[3] = 0;
  */
  
  /*
  w[0] = 1.0;
  r[0] = 100;
  io[0] = 0;
  w[1] = 4.0;
  r[1] = 200;
  io[1] = 0;
  
  w[0] = 1.0;
  r[0] = 100;
  io[0] = 0;
  w[1] = -1.0;
  r[1] = 40;
  io[1] = 0;
  */

  /*
  w[0] = 1.0;
  r[0] = 10;
  io[0] = 0;
  w[1] = -1.0;
  r[1] = 20;
  io[1] = 0;
  w[2] = 1.0;
  r[2] = 10;
  io[2] = 0;
  w[3] = -1.0;
  r[3] = 20;
  io[3] = 0;
  w[4] = 1.0;
  r[4] = 200;
  io[4] = 0;
  w[5] = 2.0;
  r[5] = 100;
  io[5] = 0;
  */
  
  /*
  w[2] = -2.0;
   r[2] = 120;
   io[2] = 3.45036;
   w[3] = 4.0;
   r[3] = 40;
   io[3] = 0.97799;
   */
  
  /*
  for (int i = 0; i < count; i++) {
    w[i] = (i+1)/5.0;
    r[i] = (1.0/(3*(i+1)))*100;
    io[i] = 0;
  }
  */
  
  noFill();
  background(0);

  xp = getX(count);
  yp = getY(count);
}

void draw() {
  if (fade) {
    fill(0, 0, 0, 0);
    rect(-2, -2, width+4, height+4);
  } else {
    background(0);
  }

  strokeWeight(3);
  if (!fade) {
    for (int i = 0; i < count; i++) {
      stroke(255, 0, 0);
      ellipse(getX(i), getY(i), r[i]*2, r[i]*2);
      stroke(0, 0, 255);
      line(getX(i), getY(i), getX(i+1), getY(i+1));
    }
    stroke(0, 255, 0, 80);
    line(getX(count), 0, getX(count), height);
    line(0, getY(count), width, getY(count));
  }
  if (count == 2) {
    stroke(255, 0, 255);
    // ellipse(getX(0), getY(0), (r[0]-r[1])*2, (r[0]-r[1])*2);
  }
  strokeWeight(8);
  stroke(255);
  // point(getX(count), getY(count));
  strokeWeight(4);
  line(getX(count), getY(count), xp, yp);
  xp = getX(count);
  yp = getY(count);
  t+=tInc;
}

float getX(int i) {
  if (i == 0) {
    return xo;
  }
  float x = xo;
  for (int j = 0; j < i; j++) {
    x+=r[j]*cos(w[j]*t+io[j]);
  }
  return x;
}

float getY(int i) {
  if (i == 0) {
    return yo;
  }
  float y = yo;
  for (int j = 0; j < i; j++) {
    y+=r[j]*sin(w[j]*t+io[j]);
  }
  return y;
}

void mouseClicked() {
  fade = !fade;
  background(0);
}

void keyReleased() {
  if (key == ' ') {
    for (int i = 0; i < count; i++) {
      w[i] = (int) random(minSp, maxSp)/spReduction*((int) random(0, 2) == 1 ? 1:-1);
      r[i] = (int) random(minRe, maxRe)*reMult; // was '/reReduction' instead of '*reMult'
      io[i] = random(0, TWO_PI);
      
      background(0);
      xp = getX(count);
      yp = getY(count);
      t = 0;
    }
    for (int i = 0; i < count; i++) {
      // r[i] = (i+1)*20;
    }
    println("\r\n\r\n");
    for (int i = 0; i < count; i++) {
      print("w[" + i + "]: " + w[i] + ", r[" +i + "]: " + r[i] + ", io[" + i  + "]: " + io[i] + (i-1 == count ? "":", "));
    }
    println("c:" + count);
  }
  if (key == 'R') {
    for (int i = 0; i < count; i++) {
      w[i] = random(minSp, maxSp)/spReduction*((int) random(0, 2) == 1 ? 1:-1);
      r[i] = random(minRe, maxRe)*reMult; // was '/reReduction' instead of '*reMult'
      io[i] = random(0, TWO_PI);
      background(0);
      xp = getX(count);
      yp = getY(count);
      t = 0;
    }/*
    for (int i = 0; i < count; i++) {
      // r[i] = (i+1)*20;
    }
    */
    println("\r\n\r\n");
    for (int i = 0; i < count; i++) {
      print("w[" + i + "]: " + w[i] + ", r[" +i + "]: " + r[i] + ", io[" + i  + "]: " + io[i] + (i-1 == count ? "":", "));
    }
    println("c:" + count);
  }
  if (key == 'p') {
    noLoop();
  }
}
