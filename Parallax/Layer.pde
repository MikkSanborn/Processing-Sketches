class Layer {
  int seed;
  float x, y;
  color surfaceColor;
  // color backgroundColor;
  
  Layer (float x, float y, color c) {
    this.seed = (int) random(0, Integer.MAX_VALUE);
    this.x = x;
    this.y = y;
    this.surfaceColor = c;
  }
  
  void display() {
    pushMatrix();
    translate(-x%1000, -y%1000);
    
    noStroke();
    fill(surfaceColor);
    
    rect(0, 0, width+1000, (int) (Math.abs((seed >> 3)-421)%125+80));
    rect(0, height, width+1000, -(int) (Math.abs((seed >> 3)-421)%200+80));
    
    for (int i = (int) (Math.abs(seed*14 << 2)%100); i < 250; i++) {
      int lx = 400; // "local x", or the approx center. Randomize over seed
      int ly = height/2; // "local y", or the approx center. Randomize over seed
      triangle(lx+10, ly, lx-100, ly+100, lx-20, ly-20); // Randomize over seed
    }
    
    popMatrix();
  }
  
  void step(float dX, float dY) {
    this.x += dX;
    this.y += dY;
  }
}
