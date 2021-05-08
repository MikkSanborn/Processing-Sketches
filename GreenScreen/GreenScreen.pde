import java.awt.Color;

/*
Target color ("green part of screen") > t
PImage result (change name), the img that replaces green.
imgPix[][] = getPixels() from PImage 
lim = someInt;
*/
color colorToRemove = color(0, 0, 255);
PImage bg = loadImage("");
PImage img = loadImage("");
color[][] bgPixels;
int rBase = 0;
int gBase = 0;
int bBase = 0;
int rRange = 10; 
int gRange = 10;
int bRange = 10;

void setup() {
  size(500, 500);
  
  bgPixels = new color[width][height];
  
  background(255);
  image(bg, 0, 0, width, height);
  
  loadPixels();
  
  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {
      bgPixels[x][y] = pixels[y*width+x];
    }
  }
  
  background(0);
  image(img, 0, 0, width, height);
}

void draw() {
  background(0);
  image(img, 0, 0, width, height);
  loadPixels();
  
  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {
      // some weird conditions???
      println(pixels[x+y*width]);
    }
  }
}
