float pX, pY, pZ;

void setup() {
  size(500, 500, P3D);

  pX = 0;
  pY = 0;
  pZ = 0;
}

void draw() {
  background(#1FEEFF);
  
  pX = mouseX;
  
  translate(pX-width/2, pY, pZ);
  rotateX(mouseY/100.0-1.4);
  
  translate(250, 250, -50);
  translate(0, 150, 0);
  fill(200, 10, 140);
  box(400, 10, 400);
  translate(-0, -150, -0);
  
  translate(0, -100, 0);
  rotateX(1);
  rotateZ(1);
  fill(225, 255, 200);
  box(100, 200, 100);
}
