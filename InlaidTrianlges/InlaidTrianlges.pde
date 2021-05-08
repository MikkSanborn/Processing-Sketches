Triangle T;

void setup() {
  size(500, 500);
  
  T = new Triangle(0, height, width/2, 0, width, height, 10);
}

void draw() {
  background(0);
  
  T.display();
}

class Triangle {
  float x1, y1, x2, y2, x3, y3;
  int level;

  Triangle(float x1, float y1, float x2, float y2, float x3, float y3, int level) {
    this.x1 = x1;
    this.y1 = y1;
    this.x2 = x2;
    this.y2 = y2;
    this.x3 = x3;
    this.y3 = y3;
    this.level = level;
  }

  void display() {
    fill(255/(level+1));
    strokeWeight(1);
    stroke(255);
    triangle(x1, y1, x2, y2, x3, y3);
    drawSubTriangles();
  }

  void drawSubTriangles() {
    if (level > 0) {
      Triangle t = new Triangle((x1+x2)/2, (y1+y2)/2, (x2+x3)/2, (y2+y3)/2, (x3+x1)/2, (y3+y1)/2, level-1);
      t.display();
    }
  }
}
