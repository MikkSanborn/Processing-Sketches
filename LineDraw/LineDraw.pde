boolean pMousePressed = false;

float x1;
float y1;
float x2;
float y2;

void setup() {
  size(500, 500);

  x1 = 0;
  y1 = 0;
  x2 = 0;
  y2 = 0;

  strokeWeight(3);
  stroke(255);
}

void draw() {
  if (!mousePressed) {
    background(0);

    line(x1, y1, x2, y2);
    
    pMousePressed = false;
  } else {
    if (!pMousePressed) { // if not clicked last frame, but clicked now (change in state)
      x1 = mouseX;
      y1 = mouseY;
    }
    pMousePressed = true;
  }
}

void mouseReleased() {
  x2 = mouseX;
  y2 = mouseY;
}
