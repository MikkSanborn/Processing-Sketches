float r = 200;
float theta = 0;
float thetaInc = 0.02;
float size = 5;

void setup() {
  size(1000, 1000);
  colorMode(HSB, width, 100, 100, 100);
  
  noStroke();
}

void draw() {
  background(0);
  
  for (int i = 0; i < width/size; i++) {
    fill(i*size, 100, 100);
    ellipse(i*size, (float) (height/2+r*sin((theta+thetaInc*i)%TWO_PI)), size, size);
  }
  
  theta+=thetaInc;
}
