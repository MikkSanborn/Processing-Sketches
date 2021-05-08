// dual epicycles, one for x, one for y
// final int dimensions = 2;

// DIMENSION RELATIONS: 0 = X, 1 = Y

int count = 6;

int minSp = 1;
int maxSp = 8;
float spReduction = 200;

int minRe = 2;
int maxRe = 8;
float reMult = 8;

/*
float[][] x = new float[count][2];
 float[][] y = new float[count][2];
 */
// use methods to return positions (possibly recursion, getX(float x, int i);

float[][] theta = new float[count][2];
float[][] r = new float[count][2];
float[][] thetaInc = new float[count][2];
// float[][] thOff = new float[count][2]; // can be set as default in theta[][]

float[] cx = new float[2];
float[] cy = new float[2];

float px;
float py;

int drawMode = 0; // 0 = both circles, (respective) lines, and draw trail, 1 = both (to be implemented), 2 = trail only

void setup() {
  size(800, 800);

  cx[0] = width/2; // cx of x-component
  cy[0] = 0; // doesn't matter

  cx[1] = 0; // doesn't matter
  cy[1] = height/2; // cy of y-component

  /*
  key = 'r';
   keyReleased();
   */

  // x
  r[0][0] = 100;
  r[1][0] = 80;
  r[2][0] = 40;
  r[3][0] = 20;
  r[4][0] = 20;
  r[5][0] = 30;
  theta[0][0] = 0;
  theta[1][0] = 0;
  theta[2][0] = 0;
  theta[3][0] = 0;
  theta[4][0] = 0;
  theta[5][0] = PI;
  thetaInc[0][0] = 0.02;
  thetaInc[1][0] = 0.04;
  thetaInc[2][0] = -0.02;
  thetaInc[3][0] = 0.04;
  thetaInc[4][0] = -0.04;
  thetaInc[5][0] = 0.00;

  // y
  r[0][1] = 100;
  r[1][1] = 30;
  r[2][1] = 15;
  r[3][1] = 15;
  r[4][1] = 15;
  theta[0][1] = 0;
  theta[1][1] = 0;
  theta[2][1] = PI;
  theta[3][1] = 0;
  theta[4][1] = PI;
  thetaInc[0][1] = 0.02;
  thetaInc[1][1] = 0.04;
  thetaInc[2][1] = 0.06;
  thetaInc[3][1] = 0.00;
  thetaInc[4][1] = -0.00;

  px = getX(cx[0], count-1, 0);
  py = getY(cy[1], count-1, 1);

  background(0);

  noFill();
  strokeWeight(3);
  stroke(255);
  loadPixels();
}

void draw() {
  if (drawMode != 2) {
    background(0);
  } // not else
  if (drawMode == 1) {
    updatePixels();
  }

  stroke(255);
  strokeWeight(3);
  point(getX(cx[0], count-1, 0), getY(cy[1], count-1, 1));
  line(getX(cx[0], count-1, 0), getY(cy[1], count-1, 1), px, py);

  if (drawMode == 1) {
    loadPixels();
  }

  /*
  line(width/2, 0, width/2, height);
   line(0, height/2, width, height/2);
   */

  px = getX(cx[0], count-1, 0);
  py = getY(cy[1], count-1, 1);

  if (drawMode != 2) {
    for (int i = 0; i < count; i++) {
      for (int j = 0; j < 2; j++) {
        strokeWeight(1);
        stroke((j == 0 ? 255:0), 255, (j == 0 ? 0:255)); // yellow is "x"
        ellipse(getX(cx[j], i-1, j), getY(cy[j], i-1, j), 2*r[i][j], 2*r[i][j]);
        strokeWeight(3);
        line(getX(cx[j], i-1, j), getY(cy[j], i-1, j), getX(cx[j], i, j), getY(cy[j], i, j));
        point(getX(cx[j], count-1, j), getY(cy[j], count-1, j));
      }
    }

    stroke(255, 0, 0);
    strokeWeight(1);
    line(getX(cx[0], count-1, 0), 0, getX(cx[0], count-1, 0), height);
    line(0, getY(cy[1], count-1, 1), width, getY(cy[1], count-1, 1));
  }

  for (int i = 0; i < count; i++) {
    for (int j = 0; j < 2; j++) {
      theta[i][j]+=thetaInc[i][j];
    }
  }
}

void keyReleased() {
  int pCount = count;
  if (key == '1' || key == '2' || key == '3' || key == '4' || key == '5' || key == '6' || key == '7' || key == '8' || key == '9') {
    count = Integer.parseInt("" + key);
  }

  if (pCount != count) {
    println("redoing");
    theta = new float[count][2];
    r = new float[count][2];
    thetaInc = new float[count][2];

    key = 'r'; // reload
  }

  if (key == 's') {
    save("Drawing" + ((int) random(0, 1000)) + ".jpg");
  }
  if (key == 'r') {
    for (int i = 0; i < count; i++) {
      for (int j = 0; j < 2; j++) {
        thetaInc[i][j] = (int) (random(minSp, maxSp))/spReduction*((int) random(0, 2) == 1 ? 1:-1);
        r[i][j] = (int) (random(minRe, maxRe)*reMult); // was '/reReduction' instead of '*reMult'
        theta[i][j] = random(0, TWO_PI);
        background(0);
        loadPixels();
      }
    }
    print("\r\n\r\n// ");

    for (int j = 0; j < 2; j++) {
      print("cx[" + j + "] = " + cx[j] + "; cy[" + j + "] = " + cy[j] + "; ");
    }

    for (int i = 0; i < count; i++) {
      for (int j = 0; j < 2; j++) {
        print("theta[" + i + "][" + j + "] = " + theta[i][j] + "; r[" + i + "][" + j + "] = " + r[i][j] + "; thetaInc[" + i + "][" + j + "] = " + thetaInc[i][j] + ";");
      }
    }
    println();

    // to avoid artifacts
    px = getX(cx[0], count-1, 0);
    py = getY(cy[1], count-1, 1);
  }
  if (key == ' ') {
    background(0);
    loadPixels();
  }
}

