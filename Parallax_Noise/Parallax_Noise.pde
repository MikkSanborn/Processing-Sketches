int layers = 8;
float dx = .02;
float dxs = .025;
float w = 1;
float h = 50;

void setup() {
  size(800, 800);
  
  noStroke();
}

void draw() {
  background(180);
  
  float prev_y = 0;
  
  for (int l = 0; l < layers; l++) {
    fill(l*256.0/layers);
    for (int x = 0; x < width; x+=w) {
      float y = height-(1+layers-l)*h*noise(dx*x+l*15+frameCount*(layers-l+1)*dxs);
      quad(x-w, height, x-w, prev_y, x, y, x, height);
      prev_y = y;
    }
  }
}
