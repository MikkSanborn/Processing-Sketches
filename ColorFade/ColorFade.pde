float ri = (int) random(0, 255);
float gi = (int) random(0, 255);
float bi = (int) random(0, 255);
float rf = (int) random(0, 255);
float gf = (int) random(0, 255);
float bf = (int) random(0, 255);
float cV = 1;

boolean cycle = false;

void setup() {
  size(500, 500);

  background(0);
}

void draw() {
  float r, g, b;
  r = ri;
  g = gi;
  b = bi;

  for (int i = 0; i < width; i++) {
    stroke(r, g, b);
    line(i, 0, i, height);
    r+=(rf-ri)/width;
    g+=(gf-gi)/width;
    b+=(bf-bi)/width;
  }
  changeColor();
  
  if (cycle && frameCount % 40 == 0) {
    randomizeColors();
  }
}

void keyReleased() {
  if (key == 'l') {
    cycle = !cycle;
  }
}

void changeColor() {
  if (keyPressed && !mousePressed) {
    if (key == 'r') {
      ri+=cV;
    } else if (key == 'R') {
      ri-=5;
    } else if (key == 'g') {
      gi+=5;
    } else if (key == 'G') {
      gi-=5;
    } else if (key == 'b') {
      bi+=5;
    } else if (key == 'B') {
      bi-=5;
    }
  } else if (keyPressed && mousePressed) {
    if (key == 'r') {
      rf+=5;
    } else if (key == 'R') {
      rf-=5;
    } else if (key == 'g') {
      gf+=5;
    } else if (key == 'G') {
      gf-=5;
    } else if (key == 'b') {
      bf+=5;
    } else if (key == 'B') {
      bf-=5;
    }
  }
  if (ri > 255) {
    ri = 255;
  }
  if (ri < 0) {
    ri = 0;
  }
  if (gi > 255) {
    gi = 255;
  }
  if (gi < 0) {
    gi = 0;
  }
  if (bi > 255) {
    bi = 255;
  }
  if (bi < 0) {
    bi = 0;
  }
  if (rf > 255) {
    rf = 255;
  }
  if (rf < 0) {
    rf = 0;
  }
  if (gf > 255) {
    gf = 255;
  }
  if (gf < 0) {
    gf = 0;
  }
  if (bf > 255) {
    bf = 255;
  }
  if (bf < 0) {
    bf = 0;
  }
}

void randomizeColors() {
  ri = random(0, 255);
  gi = random(0, 255);
  bi = random(0, 255);
  rf = random(0, 255);
  bf = random(0, 255);
  gf = random(0, 255);
}

void mouseWheel() {
  randomizeColors();
}
