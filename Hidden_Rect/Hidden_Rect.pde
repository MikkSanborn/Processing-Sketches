float[] x = new float[] {150, 350, 350, 150};
float[] y = new float[] {100, 100, 400, 400};

boolean overlay = true;

float theta = 0;

void setup() {
  size(500, 500);

  stroke(255);
  noFill();
}

void draw() {
  background(0);
  
  pushMatrix();
  translate(250, 250);
  rotate(theta);
  stroke(255);
  noFill();
  quad(x[0]-250, y[0]-250, x[1]-250, y[1]-250, x[2]-250, y[2]-250, x[3]-250, y[3]-250);
  popMatrix();

  if (overlay) {
    noStroke();
    fill(0);
    rect(0, 0, width, mouseY-1);
    rect(0, height, width, -(height-mouseY-1));
  }
}

void mouseReleased() {
  overlay = !overlay;
}

void mouseWheel() {
  theta+=0.1;
}
