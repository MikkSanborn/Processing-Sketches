float[][] pos = new float[3][2]; // 3 points, 2 parts (x, y)
float mp1, mp2, mp3, bp1, bp2, bp3, xf, yf, r;



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
  strokeWeight(3);
}

void draw() {
  background(0);
  
  adjustPoints();
  
  // strokeWeight(1);
  point(pos[0][0], pos[0][1]);
  point(pos[1][0], pos[1][1]);
  point(pos[2][0], pos[2][1]);

  // strokeWeight(1);
  stroke(0, 255, 0);
  triangle(pos[0][0], pos[0][1], pos[1][0], pos[1][1], pos[2][0], pos[2][1]);

  updateVars();
  
  stroke(255, 0, 0);
  line(0, mp1*0+bp1, width, mp1*width+bp1);
  line(0, mp2*0+bp2, width, mp2*width+bp2);
  line(0, mp3*0+bp3, width, mp3*width+bp3);
  
  // strokeWeight(4);
  stroke(0, 0, 255);
  ellipse(xf, yf, r*2, r*2);

  println(xf + "   " + yf + "   " + r + "\r\n");
}

void updateVars() {
  mp1 = (pos[2][0]-pos[0][0])/(pos[0][1]-pos[2][1]); // a-c
  println("mp1: " + mp1);
  mp2 = (pos[0][0]-pos[1][0])/(pos[1][1]-pos[0][1]); // a-b
  println("mp2: " + mp2);
  mp3 = (pos[2][0]-pos[1][0])/(pos[1][1]-pos[2][1]); // c-b
  println("mp3: " + mp3);
  bp1 = (pos[0][1]+pos[2][1])/2-mp1*(pos[0][0]+pos[2][0])/2; // a-c?
  println("bp1: " + bp1);
  bp2 = (pos[1][1]+pos[0][1])/2-mp2*(pos[0][0]+pos[1][0])/2; // a-b?
  println("bp2: " + bp2);
  bp3 = (pos[1][1]+pos[2][1])/2-mp3*(pos[2][0]+pos[1][0])/2; // c-b?
  println("bp2: " + bp2);
  xf = (bp2-bp1)/(mp1-mp2);
  println("xf: " + xf);
  yf = mp1*(bp2-bp1)/(mp1-mp2)+bp1;
  println("yf: " + yf);
  r = sqrt(sq(xf-pos[2][0])+sq(yf-pos[2][1]));
  println("r: " + r);
  println();
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
