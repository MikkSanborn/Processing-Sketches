PImage photo;
color[][] pix;
int r = 50;
boolean cursor = true;
int photoId = 0;
int detail = 360;
boolean fadeB = false;

void setup() {
  size(1960, 1080);
  pix = new color[width][height];

  photo = loadImage("KBG.png");
  photo = loadImage("BG2.jpg");
  photo = loadImage("BG3.jpg");

  getPixelArray();

  // noCursor();
  noStroke();

  frameRate(1200);
}

void draw() {
  // background(0);

  if (keyPressed && key == 'w' && r <= height) {
    r*=1.5;
  } else if (keyPressed && key == 's' && r >= 10) {
    r/=1.5;
  }
  if (keyPressed && key == 'a' && detail >= 21) {
    detail -= 20;
  } else if (keyPressed && key == 'd') {
    detail += 20;
  }

  if (fadeB) {
    background(0);
  }

  drawAround(mouseX, mouseY, r, fadeB);
}

void getPixelArray() {
  background(0);
  image(photo, 0, 0);

  for (int i = 0; i < width; i++) {
    for (int j = 0; j < height; j++) {
      pix[i][j] = get(i, j);
    }
  }

  background(0);
}

void drawAround(int x, int y, float maxWidth, boolean fade) {
  float theta = 0;
  float curWidth = maxWidth;

  for (int k = (int) maxWidth; k > 0; k--) {
    double pU = detail; // pixels updated
    
    for (int i = (int) (pU); i > 0; i--) { // /2, because radius... i think, maybe remove
      // println("x: " + (int) (cos(theta)*curWidth+x) + "  y: " + (int) (sin(theta)*curWidth+y));

      stroke(pix[(cos(theta)*curWidth+x >= 0 && cos(theta)*curWidth+x < width ? ((int) (cos(theta)*curWidth+x)):0)][(int) ((sin(theta)*curWidth+y >= 0 && sin(theta)*curWidth+y < height ? (sin(theta)*curWidth+y):0))]);
      point(cos(theta)*curWidth+x, sin(theta)*curWidth+y);

      if (fade) {
        stroke(0, 0, 0, 255-(maxWidth-curWidth)*(255/maxWidth));
        point(cos(theta)*curWidth+x, sin(theta)*curWidth+y);
      }

      // theta += 360.0/(curWidth*PI/2);
      theta+= 360.0/pU;
    }
    curWidth--;
    theta = 0;
  }
}

void changePhoto() {
  photoId = (photoId >= 2 ? 0:photoId+1);

  switch(photoId) {
  case 0:
    photo = loadImage("KBG.png");
    break;
  case 1:
    photo = loadImage("BG2.jpg");
    break;
  case 2:
    photo = loadImage("BG3.jpg");
    break;
  }

  getPixelArray();
}

void keyReleased() {
  if (key == 'l') {
    changePhoto();
  }
  if (key == 'f') {
    fadeB = !fadeB;
  }
}

void mouseWheel() {
  if (cursor) {
    noCursor();
  } else {
    cursor(ARROW);
  }
  cursor = !cursor;
}
