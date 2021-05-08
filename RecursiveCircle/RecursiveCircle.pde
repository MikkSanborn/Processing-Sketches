Recursive_Circle C;

void setup() {
  size(500, 500);
  
  C = new Recursive_Circle(width/2, height/2, width/2);
}

void draw() {
  background(0);
  
  C.display();
}

class Recursive_Circle {
  float x, y, r;
  
  Recursive_Circle(float x, float y, float r) {
    this.x = x;
    this.y = y;
    this.r = r;
  }
  
  Recursive_Circle Top;
  Recursive_Circle Bottom;
  Recursive_Circle Left;
  Recursive_Circle Right;
  
  void display() {
    noFill();
    strokeWeight(1);
    stroke(255);
    ellipse(x, y, r*2, r*2);
    if (r > 5) {
      Top = new Recursive_Circle(x, y-r/2, r/2);
      Bottom = new Recursive_Circle(x, y+r/2, r/2);
      Left = new Recursive_Circle(x-2*r/3, y, r/3);
      Right = new Recursive_Circle(x+2*r/3, y, r/3);
      
      displaySubCircles();
    }
  }
  
  void displaySubCircles() {
    Top.display();
    Bottom.display();
    Left.display();
    Right.display();
  }
}
