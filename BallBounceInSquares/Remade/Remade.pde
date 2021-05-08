Ball[] b = new Ball[100];

void setup() {
  size(800, 800);
  
  for (int i = 0; i < b.length; i++) {
    b[i] = new Ball(random(0, width), random(0, height), random(-2, 2), random(-2, 2), color(random(0, 255), random(0, 255), random(0, 255)));
  }
}

void draw() {
  background(0);
  
  stroke(80);
  strokeWeight(1);
  for (int i = 1; i < 4; i++) {
    line(i*width/4, 0, i*width/4, height);
    line(0, i*height/4, width, i*height/4);
  }
  
  for (int i = 0; i < b.length; i++) {
    b[i].display();
    b[i].move();
  }
}

class Ball {
  float x, y, xs, ys;
  color c;
  public static final float r = 10;
  
  int sq;
  
  //static {
  //  r = 10;
  //}
  
  Ball(float x, float y, float xs, float ys, color c) {
    this.x = x;
    this.y = y;
    this.xs = xs;
    this.ys = ys;
    this.c = c;
    this.sq = (int) (x/(width/4))*4 + (int) (y/(height/4));
  }
  
  void display() {
    fill(c);
    noStroke();
    ellipse(x, y, r*2, r*2);
  }
  
  void move() {
    x+=xs;
    y+=ys;
    if (x+r > ((sq/4)+1)*width/4 || x-r < (sq/4)*width/4) { // bounce logic
      xs*=-1;
      x+=xs;
    }
    if (y+r > ((sq%4)+1)*height/4 || y-r < (sq%4)*height/4) {
      ys*=-1;
      y+=ys;
    }
  }
  
}
