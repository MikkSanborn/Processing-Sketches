Circle c = new Circle();
Triangle t = new Triangle(400, 25, 450, 250, 350, 450);

void setup() {
  size(500, 500);
  
  c.x = 250;
  c.y = 250;
  c.xs = .6;
  c.ys = -.5;
  c.r = 20;
}

void draw() {
  background(0);
  
  t.display(color(122));
  c.display(color(255));
  
  c.move();
  c.collide(t);
}
