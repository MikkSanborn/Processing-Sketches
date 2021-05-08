PImage Thief;
PImage blueBoxes;
PImage blueBoxes2;

void setup() {
  size(1024, 1024); // 2x picture's width and height

  Thief = loadImage("Thief_64x64.png");
  blueBoxes = loadImage("blueBoxes.jpg");
  blueBoxes2 = loadImage("blueBoxes512x512.jpg");

  gatherPixels(Thief);
}

void draw() {
}

void mouseClicked() {
  println("clicked, please wait...");
  background(0);

  for (int i = 0; i < width*height; i++) {
    if (i%width < width/2 && i/width < height/2) { // if inside picture's original dimensions
      stroke(pixels[i]);
      point(i%width*2, i/width*2);

      if (i%width+1 < width && i/width+1 < height) { // if not on the edge
        // to the right
        stroke((color) lerpColor(pixels[i], pixels[i+1], 0.5));
        point(i%width*2+1, i/width*2);

        // down && to the right
        stroke((color) lerpColor(pixels[i], pixels[i+width+1], 0.5));
        point(i%width*2+1, i/width*2+1);

        // down
        stroke((color) lerpColor(pixels[i], pixels[i+width], 0.5));
        point(i%width*2, i/width*2+1);
      }
    }
  }
  
  save("blueBoxes" + width + "x" + height + ".jpg");
  println("Drawn. Saved as: " + "blueBoxes" + width + "x" + height + ".jpg");
}

void gatherPixels(PImage img) {
  background(0);
  image(img, 0, 0);
  loadPixels();
}
