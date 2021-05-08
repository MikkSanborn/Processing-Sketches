float x, y;

void setup() {
  size(1960, 1080);

  x = width/2;
  y = height/2;

  stroke(255);
  noFill();
}

void draw() {
  background(0);
  
  strokeWeight(1);
  stroke(255);
  // bezier(width/3, height/3, mouseX, mouseY, width-mouseX, height-mouseY, 2*width/3, 2*height/3);
  stroke(0, 0, 255);
  bezier(width/3, height/3, mouseX, mouseY, x, y, 2*width/3, 2*height/3);
  stroke(255, 0, 0);
  bezier(width/3, height/3, width-mouseX, height-mouseY, width-x, height-y, 2*width/3, 2*height/3);
  
  strokeWeight(5);
  stroke(0, 255, 0);
  point(x, y);
  
  x+=random(-10, 10);
  y+=random(-10, 10);
}

void mouseClicked() {
  x = width/2;
  y = height/2;
}
