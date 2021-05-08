// 16 boxes, 4 cols, 4 rows
Ball[] objects = new Ball[100];

void setup() {
  size(500, 500);
  
  for(int i = 0; i < objects.length; i++) {
    objects[i] = new Ball(objects.length%16);
  }
}

void draw() {
  background(0);
  
  for (int i = 0; i < objects.length; i++) {
    objects[i].display();
    objects[i].move();
  }
}

class Ball {
  float x, y, xs, ys;
  float r, g, b;
  int boxId;
  
  Ball(int boxId) {
    this.boxId = boxId;
    
    x = random(boxId%4*width/4, (boxId%4+1)*width/4);
    y = random(boxId/4*width/4, (boxId/4+1)*width/4);
    xs = random(-4, 4);
    ys = random(-4, 4);
    
    r = random(255);
    g = random(255);
    b = random(255);
  }
  
  void display() {
    noStroke();
    fill(r, g, b);
    ellipse(x, y, 10, 10);
  }
  
  void move() {
    x+=xs;
    y+=ys;
    
    if (x > boxId%4*width/4 && x < (boxId%4+1)*width/4) {
      xs*=-1;
    }
    
    if (y > boxId/4*width/4 && x < (boxId/4+1)*width/4) {
      ys*=-1;
    }
  }
}
