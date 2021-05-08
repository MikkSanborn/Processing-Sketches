float y = 0;

void setup() {
  size(500, 3);
}

void draw() {
  pushMatrix();
  translate(0, 0);
  background(0);
  noStroke();
  fill(255);
  rect(0, 2+y, width, 10);
  fill(255, 255, 0);
  ellipse(width/2, 250+y, 200, 200);
  fill(255, 0, 100);
  rotate(1);
  rect(50, 400+y, 100, 200);
  rotate(-1);
  strokeWeight(10);
  stroke(255);
  line(0, 800+y, width, 900+y);
  float dist = 8;
  for (int i = 0; i < 25; i++) {
    stroke(random(0, 255), random(0, 255), random(0, 255));
    line(0, 800+dist*i+y, width, 900+dist/2*i*i+y);
  }
  
  popMatrix();
  
  y-= 1;
}

void mouseClicked() { 
  y = 0;
}
