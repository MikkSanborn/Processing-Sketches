int count = 2;
float[] r = new float[count];
float[] theta = new float[count];
float[] thInc = new float[count];
float[] x = new float[count];
float[] y = new float[count];
int[] type = new int[count]; // 0 = circle, 1 = square

float xf = 0;
float yf = 0;
float xfp = 0;
float yfp = 0;

// r modifiers
int minRe = 2; // re = repeats of shape
int maxRe = 8;
float reMult = 12;
// thInc modifiers
int minSp = 1; // sp = speed
int maxSp = 12;
float spReduction = 240;

boolean showAll = false;
boolean drawConstruction = false;

float xo;
float yo;

void setup() {
  size(500, 500);

  xo = width/2;
  yo = height/2;

  for (int i = 0; i < count; i++) {
    r[i] = 100;
    theta[i] = random(0, TWO_PI);
    thInc[i] = random(0.001, 0.01);
    type[i] = (int) (random(0, 1)+0.5);
  }

  noFill();

  draw();
  background(0);
  updatePixels();
}

void draw() {
  if (drawConstruction) {
    background(0);
  }

  for (int i = 0; i < count; i++) {
    if (type[i] == 0) {
      calculatePosCircle(i);
    } else if (type[i] == 1) {
      calculatePosSq(i);
    }

    theta[i]+=thInc[i];
    if (theta[i] > TWO_PI) {
      theta[i]-=TWO_PI;
    }
  }

  xfp = xf;
  yfp = yf;

  xf = x[count-1];
  yf = y[count-1];

  if (showAll) {
    updatePixels();
  }

  if (!drawConstruction || showAll) {
    stroke(255, 100, 147.36521);
    stroke(255);
    strokeWeight(3);
    point(xf, yf);
    line(xf, yf, xfp, yfp);

    if (showAll) {
      loadPixels();
    }
  }
  if (drawConstruction || showAll) {
    for (int i = 0; i < count; i++) {
      if (type[i] == 0) {
        drawCircle(i);
      } else if (type[i] == 1) {
        drawSquare(i);
      }
    }
  }
}


void calculatePosSq(int i) {
  if (theta[i] > (PI/4) && theta[i] < (3*PI/4)) { // on top
    float theta2 = theta[i]-PI/4;
    x[i] = r[i]-((r[i]*sqrt(2)*sin(theta2))/sin((3*PI/4)-theta2))+(i>0 ? x[i-1]:xo);
    y[i] = r[i]+(i>0 ? y[i-1]:yo);
  } else if (theta[i] >= (3*PI/4) && theta[i] < (5*PI/4)) {
    float theta2 = theta[i]-(3*PI/4);
    x[i] = -r[i]+(i>0 ? x[i-1]:xo);
    y[i] = r[i]-((r[i]*sqrt(2)*sin(theta2))/sin((3*PI/4)-theta2))+(i>0 ? y[i-1]:yo);
  } else if (theta[i] >= (5*PI/4) && theta[i] < (7*PI/4)) {
    float theta2 = theta[i]-(5*PI/4);
    x[i] = -r[i]+((r[i]*sqrt(2)*sin(theta2))/sin((3*PI/4)-theta2))+(i>0 ? x[i-1]:xo);
    y[i] = -r[i]+(i>0 ? y[i-1]:yo);
  } else if ((theta[i] >= (5*PI/4) && theta[i] < TWO_PI) || (theta[i] >= 0 && theta[i] <= (PI/4))) {
    float theta2 = theta[i]-(7*PI/4);
    x[i] = r[i]+(i>0 ? x[i-1]:xo);
    y[i] = -r[i]+((r[i]*sqrt(2)*sin(theta2))/sin((3*PI/4)-theta2))+(i>0 ? y[i-1]:yo);
  }
}

void calculatePosCircle(int i) {
  for (int j = 0; j < i; j++) {
    x[j] = getXC(j);
    y[j] = getYC(j);
  }
}

float getXC(int i) {
  if (i == 0) {
    return xo;
  }
  println(i + "   " + count);
  float xr = x[i-1];
  // for (int j = 0; j < i-1; j++) {
    // x+=r[j]*cos(theta[j]);
    // xr+=x[j];
  // }
  xr+=r[i]*cos(theta[i]);
  return xr;
}

float getYC(int i) {
  if (i == 0) {
    return yo;
  }
  float yr = y[i-1];
  /*for (int j = 0; j < i-1; j++) {
    // x+=r[j]*cos(theta[j]);
    yr+=y[j];
  }*/
  yr+=r[i]*sin(theta[i]);
  return yr;
}

void keyReleased() {
  if (key == ' ') {
    print("\r\n\r\n  // ");
    for (int i = 0; i < count; i++) {
      r[i] = (int) random(minRe, maxRe)*reMult; // was '/reReduction' instead of '*reMult'
      theta[i] = random(0, TWO_PI);
      thInc[i] = (int) random(minSp, maxSp)/spReduction;
      type[i] = (int) (random(0, 1)+0.5);
      print((i != 0 ? ", ":"") + "r[" + i + "] = " + r[i] + ", theta[" + i + "] = " + theta[i] + ", thInc[" + i + "] = " + thInc[i] + ", type[" + i + "] = " + type[i] + " ");
      draw();
      background(0);
      loadPixels();
    }
  }
  if (key == 'S') {
    showAll = !showAll;
  }
  if (key == 'p') {
    noLoop();
  }
}

void drawCircle(int i) {
  strokeWeight(3);
  stroke(180, 100, 255);
  ellipse(getXC(i), getYC(i), r[i]*2, r[i]*2);
  stroke(0, 0, 255);
  line(getXC(i), getYC(i), getXC(i+1), getYC(i+1));
  stroke(0, 255, 0, 80);
}

void drawSquare(int i) {
  if (i > 0) {
    stroke(255, 100, 180, 180);
    strokeWeight(3);
    rect(-r[i]+x[i-1], -r[i]+y[i-1], r[i]*2, r[i]*2);

    strokeWeight(1);
    line(x[i], y[i], x[i-1], y[i-1]);

    stroke(0, 180, 255);
    strokeWeight(12);
    point(x[i], y[i]);
  } else {
    stroke(255, 100, 180);
    strokeWeight(3);
    rect(width/2-r[i], height/2-r[i], r[i]*2, r[i]*2);

    strokeWeight(1);
    line(x[i], y[i], width/2, height/2);

    stroke(0, 180, 255);
    strokeWeight(12);
    point(x[i], y[i]);
  }
}

void mouseClicked() {
  if (showAll) {
    updatePixels();
    drawConstruction = false;
    showAll = false;
  } else {
    background(0);
    drawConstruction = !drawConstruction;
  }
}
