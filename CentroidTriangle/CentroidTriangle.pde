float[][] pos = new float[3][2]; // 3 points, 2 parts (x, y)
float mc1, mc2, mc3, bc1, bc2, bc3, xf, yf;

// b = y - mx

void setup() {
  size(500, 500);

  pos[0][0] = 100.0;
  pos[0][1] = 150;
  pos[1][0] = 278;
  pos[1][1] = 379;
  pos[2][0] = 84;
  pos[2][1] = 437;

  noFill();
  stroke(255);
}

void draw() {
  background(0);
  
  adjustPoints();
  
  updateVars();
  
  strokeWeight(5);
  stroke(255, 0, 0);
  line(0, mc1*0+bc1, width, mc1*width+bc1);
  line(0, mc2*0+bc2, width, mc2*width+bc2);
  line(0, mc3*0+bc3, width, mc3*width+bc3);
  
  strokeWeight(8);
  stroke(0, 255, 0);
  triangle(pos[0][0], pos[0][1], pos[1][0], pos[1][1], pos[2][0], pos[2][1]);
}

void updateVars() {
  mc1 = (pos[0][1]-(pos[1][1]+pos[2][1])/2)/(pos[0][0]-(pos[1][0]+pos[2][0])/2);  // a - ((b+c)/2)
  mc2 = (pos[1][1]-(pos[0][1]+pos[2][1])/2)/(pos[1][0]-(pos[0][0]+pos[2][0])/2);  // b - ((a+c)/2)
  mc3 = (pos[2][1]-(pos[0][1]+pos[1][1])/2)/(pos[2][0]-(pos[0][0]+pos[1][0])/2);  // c - ((a+b)/2)
  bc1 = (pos[1][1]+pos[2][1])/2-mc1*(pos[1][0]+pos[2][0])/2;
  bc2 = (pos[0][1]+pos[2][1])/2-mc2*(pos[0][0]+pos[2][0])/2;
  bc3 = (pos[0][1]+pos[1][1])/2-mc3*(pos[0][0]+pos[1][0])/2;
  // b = y - mx
}

void adjustPoints() {
  if (mousePressed) {
    if (key == 'a') {
      pos[0][0] = mouseX;
      pos[0][1] = mouseY;
    }
    if (key == 'b') {
      pos[1][0] = mouseX+.25;
      pos[1][1] = mouseY+.25;
    }
    if (key == 'c') {
      pos[2][0] = mouseX+.5;
      pos[2][1] = mouseY+.5;
    }
  }
}

void mouseWheel() {
  pos[0][0] = random(0, 500);
  pos[0][1] = random(0, 500);
  pos[1][0] = random(0, 500)+.25;
  pos[1][1] = random(0, 500)+.25;
  pos[2][0] = random(0, 500)+.5;
  pos[2][1] = random(0, 500)+.5;
}
