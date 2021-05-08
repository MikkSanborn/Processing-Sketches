Layer[] l = new Layer[3];

void setup() {
  size(500, 500);
  
  l[0] = new Layer(0, 0, color(255, 0, 0, 80));
  l[1] = new Layer(0, 0, color(0, 255, 0, 80));
  l[2] = new Layer(0, 0, color(0, 0, 255, 80));
}

void draw() {
  background(120);
  
  for (int i = 0; i < l.length; i++) {
    l[i].display();
  }
  
  l[0].step(0.5, 0);
  l[1].step(1.4, 0);
  l[2].step(2.4, 0);
}
