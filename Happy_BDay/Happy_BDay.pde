float s = 0, r = 0;
float h = 0;
float d = 1; // or -1

void setup() {
  size(500, 500);
  colorMode(HSB, 360, 100, 100);
  
  textSize(32);
}

void draw() {
  background(0);
  
  pushMatrix();
  translate(width/2, height/2);
  rotate(r);
  scale(abs(s));
  
  fill(h%360, 100, 100);
  text("Happy Birthday!", -125, 10);
  
  r += 0.03*d;
  s += 0.1*d;
  s*=0.99;
  if (r >= 1 || r <= -1) {
    d *= -1;
  }
  
  h+=2;
  
  popMatrix();
}
