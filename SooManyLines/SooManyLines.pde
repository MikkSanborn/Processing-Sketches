void setup() {
  size(1920, 1080);
  
  noCursor();
}

void draw() {
  background(0);
  
  stroke(255);
  line(width/2, height/2, mouseX, mouseY);
  
  line(0, 0, mouseX, mouseY);
  line(0, height, mouseX, mouseY);
  line(width, height, mouseX, mouseY);
  line(width, 0, mouseX, mouseY);
  
  line(width/2, 0, mouseX, mouseY);
  line(width/2, height, mouseX, mouseY);
  line(0, height/2, mouseX, mouseY);
  line(width, height/2, mouseX, mouseY);
  
  stroke(200, 100, 240);
  line(mouseX, 0, mouseX, height);
  line(0, mouseY, width, mouseY);
}
