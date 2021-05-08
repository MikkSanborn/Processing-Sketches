int perW = 1000/20;
int perH = 1000/20;
float r = 20; // 7.5*PI
float initThetaFrequency = 0.025;
float thetaDeltaSpeed = .125;
float alpha = 255;
float pointSize = 5;
float[][] theta = new float[perW][perH];
float[][][] points = new float[perW][perH][3];
color[][] col = new color[perW][perH];
// [1] = x pos, [2] = y pos, [3] = (x, y)

void setup() {
  size(1000, 1000);
  colorMode(HSB, width, height, 100);
  strokeWeight(pointSize);

  for (int i = 0; i < points.length; i++) {
    for (int j = 0; j < points[0].length; j++) {
      points[i][j][0] = width/perW*i;
      points[i][j][1] = height/perH*j;
      theta[i][j] = initThetaFrequency*i*j; // 2d wave (ripple)
      points[i][j][2] = random(1, pointSize*2/3);
      // theta[i][j] = initThetaFrequency*i; // linear wave
      col[i][j] = color(random(0, width), random(0, height), random(0, 100));
    }
  }
  background(0);
}

void draw() {
  r = (float) mouseX/width*100;
  pushMatrix();
  // translate(-points[0][0][0], -points[0][0][1]);
  background(0, 0, 0);
  noStroke();
  // fill(0, 0, 0, 10);
  // rect(-2, -2, width+4, height+4);

  for (int i = 0; i < points.length; i++) {
    for (int j = 0; j < points[0].length; j++) {
      strokeWeight(pointSize);
      points[i][j][0] = cos(theta[i][j])*r+(width/perW*i);
      points[i][j][1] = sin(theta[i][j])*r+(height/perH*j);
      stroke(points[i][j][0], points[i][j][1], 100, alpha);
      // point(points[i][j][0], points[i][j][1]);
      theta[i][j] += thetaDeltaSpeed;
      strokeWeight(pointSize/5);
      // strokeWeight(points[i][j][2]);
      stroke(points[i][j][0], points[i][j][1], 100, alpha);
      fill(points[i][j][0], height, 100.0*points[i][j][1]/height, alpha/2);
      // fill(col[i][j], alpha/2);
      if (i > 0 && j > 0) {
        // line(points[i][j][0], points[i][j][1], points[i-1][j][0], points[i-1][j][1]);
        // line(points[i][j][0], points[i][j][1], points[i][j-1][0], points[i][j-1][1]);
        quad(points[i][j][0], points[i][j][1], points[i-1][j][0], points[i-1][j][1], points[i-1][j-1][0], points[i-1][j-1][1], points[i][j-1][0], points[i][j-1][1]);
      }
    }
  }
  popMatrix();
}
