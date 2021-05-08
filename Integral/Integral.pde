// make an integral solver with visuals of rectangles and stuff.
int x_min = 0; // lowest x shown on screen
int x_max = 50; // highest x shown on screen
int y_min = -20; // lowest y shown
int y_max = 500; // highest y shown

float x_scale, y_scale; // used to calculate how much the screen should be scaled

float dot_size = 3; // for aestetics

void setup() {
  size(500, 500);

  x_scale = (float) width/(x_max-x_min);
  y_scale = (float) height/(y_max-y_min);

  fill(255);
  noStroke();
}

void draw() {
  pushMatrix();
  translate(x_min, y_min+height);
  scale(x_scale, -y_scale);
  background(0);
  
  stroke(255);
  strokeWeight(1);
  line(x_min, 0, x_max, 0);
  line(0, y_min, 0, y_max);
  
  fill(255);
  noStroke();

  for (float x = x_min; x < x_max; x+=1/x_scale) {
    ellipse(x, f(x), dot_size/x_scale, dot_size/y_scale);
  }
  
  println(integral(0, mouseX, 0.001, true));

  popMatrix();
}

float f(float x) {
  return x*x;
}

float integral(float m, float n, float dx, boolean show_rectangles) { // m = min, n = max, dx = diff of x
  float out = 0;
  
  for (float x = m; x <= n; x+=dx) {
    out+=f(x)*dx;
    
    if (show_rectangles) {
      fill(0, 0, 255, 80);
      stroke(0, 0, 120, 180);
      
      rect(x, 0, dx, f(x));
    }
  }
  
  return out;
}
