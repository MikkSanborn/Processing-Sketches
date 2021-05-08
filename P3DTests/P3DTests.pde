float tX, tY, tZ;
float tiX, tiY, tiZ;

float spinScale = 0.5;
float spinReduction = 0.95;

void setup() {
  size(500, 500, P3D);
  
  tX = 0;
  tY = 0;
  tZ = 0;
}

void draw() {
  pushMatrix();
  translate(width/2, height/2, -10);
  rotateX(tX);
  rotateY(tY);
  rotateZ(tZ);
  
  tX += tiX;
  tY += tiY;
  tZ += tiZ;
  
  tiX*=spinReduction;
  tiY*=spinReduction;
  tiZ*=spinReduction;
  
  background(0);
  lights();
  
  stroke(120, 120, 120, 200);
  stroke(255, 0, 0);
  fill(240, 70, 140, 255);
  // box(100);
  fill(52, 230, 120, 255);
  box(20, 50, 80);
  
  noStroke();
  fill(80, 245, 230);
  // translate(10, 0, 0);
  sphere(30);
  
  stroke(220, 220, 220);
  fill(0, 0, 255);
  sphere(500);
  
  translate(100, 100, 0);
  stroke(220, 20, 210, 120);
  fill(120, 160, 120, 10);
  sphereDetail(50);
  sphere(145);
  translate(-100, -100, 0); // revert
  
  popMatrix();
}

void mouseClicked() {
  tiX = random(-spinScale, spinScale);
  tiY = random(-spinScale, spinScale);
  tiZ = random(-spinScale, spinScale);
}
