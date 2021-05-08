float bx, by, r, bxs, bys; // ball's x pos, ball's y pos, radius
float p1y, p2y, h; // paddle 1 y, paddle 2 y, height
float s1, s2; // score 1, score 2

void setup() {
  size(600, 400);

  bx = width/2;
  by = height/2;
  r = 25;
  
  h = 100;
  
  bxs = random(-4, 4);
  bys = random(-4, 4);
}

void draw() {
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
  }
  if (bx+r >= width) { // reverse of prev
    s1++;
  }

  // user interface
  if (keyPressed) {
    if (key == 'w') {
      p1y -= 3;
      // server val
    }
    if (key == 's') {
      p1y += 3;
      // server val
    }
    if (keyCode == UP) {
      p2y -= 3;
    }
    if (keyCode == DOWN) {
      p2y += 3;
    }
  }
  
  // ball
  bx += bxs;
  by += bys;
}
