int R, G, B, mode;

void setup() {
  size(500, 500);

  R = 255;
  G = 0;
  B = 0;
  
  background(0);
}

void draw() {
  if (mode == 0) {
    G+=6;
    if (G > 255) {
      G = 255;
      mode++;
    }
  } else if (mode == 1) {
    R-=6;
    if (R < 0) {
      R = 0;
      mode++;
    }
  } else if (mode == 2) {
    B+=6;
    if (B > 255) {
      B = 255;
      mode++;
    }
  } else if (mode == 3) {
    G-=6;
    if (G < 0) {
      G = 0;
      mode++;
    }
  } else if (mode == 4) {
    R+=6;
    if (R > 255) {
      R = 255;
      mode++;
    }
  } else if (mode == 5) {
    B-=6;
    if (B < 0) {
      B = 0;
      mode = 0;
    }
  }
  
  stroke(R, G, B);
  line(frameCount, 0, frameCount, height);
}
