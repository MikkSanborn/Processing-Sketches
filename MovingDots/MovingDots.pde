movingDot[] d = new movingDot[100];

void setup() {
  size(500, 500);
  
  for (int i = 0; i < d.length; i++) {
    d[i] = new movingDot(random(0, width), random(0, height), random(-2, 2), random(-2, 2), 20);
  }
}
void draw() {
  background(0);
  
  strokeWeight(1);
  for (int i = 0; i < d.length; i++) {
    d[i].display();
    d[i].move();
    d[i].collide(mouseX, mouseY, 75);
  }
  
  noStroke();
  fill(255, 255, 255, 100);
  ellipse(mouseX, mouseY, 75, 75);
}

class movingDot {
  float x, y, xs, ys;
  float r, g, b, a, s; // s = dotSize
  
  movingDot(float xt, float yt, float xst, float yst, float st) {
    x = xt;
    y = yt;
    xs = xst;
    ys = yst;
    s = st;
    r = random(0, 255);
    g = random(0, 255);
    b = random(0, 255);
  }
  
  void display() {
    stroke(r, g, b);
    fill(r, g, b);
    ellipse(x, y, s, s);
  }
  
  void move() {
    x+=xs;
    y+=ys;
    
    if (x+s >= width || x-s <= 0) {
      xs*=-1;
      x+=xs;
    }
    if (y+s >= height || y-s <= 0) {
      ys*=-1;
      y+=xs;
    }
  }
  
  void collide(float X, float Y, float R) {
    if (sqrt(sq(x-X)+sq(y-Y)) < (R+s)/2) {
      if (x > X) {
        if (xs < 0) {
          xs*=-1;
        }
      } else {
        if (xs > 0) {
          xs*=-1;
        }
      }
      if (y > Y) {
        if (ys < 0) {
          ys*=-1;
        }
      } else {
        if (ys > 0) {
          ys*=-1;
        }
      }
      while (sqrt(sq(x-X)+sq(y-Y)) < (R+s)/2) {
        x+=xs;
        y+=ys;
      }
    }
  }
}
