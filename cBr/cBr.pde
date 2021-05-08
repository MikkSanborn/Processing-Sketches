Object[] c = new Object[20];
Obstacle[] r = new Obstacle[2];

float d2 = 20;

void setup() {
  size(800, 800);

  for (int i = 0; i < c.length; i++) {
    c[i] = new Object(random(d2, width-d2), random(d2, height-d2), random(random(-8, 0), random(0, 8)), random(random(-8, 0), random (0, 8)), random(10, d2));
  }
  
  r[0] = new Obstacle(100, 200, 300, 200);
  r[1]  =new Obstacle(400, 375, 150, 75);
}

void draw() {
  background(0);
  
  for (int i = 0; i < c.length; i++) {
    c[i].display();
    c[i].move();
    
    for (int j = 0; j < r.length; j++) {
      c[i].collision(r[j].x, r[j].y, r[j].w, r[j].h);
    }
  }
  
  for (int i = 0; i < r.length; i++) {
    r[i].display();
  }
}

class Obstacle {
  float x, y, w, h;
  
  Obstacle(float xt, float yt, float wt, float ht) {
    x = xt;
    y = yt;
    w = wt;
    h = ht;
  }
  
  void display() {
    fill(25, 220, 50);
    strokeWeight(1);
    stroke(0);
    
    rect(x, y, w, h);
  }
}

class Object {
  float x, y, xs, ys, d;
  
  Object(float xt, float yt, float xst, float yst, float dt) {
    x = xt;
    y = yt;
    xs = xst;
    ys = yst;
    d = dt;
  }
  
  void display() {
    fill(40, 50, 240);
    strokeWeight(1);
    stroke(0);
    
    ellipse(x, y, d, d);
  }
  
  void move() {
    x+=xs;
    y+=ys;
    
    if (x+d/2 > width || x-d/2 < 0) {
      xs*=-1;
    }
    if (y+d/2 > height || y-d/2 < 0) {
      ys*=-1;
    }
  }
  
  void collision(float xO, float yO, float wO, float hO) {
    if (x+d/2 > xO && y+d/2 > yO && y-d/2 < yO+hO && x-d/2 < xO+wO) { // if colliding
      if (y+d/2 < yO) { // bounce on top
        ys*=-1;
      } else if (y-d/2 > yO+hO) { // bounce on bottom
        ys*=-1;
      } else if (x+d/2 < xO) {
        xs*=-1;
      } else if (x-d/2 > xO+wO) {
        xs*=-1;
      } else {
        println("problemo");
      }
    }
  }
}
