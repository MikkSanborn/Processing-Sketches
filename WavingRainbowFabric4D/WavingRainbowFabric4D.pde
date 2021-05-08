int perW = 1960/10;
int perH = 1080/10;
float r = PI;
float initThetaFrequency = 0.005;
float thetaDeltaSpeed = 0.1;
float alpha = 200;
float[][] theta = new float[perW][perH];
float[][][] points = new float[perW][perH][2];
// [1] = x pos, [2] = y pos, [3] = (x, y)

void setup() {
  size(1960, 1080);
  colorMode(HSB, width, height, 100);
  strokeWeight(3);

  for (int i = 0; i < points.length; i++) {
    for (int j = 0; j < points[0].length; j++) {
      points[i][j][0] = width/perW*i;
      points[i][j][1] = height/perH*j;
      theta[i][j] = initThetaFrequency*i*j;
    }
  }
}

void draw() {
  println(frameRate);
  background(0, 0, 0);
  
  for (int i = 0; i < points.length; i++) {
    for (int j = 0; j < points[0].length; j++) {
      points[i][j][0] += cos(theta[i][j])*r/*+(width/perW*i)*/;
      points[i][j][1] += sin(theta[i][j])*r/*+(height/perH*j)*/;
      stroke(points[i][j][0], points[i][j][1], 100, alpha);
      point(points[i][j][0], points[i][j][1]);
      theta[i][j] += thetaDeltaSpeed;
    }
  }
}

void mouseWheel() {
  for (int i = 0; i < points.length; i++) {
    for (int j = 0; j < points[0].length; j++) {
      points[i][j][0] = random(0, width);
      points[i][j][1] = random(0, height);
      theta[i][j] = initThetaFrequency*i*j;
    }
  }
}
