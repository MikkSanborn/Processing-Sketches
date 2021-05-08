int r = 0, g = 0, b = 0;


void setup() {
  size(500, 500);
  
  fill(122.5);
  stroke(250);
  rectMode(CENTER);
}

void draw() {
  background(0);
  fill(r, g, b);
  for(int i = width; i >= 0; i--) {
    rect(width/2, height/2, i*i*mouseX/8, i*i*mouseY/8);
  }
  
  if (keyPressed) {
     if (key == 'r') {
       r+=3;
     }
     if (key == 'g') {
       g+=3;
     }
     if (key == 'b') {
       b+=3;
     }
  } else if (keyPressed && mousePressed) {
     if (key == 'r') {
       r-=3;
     }
     if (key == 'g') {
       g-=3;
     }
     if (key == 'b') {
       b-=3;
     }
  }
  println(r + "  " + g + "  " + b);
}
