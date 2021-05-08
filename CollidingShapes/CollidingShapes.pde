Shape s;

void setup() {
  size(500, 500);
  
  s = new Rectangle();
}

void draw() {
  background(0);
  
  
}

boolean collide(Shape s1, Shape s2, boolean showConstruction) {
  // find line (l1) that connect CENTERS (circle's center vs. rect's center (different calculaions))
  // find line segment (l2) between intersections of shape's perimiter* and l1
  // find center of l2 (for p1)
  // test on either shape if p1 is containd in either shape
  
  // *find info for shape's perimiter and line intersection by finding theta and using the epicycles & thetaSquare math (other programs)
  
  return false;
}

abstract class Shape {
  float x, y, w, h; // may not use some variables, some more may be required (dependant on shape type)
  ShapeType type;
  
  Shape (float x, float y, float w, float h, ShapeType type) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.type = type;
  }
  
  abstract void display();
  
  void printInfo() {
    println("Shape with type: " + type + " has position: (" + x + ", " + y + "), has a width of: " + w + ", and a height of: " + h);
  }
}

class Rectangle extends Shape {
  
  public Rectangle(float x, float y, float w, float h) {
    super(x, y, w, h, ShapeType.Rectangle);
  }
  
  void display() {
    fill(234, 123, 012);
    noStroke();
    rect(x, y, w, h);
  }
}

enum ShapeType {
  Rectangle, Circle, Ellipse
}
// maybe triangle and/or convex polygon later?
