float x = 0.1;
float k = 10000;

float x_off;
float y_off;

void setup() {
  size(500, 500);
  
  strokeWeight(3);
  stroke(125);
  fill(255);
  
  textSize(24);
  
  x_off = 10;
  y_off = -10;
}

void draw() {
  pushMatrix();
  translate(x_off, y_off);
  background(0);
  
  for (float _x = 0; _x < width; _x++) {
    point(_x, height-f(_x));
  }
  
  float w = x;
  float h = f(x);
  rect(0, height, w, -h);
  
  text("w: " + w, 300, 100);
  text("h: " + h, 300, 150);
  text("A: " + w*h, 300, 200);
  
  x = mouseX - x_off;
  popMatrix();
}

float f(float x) {
  if (x == 0) return 0;
  return k/x;
}
