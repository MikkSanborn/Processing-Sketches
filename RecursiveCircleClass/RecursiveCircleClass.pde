RecursiveCircle C;

void setup() {
  size(500, 500);
  
  C = new RecursiveCircle(width/2, height/2, width/2);
}

void draw() {
  background(0);
  
  C.display();
}

class RecursiveCircle {
  float x, y, r;
  color c, s;
  
  RecursiveCircle(float x, float y, float r) {
    this.x = x;
    this.y = y;
    this.r = r;
    
    float n = 6*255.0*r/(width/2)%255;
    c = color(n);
    s = color(255, 255, 255, 200);
  }
  
  RecursiveCircle Top;
  RecursiveCircle Bottom;
  RecursiveCircle Left;
  RecursiveCircle Right;
  
  void display() {
    fill(c);
    strokeWeight(1);
    stroke(s);
    ellipse(x, y, r*2, r*2);
    if (r > 5) {
      Top = new RecursiveCircle(x, y-r/2, r/2);
      Bottom = new RecursiveCircle(x, y+r/2, r/2);
      Left = new RecursiveCircle(x-2*r/3, y, r/3);
      Right = new RecursiveCircle(x+2*r/3, y, r/3);
      
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
