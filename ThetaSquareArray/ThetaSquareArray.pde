int count = 2;
float[] x = new float[count];
float[] y = new float[count];
float xf = 0;
float yf = 0;
float xfp = 0;
float yfp = 0;
float[] theta = new float[count];
float[] thInc = new float[count];
float[] r = new float[count];

// r modifiers
int minRe = 2; // re = repeats of shape
int maxRe = 8;
float reMult = 12;
// thInc modifiers
int minSp = 1; // sp = speed
int maxSp = 12;
float spReduction = 80;

boolean drawConstruction = false;
boolean showAll = false;

void setup() {
  size(1080, 1080);
  frameRate(640);

  for (int i = 0; i < count; i++) {
    x[i] = 0;
    y[i] = 0;
  }

  // [0]: 0, 0.01, 100; [1]: PI, 0.02, 50 //
  // r[0]: 70.0, theta[0]:3.8657606, thInc[0]: 0.03, r[1]: 70.0, theta[1]:0.8064994, thInc[1]: 0.01
  // r[0]: 20.0, theta[0]:5.0534506, thInc[0]: 0.01, r[1]: 10.0, theta[1]:0.66126484, thInc[1]: 0.035
  // r[0]: 30.0, theta[0]:3.8316085, thInc[0]: 0.025 , r[1]: 50.0, theta[1]:3.4999645, thInc[1]: 0.025
  // r[0]: 175.0, theta[0]:3.0093505, thInc[0]: 0.027777778 , r[1]: 175.0, theta[1]:3.9221616, thInc[1]: 0.022222223
  // r[0]: 100.0, theta[0]:5.691793, thInc[0]: 0.05 , r[1]: 125.0, theta[1]:1.8346425, thInc[1]: 0.0055555557
  // r[0]: 150.0, theta[0]:2.2780912, thInc[0]: 0.033333335 , r[1]: 150.0, theta[1]:2.0319448, thInc[1]: 0.027777778
  // r[0]: 50.0, theta[0]: 4.910411, thInc[0]: 0.055555556 , r[1]: 125.0, theta[1]: 4.232793, thInc[1]: 0.06111111 , r[2]: 175.0, theta[2]: 0.73474014, thInc[2]: 0.0055555557
  // r[0]: 175.0, theta[0]: 3.5859349, thInc[0]: 0.055555556 , r[1]: 175.0, theta[1]: 2.9636672, thInc[1]: 0.05
  // ----
  // r[0] = 24.0, theta[0] = 0.8387677, thInc[0] = 0.011111111 , r[1] = 12.0, theta[1] = 3.0266173, thInc[1] = 0.011111111 , r[2] = 36.0, theta[2] = 0.34705156, thInc[2] = 0.011111111 , r[3] = 36.0, theta[3] = 5.06501, thInc[3] = 0.033333335
  // r[0] = 168.0, theta[0] = 2.3508656, thInc[0] = 0.0055555557 , r[1] = 120.0, theta[1] = 3.1287131, thInc[1] = 0.033333335
  // r[0] = 96.0, theta[0] = 5.2518935, thInc[0] = 0.025 , r[1] = 96.0, theta[1] = 2.0300295, thInc[1] = 0.025
  

  // r[0] = 150; theta[0] = 2.2780912; thInc[0] = 0.033333335; r[1] = 150; theta[1] = 2.0319448; thInc[1] = 0.027777778;

  /*
  theta[0] = 0;
   thInc[0] = 0.03;
   r[0] = 100;
   
   theta[1] = PI;
   thInc[1] = 0.007;
   r[1] = 60;
   */
   
   r[0] = 150;
   theta[0] = 0;
   thInc[0] = PI/100;
   r[1] = PI*50;
   theta[1] = 0;
   thInc[1] = 2*0.031;
   
   for (int i = 0; i < count; i++) {
     theta[i] = 0;
     r[i] = 200/(i+1);
     thInc[i] = (i*i+1)/500.0;
   }

  stroke(255);
  strokeWeight(3);
  noFill();

  draw(); // to avoid a line from xfp, yfp (0, 0) to xf, yf (xf, yf)
  background(0);
  loadPixels();
}

void draw() {
  if (drawConstruction) {
    background(0);
  }

  for (int i = 0; i < count; i++) {
    calculatePos(i);

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

void keyReleased() {
  if (key == ' ') {
    print("\r\n\r\n  // ");
    for (int i = 0; i < count; i++) {
      r[i] = (int) random(minRe, maxRe)*reMult; // was '/reReduction' instead of '*reMult'
      theta[i] = random(0, TWO_PI);
      thInc[i] = (int) random(minSp, maxSp)/spReduction;
      print((i != 0 ? ", ":"") + "r[" + i + "] = " + r[i] + ", theta[" + i + "] = " + theta[i] + ", thInc[" + i + "] = " + thInc[i] + " ");
      draw();
      background(0);
      loadPixels();
    }
  }
  if (key == 'l') {
    print("\r\n\r\n  // ");
    for (int i = 0; i < count; i++) {
      r[i] = random(minRe, maxRe)*reMult; // was '/reReduction' instead of '*reMult'
      theta[i] = random(0, TWO_PI);
      thInc[i] = random(minSp, maxSp)/spReduction;
      print((i != 0 ? ", ":"") + "r[" + i + "] = " + r[i] + ", theta[" + i + "] = " + theta[i] + ", thInc[" + i + "] = " + thInc[i] + " ");
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

void calculatePos(int i) {
  if (theta[i] > (PI/4) && theta[i] < (3*PI/4)) { // on top
    float theta2 = theta[i]-PI/4;
    x[i] = r[i]-((r[i]*sqrt(2)*sin(theta2))/sin((3*PI/4)-theta2))+(i>0 ? x[i-1]:width/2);
    y[i] = r[i]+(i>0 ? y[i-1]:height/2);
  } else if (theta[i] >= (3*PI/4) && theta[i] < (5*PI/4)) {
    float theta2 = theta[i]-(3*PI/4);
    x[i] = -r[i]+(i>0 ? x[i-1]:width/2);
    y[i] = r[i]-((r[i]*sqrt(2)*sin(theta2))/sin((3*PI/4)-theta2))+(i>0 ? y[i-1]:height/2);
  } else if (theta[i] >= (5*PI/4) && theta[i] < (7*PI/4)) {
    float theta2 = theta[i]-(5*PI/4);
    x[i] = -r[i]+((r[i]*sqrt(2)*sin(theta2))/sin((3*PI/4)-theta2))+(i>0 ? x[i-1]:width/2);
    y[i] = -r[i]+(i>0 ? y[i-1]:height/2);
  } else if ((theta[i] >= (5*PI/4) && theta[i] < TWO_PI) || (theta[i] >= 0 && theta[i] <= (PI/4))) {
    float theta2 = theta[i]-(7*PI/4);
    x[i] = r[i]+(i>0 ? x[i-1]:width/2);
    y[i] = -r[i]+((r[i]*sqrt(2)*sin(theta2))/sin((3*PI/4)-theta2))+(i>0 ? y[i-1]:height/2);
  }
}