void mouseClicked() {
  drawMode++;
  if (drawMode > 2) { // allows 0, 1, and 2
    drawMode = 0;
  } else if (drawMode == 2) {
    background(0);
    updatePixels();
  } else if (drawMode == 1) {
    background(0);
  }
}

void drawFromPixels() {
  strokeWeight(1);
  for (int i = 0; i < width*height; i++) {
    stroke(pixels[i]);
    point(i%width, i/width);
  }
}

float getX(float x, int i, int j) {
  if (i == -1) {
    return x;
  } else {
    return getX(x, i, j, true);
  }
}

float getX(float x, int i, int j, boolean b) {
  float xf = x;

  xf += r[i][j]*cos(theta[i][j]); // trig to add pos by r*<trig>(theta[i][j])

  if (i != 0) {
    xf = getX(xf, i-1, j);
  }

  return xf;
}

float getY(float y, int i, int j) {
  if (i == -1) {
    return y;
  } else {
    return getY(y, i, j, true);
  }
}

float getY(float y, int i, int j, boolean b) {
  float yf = y;

  yf += r[i][j]*sin(theta[i][j]); // trig to add pos by r*<trig>(theta[i][j])

  if (i != 0) {
    yf = getY(yf, i-1, j);
  }

  return yf;
}

/*
// x
 r[0][0] = 100;
 r[1][0] = 80;
 r[2][0] = 0;
 theta[0][0] = 0;
 theta[1][0] = 0;
 theta[2][0] = 0;
 thetaInc[0][0] = 0.02;
 thetaInc[1][0] = 0.04;
 thetaInc[2][0] = 0.08;
 
 // y
 r[0][1] = 100;
 r[1][1] = 50;
 r[2][1] = 20;
 theta[0][1] = 0;
 theta[1][1] = 0;
 theta[2][1] = 0;
 thetaInc[0][1] = 0.02;
 thetaInc[1][1] = 0.04;
 thetaInc[2][1] = -0.08;
 
 
 ///////////////
 
 
 // x
 r[0][0] = 100;
 r[1][0] = 80;
 r[2][0] = 50;
 theta[0][0] = 0;
 theta[1][0] = 0;
 theta[2][0] = 0;
 thetaInc[0][0] = 0.02;
 thetaInc[1][0] = 0.04;
 thetaInc[2][0] = -0.02;
 
 // y
 r[0][1] = 100;
 r[1][1] = 30;
 r[2][1] = 30;
 theta[0][1] = 0;
 theta[1][1] = 0;
 theta[2][1] = PI;
 thetaInc[0][1] = 0.02;
 thetaInc[1][1] = 0.04;
 thetaInc[2][1] = 0.065;
 
 /////////// first heart
 
 // x
 r[0][0] = 100;
 r[1][0] = 80;
 r[2][0] = 40;
 theta[0][0] = 0;
 theta[1][0] = 0;
 theta[2][0] = 0;
 thetaInc[0][0] = 0.02;
 thetaInc[1][0] = 0.04;
 thetaInc[2][0] = -0.02;
 
 // y
 r[0][1] = 100;
 r[1][1] = 30;
 r[2][1] = 15;
 theta[0][1] = 0;
 theta[1][1] = 0;
 theta[2][1] = PI;
 thetaInc[0][1] = 0.02;
 thetaInc[1][1] = 0.04;
 thetaInc[2][1] = 0.06;
 
 ////////////// "good enough" heart
 
 // x
 r[0][0] = 100;
 r[1][0] = 80;
 r[2][0] = 40;
 r[3][0] = 20;
 r[4][0] = 20;
 theta[0][0] = 0;
 theta[1][0] = 0;
 theta[2][0] = 0;
 theta[3][0] = 0;
 theta[4][0] = 0;
 thetaInc[0][0] = 0.02;
 thetaInc[1][0] = 0.04;
 thetaInc[2][0] = -0.02;
 thetaInc[3][0] = 0.04;
 thetaInc[4][0] = -0.04;
 
 // y
 r[0][1] = 100;
 r[1][1] = 30;
 r[2][1] = 15;
 theta[0][1] = 0;
 theta[1][1] = 0;
 theta[2][1] = PI;
 thetaInc[0][1] = 0.02;
 thetaInc[1][1] = 0.04;
 thetaInc[2][1] = 0.06;
 
 ////////////////////
 */
