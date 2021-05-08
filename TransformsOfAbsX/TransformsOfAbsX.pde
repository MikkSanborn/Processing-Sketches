float a = -1;
float b = 0.2;
float h = 250;
float k = -250;

void setup() {
  size(500, 500);
  
  stroke(255);
}

void draw() {
  background(0);
  
  line(width/2, 0, width/2, height);
  line(0, height/2, width, height/2);
  
  for (float x = 0; x < width; x+=0.25) {
    point(x, f(x));
  }
}

float f(float x) {
  return a*sq(b*(x-h))-k;
}
