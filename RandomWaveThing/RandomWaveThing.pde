float t = -25.01;
int c = 2;

float px = 0, py = 0;

void setup() {
  size(500, 500);
  
  strokeWeight(1);
  stroke(255);
  
  background(0);
  
  frameRate(120);
}

void draw() {
  // background(0);
  
  float x = frameCount;
  float y = height/2;
  
  for (int i = 1; i <= c; i++) {
    // y += 100*sin(t*i))/(i*1.0); // neat wave
    // y += 100*sin(t*i/8.0);
    y += 100*sin(abs(sqrt(abs(t))*t/3.0)); // set "t = 25.01;"
  }
  
  // point(x, y);
  line(x, y, px, py);
  
  px = x;
  py = y;
  
  t+=0.1;
}
