int count = 8;

float[] x = new float[count];
float[] y = new float[count];

int r = 10;

boolean isPolygon = false;

boolean[] sideType = new boolean[count]; // convex = true...

void setup() {
  size(800, 800);

  randomizePoints();
  updateSideTypes();
}

void draw() {
  background(0);
  checkPossibleShape(); // if is not a shape, white bg
  // updateSideTypes();

  for (int i = 0; i < count; i++) {
    // sideType[i] = colorChangeByConcaveV2(i);
  }

  for (int i = 0; i < count; i++) {
    // colorChangeBySideTypeV2P2(i);
    
    strokeWeight(5);
    stroke(255);
    point(x[i], y[i]);

    // println("x[" + i + "] = " + x[i] + ";\r\ny[" + i + "] = " + y[i] + ";");

    // colorChangeByConcaveV2(i);
    colorChangeByConcave(i);
    strokeWeight(2);
    line(x[i], y[i], x[(i+1 < count ? i+1:0)], y[(i+1 < count ? i+1:0)]);
  }

  if (mousePressed) {
    movePoints();
  }
}

void randomizePoints() {
  for (int i = 0; i < count; i++) {
    x[i] = random(0, width);
    y[i] = random(0, height);
  }
}

void randomPoly() {
  randomizePoints();
  checkPossibleShape();
  while (!isPolygon) {
    randomizePoints();
    checkPossibleShape();
  }
}

void keyReleased() {
  if (key == 'r') {
    randomizePoints();
  }
  if (key == 'q') {
    randomPoly();
  }
}

void movePoints() {
  boolean captured = false;

  for (int i = 0; i < count; i++) {
    if (dist(x[i], y[i], pmouseX, pmouseY) < r && !captured) {
      x[i] = mouseX;
      y[i] = mouseY;
      captured = true; // prevents moving two at a time
    }
  }
}

void colorChangeByConcave(int i) {
  // b = y - mx
  // x[i], y[i], x[(i+1 < count ? i+1:0)], y[(i+1 < count ? i+1:0)]
  int countAbove = 0;
  int countBelow = 0;
  // int countOn = 0;

  float m = (y[(i+1 < count ? i+1:0)]-y[i])/(x[(i+1 < count ? i+1:0)]-x[i]);
  float b = y[i]-m*x[i];

  for (int j = 0; j < count; j++) {
    if (j != i && j!= (i+1 < count ? i+1:0)) { // don't self check
      if (y[j] > m*x[j]+b) {
        countAbove++;
      } else if (y[j] < m*x[j]+b) {
        countBelow++;
      } else {
        // countOn++; // technically an ignored case
      }
    }
  }

  if (countAbove == 0 || countBelow == 0) { // "convex side"
    stroke(255, 120, 200);
  } else {
    stroke(100, 230, 203);
  }
}

boolean colorChangeByConcaveV2(int i) {
  // b = y - mx
  // x[i], y[i], x[(i+1 < count ? i+1:0)], y[(i+1 < count ? i+1:0)]
  int countAbove = 0;
  int countBelow = 0;
  // int countOn = 0;

  float m = (y[(i+1 < count ? i+1:0)]-y[i])/(x[(i+1 < count ? i+1:0)]-x[i]);
  float b = y[i]-m*x[i];

  // for (int j = 0; j < count; j++) {
  int j = (i-1 > 0 ? i-1:count-1);
  if (j != i && j!= (i+1 < count ? i+1:0)) { // don't self check
    if (y[j] > m*x[j]+b) {
      countAbove++;
    } else if (y[j] < m*x[j]+b) {
      countBelow++;
    } else {
      // countOn++; // technically an ignored case
    }
  }

  j = (i+2 < count ? i+2:(i+2-count)); // line is between i and i+1
  if (j != i && j!= (i+1 < count ? i+1:0)) { // don't self check
    if (y[j] > m*x[j]+b) {
      countAbove++;
    } else if (y[j] < m*x[j]+b) {
      countBelow++;
    } else {
      // countOn++; // technically an ignored case
    }
  }


  if (countAbove == 0 || countBelow == 0) { // "convex side"
    stroke(255, 120, 200);
    return true; // outside
  } else {
    stroke(100, 230, 203);
    return false;
  }
}

void colorChangeBySideTypeV2P2(int i) {
  int ib = (i-1 >= 0 ? i-1:count-1); // i below
  int ia = (i+1 < count ? i+1:0); // i above
  
  if (!(sideType[ib] && sideType[ia]) && sideType[i]) { // if lengths on either side are concave, this is aswell* (*not sure...)
    sideType[i] = false;
    colorChangeBySideTypeV2P2(i); // if this changed, run again.
  }
  
  sideType[i] = true;
}

void checkPossibleShape() { // find intersection, check if within bounds
  for (int i = 0; i < count; i++) { // one line segment
    for (int j = 0; j < count; j++) {
      if (i!=j) {
        float x1l = (x[i] < x[(i+1 < count ? i+1:0)] ? x[i]:x[(i+1 < count ? i+1:0)]);
        float x1r = (x[i] < x[(i+1 < count ? i+1:0)] ? x[(i+1 < count ? i+1:0)]:x[i]);
        float y1t = (y[i] < y[(i+1 < count ? i+1:0)] ? y[i]:y[(i+1 < count ? i+1:0)]);
        float y1b = (y[i] < y[(i+1 < count ? i+1:0)] ? y[(i+1 < count ? i+1:0)]:y[i]);

        float x2l = (x[j] < x[(j+1 < count ? j+1:0)] ? x[j]:x[(j+1 < count ? j+1:0)]);
        float x2r = (x[j] < x[(j+1 < count ? j+1:0)] ? x[(j+1 < count ? j+1:0)]:x[j]);
        float y2t = (y[j] < y[(j+1 < count ? j+1:0)] ? y[j]:y[(j+1 < count ? j+1:0)]);
        float y2b = (y[j] < y[(j+1 < count ? j+1:0)] ? y[(j+1 < count ? j+1:0)]:y[j]);

        float m1 = (y[i]-y[(i+1 < count ? i+1:0)])/(x[i]-x[(i+1 < count ? i+1:0)]);
        float b1 = y[i]-m1*x[i];

        float m2 = (y[j]-y[(j+1 < count ? j+1:0)])/(x[j]-x[(j+1 < count ? j+1:0)]);
        float b2 = y[j]-m2*x[j];

        float xf = (b1-b2)/(m2-m1);
        float yf = m1*xf+b1; // use either version of m or b

        // check if (x, y) is in bounds
        if (xf > x1l+1 && xf < x1r-1 && xf > x2l+1 && xf < x2r-1 && yf > y1t+1 && yf < y1b-1 && yf > y2t+1 && yf < y2b-1) {
          // leniency added to resolve float error range
          background(255);
          isPolygon = false;

          strokeWeight(8);
          stroke(0);
          line(x[i], y[i], x[(i+1 < count ? i+1:0)], y[(i+1 < count ? i+1:0)]);
          line(x[j], y[j], x[(j+1 < count ? j+1:0)], y[(j+1 < count ? j+1:0)]);
          return;
        }
      }
    }
  }
  isPolygon = true;
}

void updateSideTypes() {
  for (int i = 0; i < count; i++) {
    sideType[i] = colorChangeByConcaveV2(i);
  }
  
  for (int i = 0; i < 2*count; i++) {
    colorChangeBySideTypeV2P2(i%count); // runs twice
  }
}
