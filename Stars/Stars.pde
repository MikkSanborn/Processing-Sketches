// Epicycles
// reference: http://brettcvz.github.io/epicycles/

int amount = 10; // amount of stars created
int count = 2; // count of circles... don't change
float tInc = 0.05;
float thetaInc = 0.1;
float minR = 0.1;
float maxR = 1.0;
float rm = 0.025; // r-modification amount

float[] x = new float[amount];
float[] y = new float[amount];
float[] w = new float[count]; // speed of rotation
float[] r = new float[count]; // radius of circle
float[] radii = new float[amount];
boolean[] radM = new boolean[amount];
float[] io = new float[count]; // inital offset (written as ϕi on the website), values up to 2*π
float xo = 0; // x-original (x pos of center of first circle)
float yo = 0; // y-original (y pos of center of first circle)
float theta = 0;
float[] xp = new float[amount]; // x-prevoius
float[] yp = new float[amount]; // y-previous
float t = 0; // essentially theta

void setup() {
  size(1960, 1080);

  w[0] = -1.6;
  r[0] = 175.2;
  io[0] = 4.577;
  w[1] = 2.4;
  r[1] = 89.4;
  io[1] = 0.508;

  for (int i = 0; i < amount; i++) {
    x[i] = random(0, width);
    y[i] = random(0, height);
    xp[i] = getX(count);
    yp[i] = getY(count);
    radii[i] = random(minR, maxR);
  }

  noFill();
  background(0);
}

void draw() {
  /*
  fill(0, 0, 0, 0);
   rect(-2, -2, width+4, height+4);
   */
  background(0);

  strokeWeight(4);
  stroke(255);
  while (t < 8.2) {
    for (int i = 0; i < amount; i++) {
      pushMatrix();
      translate(x[i], y[i]);
      scale(radii[i]);
      rotate(theta);
      xo = 0;
      yo = 0;
      line(getX(count), getY(count), xp[i], yp[i]);
      xp[i] = getX(count);
      yp[i]  = getY(count);

      popMatrix();
    }
    t+=tInc;
  }
  for (int i = 0; i < amount; i++) {
    if (radM[i]) {
      radii[i]+=rm;
      if (radii[i] > maxR) {
        radM[i] = false;
      }
    } else {
      radii[i]-=rm;
      if (radii[i] < minR) {
        radM[i] = true;
      }
    }
  }
  t = 0;
  theta+=thetaInc;
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
  background(0);

  w[0] = random(1, 3);
  r[0] = random(50, 200);
  io[0] = random(0, 6);
  w[1] = random(1, 3);
  r[1] = random(50, 200);
  io[1] = random(0, 6);
  
  for (int i = 0; i < amount; i++) {
    x[i] = random(0, width);
    y[i] = random(0, height);
  }
}

/*
void keyReleased() {
 if (key == ' ') {
 for (int i = 0; i < count; i++) {
 w[i] = (int) random(minSp, maxSp)/spReduction*((int) random(0, 2) == 1 ? 1:-1);
 r[i] = (int) random(minRe, maxRe)*reMult; // was '/reReduction' instead of '*reMult'
 io[i] = random(0, TWO_PI);
 // "/" "*"
 for (int j = 0; j < i; j++) {
 while (w[i] == w[j]) {
 w[i] = (int) random(minSp, maxSp)/spReduction*((int) random(0, 2) == 1 ? 1:-1);
 }
 while (r[i] == r[j]) {
 r[i] = (int) random(minRe, maxRe)*reMult; // was '/reReduction' instead of '*reMult'
 }
 while (io[i] == io[j]) {
 io[i] = random(0, TWO_PI);
 }
 }
 // "*" "/"
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
 if (key == 'p') {
 noLoop();
 }
 }
 */
