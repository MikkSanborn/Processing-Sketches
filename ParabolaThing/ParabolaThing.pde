// y = a*x^A+C
byte[][] screen;

boolean finding = false;

void setup() {
  size(500, 500);

  screen = new byte[width][height];

  updatePixels();
  
  background(120);
  loadPixels();
}

void draw() {
  background(255);
  updatePixels();
  /*
  for (int x = 0; x < width; x++) {
   for (int y = 0; y < height; y++) {
   if (screen[x][y] == 1) {
   stroke(255);
   } else if (screen[x][y] == -1) {
   stroke(0);
   } else {
   stroke(122.5);
   }
   point(x, y);
   }
   }
   */

  println(frameCount);
}

void keyReleased() {
  if (!finding) {
    print("Search");
    thread("findTrue");
    println("ing");
    finding = true;
  }
}

void findTrue() {
  /*
  for (int x = 0; x < width; x++) {
   for (int y = 0; y < height; y++) {
   if (y == (int) (sq(x*1.0/20)-20)) {
   screen[x][y] = 1;
   } else {
   screen[x][y] = -1;
   }
   }
   }
   */
  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {
      if (y == (int) (sq(x*1.0/20)-20)) {
        pixels[x*width+y] = 255;
      } else {
        pixels[x*width+y] = 0;
      }
      pixels[x*width+y] = 200;
    }
  }
}
