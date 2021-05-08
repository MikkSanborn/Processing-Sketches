int amount = 20;
int flyingZ = -1000;
boolean solid = false;

void setup() {
  size(800, 800, P3D); // y must = x

  background(255);
  strokeWeight(width/amount/4);
}

void draw() {
  lights();
  pushMatrix();
  translate(width/2, width/2, flyingZ);
  background(255);
  rotateX(-mouseY*TWO_PI/width);
  rotateY(-mouseX*TWO_PI/width);

  for (int x = 0; x < amount; x++) {
    for (int y = 0; y < amount; y++) {
      for (int z = 0; z < amount; z++) {
        stroke((float) x*255/amount, (float) y*255/amount, (float) z*255/amount, (solid ? 255 : 40));
        point((float) x*width/amount-width/2, (float) y*width/amount-width/2, (float) z*width/amount-width/2);
      }
    }
  }
  
  if (keyPressed && keyCode == UP) {
    flyingZ -= 10;
  }
  if (keyPressed && keyCode == DOWN) {
    flyingZ += 10;
  }
  popMatrix();
}

void keyReleased() {
  if (key == 's') {
    solid = !solid;
  }
}
