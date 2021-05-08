int count = 6;

float[] x = new float[count];
float[] y = new float[count];

int r = 10;

void setup() {
  size(800, 800);

  randomizePoints();
}

void draw() {
  background(0);

  stroke(255);

  for (int i = 0; i < count; i++) {
    strokeWeight(5);
    point(x[i], y[i]);
    
    println(x[i] + "  " + y[i]);
    
    strokeWeight(2);
    line(x[i], y[i], x[(i+1 < count ? i+1:0)], y[(i+1 < count ? i+1:0)]);
  }
  
  if (mousePressed) {
    movePoints();
  }
}

void randomizePoints() {
  for (int i = 0; i < count; i++) {
    x[i] = random(0, width);
    y[i] = random(0, height);
  }
}

void keyReleased() {
  if (key == 'r') {
    randomizePoints();
  }
}

void movePoints() {
  boolean captured = false;
  
  for (int i = 0; i < count; i++) {
    if (dist(x[i], y[i], pmouseX, pmouseY) < r && !captured) {
      x[i] = mouseX;
      y[i] = mouseY;
      captured = true; // prevents moving two at a time
    }
  }
}
