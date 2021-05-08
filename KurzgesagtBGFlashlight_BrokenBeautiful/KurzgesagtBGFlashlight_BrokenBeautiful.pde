PImage photo;
color[][] pix;

void setup() {
  size(1960, 1080);
  pix = new color[width][height];

  photo = loadImage("KBG.png");

  getPixelArray();

  // noCursor();
  noStroke();
}

void draw() {
  background(0);

  /*
  loadPixels();
   pixels[mouseY*width+mouseX] = pix[mouseX][mouseY];
   updatePixels();
   
   fill(pix[mouseX][mouseY]);
   ellipse(mouseX, mouseY, 15, 15);
   */

  drawAround(mouseX, mouseY, 100);
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

void drawAround(int x, int y, int maxWidth) {
  float theta = 0;
  float curWidth = maxWidth;

  for (int k = maxWidth; k > 0; k--) {
    for (int i = (int) (curWidth*PI/2); i > 0; i--) { // /2, because radius... i think, maybe remove
      // stroke(pix[(int) (cos(theta)*curWidth+x)][(int) (sin(theta)+curWidth+y)]);
      stroke(255);
      point(cos(theta)*curWidth+x, sin(theta)*curWidth+y);

      stroke(0, 0, 0, (float) maxWidth/curWidth*255.0);
      point(cos(theta)*curWidth+x, sin(theta)+curWidth+y);

      theta += 360.0/(curWidth*PI/2);
    }
    curWidth--;
    theta = 0;
  }
}
