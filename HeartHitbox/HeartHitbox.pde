float a = -100;
float b = 1;

void setup() {
  size(500, 500);
}

void draw() {
  pushMatrix();
  translate(width/2, height/2);
  background(0);

  strokeWeight(3);
  
  float X = mouseX-width/2;
  float Y = mouseY-height/2;
  
  if (pow((-sq(a)+sq(X)+sq(Y)), 3) <= b*a*sq(X)*pow(Y, 3)) {
    stroke(200, 0, 0);
  } else {
    stroke(255, 0, 0);
  }

  for (int x = -width/2; x < width/2; x++) {
    for (int y = -height/2; y < height/2; y++) {
      if (pow((-sq(a)+sq(x)+sq(y)), 3) <= b*a*sq(x)*(y*y*y)) {
        point(x, y);
      }
    }
  }
  popMatrix();
  
  println(frameCount);
}
