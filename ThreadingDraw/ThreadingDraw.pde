boolean called = false;
int x = 0;

void setup() {
  size(500, 500);
}

void draw() {
  
  background(100, 200, 150);

  fill(255);
  ellipse(mouseX, mouseY, 100, 100);
}

void mouseClicked() {
  // doStuff(1000);
  
  thread("callDoThing");
}

public void callDoThing() {
  doStuff(1000);
}

void doStuff(int time) {
  println("called");
  
  background(0, 0, 255);
  println("draw1");
  delay(time);
  fill(255, 1, 100);
  rect(mouseX, mouseY, 40, 100);
  println("draw2");
  delay(time*2);
  background(0, 255, 0);
  println("draw3");
}
