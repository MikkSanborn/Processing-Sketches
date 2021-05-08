int quantity = 50;
float[][] elevation = new float[quantity][quantity];
float nx = 2.3;
float ny = 2;
float seed = random(-100000, 100000);

void setup() {
  size(1000, 1000);

  for (int x = 0; x < elevation.length; x++) {
    for (int y = 0; y < elevation[0].length; y++) {
      elevation[x][y] = noise(nx*x+seed, ny*y+seed);
    }
  }
  noStroke();
}

void draw() {
  pushMatrix();
  // translate(0, 715, -500);
  // rotateX(1);
  // rotateY(TWO_PI*mouseY/height);
  // rotateZ(TWO_PI*mouseX/width);
  background(0);

  for (int x = 0; x < elevation.length; x++) {
    for (int y = 0; y < elevation[0].length; y++) {
      fill(elevation[x][y]*255);
      rect((float) x*(width/elevation.length), (float) y*(height/elevation[0].length), (float) width/elevation.length, (float) height/elevation[0].length);
      // rect((float) x*(width/elevation.length), (float) y*(height/elevation[0].length), elevation[x][y]*25-(float) x*(width/elevation.length), (float) x*(width/elevation.length));
      
    }
  }
  popMatrix();
}

void mouseClicked() {
  float seed = random(-100000, 100000);  
  for (int x = 0; x < elevation.length; x++) {
    for (int y = 0; y < elevation[0].length; y++) {
      elevation[x][y] = noise(nx*x+seed, ny*y+seed);
    }
  }
}
