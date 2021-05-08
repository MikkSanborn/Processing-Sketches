void setup() {
  size(800, 800);
}

void draw() {
  background(0);
}

class Branch {
  final int seed;
  final int n; // used to represent the "height" of the branch from the ground.
  
  float x1, y1, x2, y2;
  
  float theta; // overall angle of branch, provided for sense of continuity up a "tree"
  
  public Branch(int seed, float x, float y) {
    this.seed = seed;
    this.n = 0;
    
    randomSeed(seed);
    
    this.x1 = x;
    this.y1 = y;
  }
  
  protected Branch(int seed, int n, float x, float y) {
    this.seed = seed;
    this.n = n;
    
    this.x1 = x;
    this.y1 = y;
  }
}
