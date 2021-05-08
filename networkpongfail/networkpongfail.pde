import processing.net.*;

Client myClient;
int dataIn;

float bx, by, r, bxs, bys; // ball's x pos, ball's y pos, radius
float p1y, p2y, h; // paddle 1 y, paddle 2 y, height
float s1, s2; // score 1, score 2

void setup() {
  size(600, 400);
  myClient = new Client(this, "170.170.25.246",1111);

  bx = width/2;
  by = height/2;
  r = 25;
  
  h = 100;
  
  bxs = random(-4, 4);
  bys = random(-4, 4);
}

void draw() {
  if (myClient.available() > 0){
    dataIn = myClient.read();
  }
  println(dataIn);
  
  background(255);
  fill(0);
  stroke(120);

  // graphics
  // ball
  ellipse(bx, by, r, r);

  // paddles
  // L
  rect(10, p1y, 10, h);

  // R
  rect(width-20, p2y, 10, h);

  // functionality
  //ceiling
  if (by-r <= 0 || by+r >= height) {
    bys *= -1;
  }
  if (bx-r <= 0) { // ball off left side, right person (p2) scores
    s2++;
    bx = width/2;
    by = height/2;
    bxs = random(-4, 4);
    bys = random(-4, 4);
  }
  if (bx+r >= width) { // reverse of prev
    s1++;
    bx = width/2;
    by = height/2;
    bxs = random(-4, 4);
    bys = random(-4, 4);
  }

  // user interface
  if (keyPressed) {
    if (key == 'w') {
      p1y -= 5;
      // server val
    }
    if (key == 's') {
      p1y += 5;
      // server val
    }
    if (dataIn >= 1) {
      p2y -= 5;
    }
    if (dataIn <= 1) {
      p2y += 5;
    }
  }
  
  
  if (bx-r <= 20 && by+r >= p1y && by-r <= p1y) {
    bx *= -1;
  }
  if (bx+r >= width-20 && by+r >= p2y && by-r <= p2y) {
    bx *= -1;
  }
  
  
  // ball
  bx += bxs;
  by += bys;
  
  text(floor(s1), width/4, 50);
  text(floor(s2), width/4*3, 50);
  
  if (keyPressed && key == 'r') {
    bx = width/2;
    by = height/2;
    bxs = random(-4, 4);
    bys = random(-4, 4);
  }
  println(dataIn);
  
  if (p1y <= 0) {
    p1y = 0;
  }
  if (p1y+h >= height) {
    p1y = height-h;
  }
  if (p2y <= 0) {
    p2y = 0;
  }
  if (p2y+h >= height) {
    p2y = height-h;
  }
}
