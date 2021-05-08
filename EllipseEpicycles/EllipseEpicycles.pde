int count = 2;

int minRe = 100; // re = repeats of shape (r)
int maxRe = 1000;
float reMult = 0.2;
// float reReduction = .75;
int minSp = 20; // sp = speed
int maxSp = 40;
float spReduction = 750;

float[] x = new float[count];
float[] y = new float[count];
float[] w = new float[count];
float[] h = new float[count];

float[] theta = new float[count];
float[] thetaInc = new float[count];

float px = 0;
float py = 0;

int drawType = 0;

void setup() {
  size(500, 500);

  x[0] = 250;
  y[0] = 250;
  w[0] = 200;
  h[0] = 100;

  x[1] = 0;
  y[1] = 0;
  w[1] = 100;
  h[1] = 150;

  for (int i = 0; i < count; i++) {
    theta[i] = random(0, TWO_PI);
    thetaInc[i] = random(-.1, .1);
  }

  // COUNT == 2
  // x[0] = 250.0; y[0] = 250.0; w[0] = 100.0; h[0] = 50.0; theta[0] = 2.225546; thetaInc[0] = 0.1; w[1] = 50.0; h[1] = 50.0; theta[1] = 2.5942004; thetaInc[1] = -0.15; 
  // x[0] = 250.0; y[0] = 250.0; w[0] = 100.0; h[0] = 100.0; theta[0] = 4.9765964; thetaInc[0] = 0.15; w[1] = 100.0; h[1] = 100.0; theta[1] = 2.9816868; thetaInc[1] = -0.2;
  // x[0] = 250.0; y[0] = 250.0; w[0] = 100.0; h[0] = 50.0; theta[0] = 1.7412312; thetaInc[0] = -0.15; w[1] = 100.0; h[1] = 100.0; theta[1] = 3.3175466; thetaInc[1] = 0.2; 
  // x[0] = 250.0; y[0] = 250.0; w[0] = 150.0; h[0] = 100.0; theta[0] = 0.8523004; thetaInc[0] = 0.05; w[1] = 100.0; h[1] = 50.0; theta[1] = 3.8081374; thetaInc[1] = -0.15; 
  // x[0] = 250.0; y[0] = 250.0; w[0] = 60.0; h[0] = 60.0; theta[0] = 2.789628; thetaInc[0] = 0.12; w[1] = 80.0; h[1] = 60.0; theta[1] = 1.4218308; thetaInc[1] = 0.08; 
  // x[0] = 250.0; y[0] = 250.0; w[0] = 80.0; h[0] = 50.0; theta[0] = 1.0273358; thetaInc[0] = 0.06; w[1] = 90.0; h[1] = 60.0; theta[1] = 4.93842; thetaInc[1] = 0.14; 
  // x[0] = 250.0; y[0] = 250.0; w[0] = 136.0; h[0] = 120.0; theta[0] = 6.016869; thetaInc[0] = 0.13; w[1] = 120.0; h[1] = 80.0; theta[1] = 0.5124892; thetaInc[1] = 0.07;
  // x[0] = 250.0; y[0] = 250.0; w[0] = 112.0; h[0] = 128.0; theta[0] = 4.8711925; thetaInc[0] = 0.15; w[1] = 152.0; h[1] = 136.0; theta[1] = 1.4785081; thetaInc[1] = 0.13;
  // x[0] = 250.0; y[0] = 250.0; w[0] = 120.0; h[0] = 96.0; theta[0] = 4.9756417; thetaInc[0] = 0.14; w[1] = 136.0; h[1] = 152.0; theta[1] = 4.882137; thetaInc[1] = 0.06; 
  // x[0] = 250.0; y[0] = 250.0; w[0] = 120.0; h[0] = 104.0; theta[0] = 1.6272656; thetaInc[0] = 0.15; w[1] = 144.0; h[1] = 152.0; theta[1] = 0.1988689; thetaInc[1] = 0.04; // flower doughnut
  x[0] = 250.0; 
  y[0] = 250.0; 
  w[0] = 144.0; 
  h[0] = 104.0; 
  theta[0] = 6.2673345; 
  thetaInc[0] = 0.07; 
  w[1] = 152.0; 
  h[1] = 104.0; 
  theta[1] = 3.1450737; 
  thetaInc[1] = 0.15; // 3d rendering of doughnut

  // x[0] = 250.0; y[0] = 250.0; w[0] = 151.6; h[0] = 63.8; theta[0] = 5.504308; thetaInc[0] = 0.042666666; w[1] = 192.6; h[1] = 199.0; theta[1] = 3.4312696; thetaInc[1] = 0.029333333; 
  // x[0] = 250.0; y[0] = 250.0; w[0] = 138.40001; h[0] = 182.6; theta[0] = 2.648314; thetaInc[0] = 4*0.05; w[1] = 156.6; h[1] = 83.6; theta[1] = 1.8886522; thetaInc[1] = 4*0.045333333;

  // x[0] = 250.0; y[0] = 250.0; w[0] = 120.0; h[0] = 136.0; theta[0] = 3.1397629; thetaInc[0] = 0.08; w[1] = 152.0; h[1] = 80.0; theta[1] = 6.4663596; thetaInc[1] = 0.15;
  // x[0] = 250.0; y[0] = 250.0; w[0] = 40.0; h[0] = 140.0; theta[0] = 1.0165101; thetaInc[0] = 0.053333335; w[1] = 100.0; h[1] = 120.0; theta[1] = 0.74025124; thetaInc[1] = 0.2;
  // x[0] = 250.0; y[0] = 250.0; w[0] = 100.0; h[0] = 120.0; theta[0] = 6.1243567; thetaInc[0] = 0.06666667; w[1] = 60.0; h[1] = 40.0; theta[1] = 5.3194523; thetaInc[1] = 0.17333333;
  // x[0] = 250.0; y[0] = 250.0; w[0] = 120.0; h[0] = 40.0; theta[0] = 1.7901196; thetaInc[0] = 0.2; w[1] = 60.0; h[1] = 120.0; theta[1] = 4.2257695; thetaInc[1] = 0.12; 
  // x[0] = 250.0; y[0] = 250.0; w[0] = 80.0; h[0] = 40.0; theta[0] = 5.2339797; thetaInc[0] = 0.17333333; w[1] = 120.0; h[1] = 100.0; theta[1] = 0.62713337; thetaInc[1] = 0.053333335; // broken doughnut  
  // x[0] = 250.0; y[0] = 250.0; w[0] = 80.0; h[0] = 140.0; theta[0] = 2.5473578; thetaInc[0] = 0.17333333; w[1] = 120.0; h[1] = 40.0; theta[1] = 3.3894277; thetaInc[1] = 0.2; // forceshield?
  // x[0] = 250.0; y[0] = 250.0; w[0] = 140.0; h[0] = 120.0; theta[0] = 6.2845974; thetaInc[0] = 0.08; w[1] = 120.0; h[1] = 60.0; theta[1] = 5.993696; thetaInc[1] = 0.16; 
  // x[0] = 250.0; y[0] = 250.0; w[0] = 131.40001; h[0] = 183.8; theta[0] = 2.9391396; thetaInc[0] = 0.045333333; w[1] = 116.4; h[1] = 58.0; theta[1] = 4.1275187; thetaInc[1] = 0.038666666; 



  // COUNT == 3
  // x[0] = 250.0; y[0] = 250.0; w[0] = 150.0; h[0] = 100.0; theta[0] = 1.7536135; thetaInc[0] = 0.15; w[1] = 50.0; h[1] = 50.0; theta[1] = 0.5072854; thetaInc[1] = 0.05; w[2] = 150.0; h[2] = 150.0; theta[2] = 4.160631; thetaInc[2] = -0.05;
  // x[0] = 250.0; y[0] = 250.0; w[0] = 150.0; h[0] = 100.0; theta[0] = 4.6603174; thetaInc[0] = -0.1; w[1] = 150.0; h[1] = 50.0; theta[1] = 2.4213066; thetaInc[1] = 0.15; w[2] = 150.0; h[2] = 50.0; theta[2] = 3.853771; thetaInc[2] = 0.0; 
  // x[0] = 250.0; y[0] = 250.0; w[0] = 50.0; h[0] = 150.0; theta[0] = 1.4136722; thetaInc[0] = -0.05; w[1] = 150.0; h[1] = 150.0; theta[1] = 2.328043; thetaInc[1] = -0.05; w[2] = 150.0; h[2] = 100.0; theta[2] = 4.124838; thetaInc[2] = 0.2;
  // x[0] = 250.0; y[0] = 250.0; w[0] = 150.0; h[0] = 100.0; theta[0] = 3.4191568; thetaInc[0] = 0.2; w[1] = 150.0; h[1] = 100.0; theta[1] = 6.0068016; thetaInc[1] = 0.05; w[2] = 150.0; h[2] = 150.0; theta[2] = 4.8657584; thetaInc[2] = -0.2; 
  // x[0] = 250.0; y[0] = 250.0; w[0] = 100.0; h[0] = 100.0; theta[0] = 2.4294808; thetaInc[0] = -0.2; w[1] = 150.0; h[1] = 150.0; theta[1] = 4.4084673; thetaInc[1] = -0.15; w[2] = 100.0; h[2] = 50.0; theta[2] = 2.3239594; thetaInc[2] = -0.15; 
  // x[0] = 250.0; y[0] = 250.0; w[0] = 50.0; h[0] = 100.0; theta[0] = 3.705711; thetaInc[0] = -0.1; w[1] = 150.0; h[1] = 100.0; theta[1] = 2.7621005; thetaInc[1] = -0.05; w[2] = 100.0; h[2] = 100.0; theta[2] = 0.46546197; thetaInc[2] = 0.2; 
  // x[0] = 250.0; y[0] = 250.0; w[0] = 144.0; h[0] = 152.0; theta[0] = 0.52184975; thetaInc[0] = 0.15; w[1] = 152.0; h[1] = 96.0; theta[1] = 0.61221755; thetaInc[1] = 0.15; w[2] = 128.0; h[2] = 112.0; theta[2] = 2.3364575; thetaInc[2] = 0.11; 


  // COUNT == 4
  // x[0] = 250.0; y[0] = 250.0; w[0] = 100.0; h[0] = 100.0; theta[0] = 6.173201; thetaInc[0] = 0.05; w[1] = 150.0; h[1] = 150.0; theta[1] = 0.8211665; thetaInc[1] = 0.2; w[2] = 100.0; h[2] = 150.0; theta[2] = 0.29389262; thetaInc[2] = -0.05; w[3] = 100.0; h[3] = 50.0; theta[3] = 4.5586348; thetaInc[3] = 0.2; 
  // x[0] = 250.0; y[0] = 250.0; w[0] = 50.0; h[0] = 50.0; theta[0] = 2.535477; thetaInc[0] = -0.15; w[1] = 50.0; h[1] = 50.0; theta[1] = 0.38435766; thetaInc[1] = -0.15; w[2] = 50.0; h[2] = 50.0; theta[2] = 5.6924386; thetaInc[2] = 0.05; w[3] = 100.0; h[3] = 100.0; theta[3] = 5.6052146; thetaInc[3] = -0.05; 
  // x[0] = 250.0; y[0] = 250.0; w[0] = 100.0; h[0] = 150.0; theta[0] = 0.8296501; thetaInc[0] = 0.1; w[1] = 100.0; h[1] = 100.0; theta[1] = 4.190756; thetaInc[1] = -0.05; w[2] = 50.0; h[2] = 100.0; theta[2] = 0.62010217; thetaInc[2] = 0.1; w[3] = 100.0; h[3] = 100.0; theta[3] = 3.714026; thetaInc[3] = -0.2; 
  // x[0] = 250.0; y[0] = 250.0; w[0] = 100.0; h[0] = 100.0; theta[0] = 1.9788966; thetaInc[0] = -0.2; w[1] = 150.0; h[1] = 100.0; theta[1] = 2.9318233; thetaInc[1] = -0.05; w[2] = 150.0; h[2] = 50.0; theta[2] = 2.4723196; thetaInc[2] = -0.05; w[3] = 50.0; h[3] = 50.0; theta[3] = 0.27118653; thetaInc[3] = -0.15; 


  noFill();
  strokeWeight(1);
  stroke(0);
}

