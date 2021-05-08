float i = 0;
float zeta = 0;

void setup() {
  size(640, 360, P3D); 
  background(0);
  lights();
  // noStroke();
  strokeWeight(2);
  stroke(255);
  fill(225, 120, 80);
}

void draw() {
  background(0);
  translate(width>>1, height>>1);
  rotateY(i += .012+(zeta/10));
  rotateX((i/3)+(zeta/20));
  rotateZ(zeta/15);
  box(100);
  
  zeta*=.99;
  
  if (zeta < 0.001) {
    zeta = 0;
  }
  
  println(zeta);
}

void mouseClicked() {
  zeta = (float) mouseX/width;
}
