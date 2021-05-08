int perW = 1080/25;
int perH = 1080/25;
float r = 4*PI;
float initThetaFrequency = 0.008;
float thetaDeltaSpeed = .05;
float alpha = 255;
float pointSize = 10;
float[][] theta = new float[perW][perH];
float[][][] points = new float[perW][perH][3];
// [1] = x pos, [2] = y pos, [3] = (x, y)

void setup() {
  size(1000, 1000, P3D);
  colorMode(HSB, width, height, 100);
  strokeWeight(pointSize);

  for (int i = 0; i < points.length; i++) {
    for (int j = 0; j < points[0].length; j++) {
      points[i][j][0] = width/perW*i;
      points[i][j][1] = height/perH*j;
      theta[i][j] = initThetaFrequency*i*j; // 2d wave (ripple)
      points[i][j][2] = pointSize/5;
      points[i][j][2] = random(pointSize/5, pointSize*2/3);
      // theta[i][j] = initThetaFrequency*i; // linear wave
    }
  }
}

void draw() {
  background(0, 0, 0);
  pushMatrix();
  translate(width/2, mouseY+height/2);
  scale(2);
  rotateX(1);
  rotateY(PI);
  rotateZ(4);

  strokeWeight(pointSize);
  for (int i = 0; i < points.length; i++) {
    for (int j = 0; j < points[0].length; j++) {
      points[i][j][0] = cos(theta[i][j])*r+(width/perW*i);
      points[i][j][1] = sin(theta[i][j])*r+(height/perH*j);
      stroke(0, 0, 100, 80);
      point(points[i][j][0], 0, points[i][j][1]);
      point(points[i][j][0], points[i][j][1], width);
      point(0, points[i][j][0], points[i][j][1]);
      // point(i*width/perW, points[i][j][0], points[i][j][1]);
      theta[i][j] += thetaDeltaSpeed;
    }
  }

  // mesh
  strokeWeight(pointSize/5);
  for (int i = 1; i < points.length; i++) {
    for (int j = 1; j < points[0].length; j++) {
      strokeWeight(points[i][j][2]);
      stroke(points[i][j][0], points[i][j][1], 80, alpha);
      fill(points[i][j][0], points[i][j][1], 100, alpha);
      line(points[i][j][0], points[i][j][1], points[i-1][j][0], points[i-1][j][1]);
      line(points[i][j][0], points[i][j][1], points[i][j-1][0], points[i][j-1][1]);
      quad(points[i][j][0], points[i][j][1], points[i-1][j][0], points[i-1][j][1], points[i-1][j-1][0], points[i-1][j-1][1], points[i][j-1][0], points[i][j-1][1]);
    }
  }
  popMatrix();
}