void draw() {
  for (int i = 0; i < count; i++) {
    getX(i);
    getY(i);
  }

  if (drawType == 0) {
    background(255);

    for (int i = 0; i < count; i++) {
      strokeWeight(1);
      ellipse(x[i], y[i], w[i], h[i]);

      strokeWeight(3);
      line(x[i], y[i], getX(i), getY(i));
    }
  } else if (drawType == 1) {
    strokeWeight(1);
    point(getX(count-1), getY(count-1));
    line(getX(count-1), getY(count-1), px, py);
  }

  px = getX(count-1);
  py = getY(count-1);

  for (int i = 0; i < count; i++) {
    theta[i]+=thetaInc[i];
  }
}

float getX(int i) {
  float S = x[i]+w[i]/2*cos(theta[i]);
  try {
    x[i+1] = S;
  } 
  catch (ArrayIndexOutOfBoundsException e) {
    // tries appending value, if fails, assume array is length "i+1"
  }
  return S;
}

float getY(int i) {
  float S = y[i]+h[i]/2*sin(theta[i]);
  try {
    y[i+1] = S;
  } 
  catch (ArrayIndexOutOfBoundsException e) {
    // tries appending value, if fails, assume array is length "i+1"
  }
  return S;
}

void keyReleased() {
  if (key == ' ') {
    background(255);
    for (int i = 0; i < count; i++) {
      x[i] = 0;
      y[i] = 0;
      w[i] = 0;
      h[i] = 0;
      while (w[i] == h[i]) {
        w[i] = reMult * (int) random(minRe, maxRe);
        h[i] = reMult * (int) random(minRe, maxRe);
      }

      theta[i] = random(0, TWO_PI);
      thetaInc[i] = 0;
      while (thetaInc[i] == 0) {
        thetaInc[i] =  (int) random(minSp, maxSp)/spReduction;
      }
    }
    x[0] = width/2;
    y[0] = height/2;
    draw(); 
    draw(); // to init px, py; removes artifacts
    background(255);

    print("  // x[0] = " + x[0] + "; y[0] = " + y[0] + "; ");

    for (int i = 0; i < count; i++) {
      print("w[" + i + "] = " + w[i] + "; h[" + i + "] = " + h[i] + "; theta[" + i + "] = " + theta[i] + "; thetaInc[" + i + "] = " + thetaInc[i] + "; ");
    }
    println();
  }
}

void mouseClicked() {
  background(255);
  drawType++;
  if (drawType > 1) {
    drawType = 0;
  }
}
