float rotx = PI/4;
float roty = PI/4;

void setup(){
  size( 300, 300, P3D );
}

void draw(){
  background(128);
  noStroke();
  translate(width/2.0, height/2.0, -100);
  rotateX(rotx);
  rotateY(roty);
  scale(90);
  // Front
  beginShape(QUADS);
  fill(255,0,0);
  vertex(-1, -1,  1);
  vertex( 1, -1,  1);
  vertex( 1,  1,  1);
  vertex(-1,  1,  1);
  endShape();
  // Back
  beginShape(QUADS);
  fill(255,255,0);
  vertex( 1, -1, -1);
  vertex(-1, -1, -1);
  vertex(-1,  1, -1);
  vertex( 1,  1, -1);
  endShape();
  // Bottom
  beginShape(QUADS);
  fill( 255,0,255);
  vertex(-1,  1,  1);
  vertex( 1,  1,  1);
  vertex( 1,  1, -1);
  vertex(-1,  1, -1);
  endShape();
  // Top
  beginShape(QUADS);
  fill(0,255,0);
  vertex(-1, -1, -1);
  vertex( 1, -1, -1);
  vertex( 1, -1,  1);
  vertex(-1, -1,  1);
  endShape();
  // Right
  beginShape(QUADS);
  fill(0,0,255);
  vertex( 1, -1,  1);
  vertex( 1, -1, -1);
  vertex( 1,  1, -1);
  vertex( 1,  1,  1);
  endShape();
  // Left
  beginShape(QUADS);
  fill(0,255,255);
  vertex(-1, -1, -1);
  vertex(-1, -1,  1);
  vertex(-1,  1,  1);
  vertex(-1,  1, -1);
  endShape();
}

void mouseDragged() {
  float rate = 0.01;
  rotx += (pmouseY-mouseY) * rate;
  roty += (mouseX-pmouseX) * rate;
}
