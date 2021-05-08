int r = 25;
float sc = 1.5;
float[] theta = new float[r];

void setup() {
  size(1000, 1000);
  
  rectMode(CENTER);
  stroke(0, 0, 0, 50);
  
  for (int i = 0; i < r; i++) {
    theta[i] = 0;
  }
  
  background(0);
}

void draw() {
  fill(100, 100, 100, 25);
  rect(width/2, height/2, width, height);
  
  for (int i = 0; i < r; i++) {
    theta[i]+= (float) ((i/10.0)+1)/50;
  }
  
  
  for(int i = r; i > 0; i--) {
    pushMatrix();
    translate(width/2, height/2);
    rotate(theta[r-i]-PI);
    fill(i/r*255, 255-(255*i/r), 255/r+i*r, 80);
    rect(0, 0, i*r*sc, i*r*sc);
    /*
    line(-i*r*sc/2, -i*r*sc/2, (i-1)*r*sc/2, (i-1)*r*sc/2);
    line(-i*r*sc/2, i*r*sc/2, (i-1)*r*sc/2, -(i-1)*r*sc/2);
    */
    popMatrix();
    
    if (theta[r-i] >= TWO_PI) {
      theta[r-i] = 0;
    }
  }
}
