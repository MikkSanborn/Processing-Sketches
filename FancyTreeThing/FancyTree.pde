class FancyTree {
  private float x, y; // x, y origin
  private float l; // length
  private float thetaPerBranch;
  private float thetaOffsetRange;
  private float[] thetaOffset;
  private int countBelow;
  private int level;

  private float lReduction;

  private FancyTree[] treesBelow;

  public FancyTree(float x, float y, float l, float thetaBase, float lReduction, float thetaPerBranch, float thetaOffsetRange, int countBelow, int level) { // add thetaBase
    this.x = x;
    this.y = y;
    this.l = l;
    this.lReduction = lReduction;
    this.thetaPerBranch = thetaPerBranch*PI/180.0; // entered as Degrees, changed to Radians (screw you processing)
    this.thetaOffsetRange = thetaOffsetRange*PI/180.0; // same here
    this.countBelow = countBelow;
    this.level = level;

    this. thetaOffset = new float[countBelow];
    for (int i = 0; i < thetaOffset.length; i++) {
      this.thetaOffset[i] = thetaBase*PI/180.0+random(-this.thetaOffsetRange, this.thetaOffsetRange);
    }

    this.treesBelow = new FancyTree[countBelow];
    for (int i = 0; i < treesBelow.length; i++) {
      if (this.level > 0) {
        int n = i-countBelow/2;
        float xf = x+l*cos(this.thetaPerBranch*n+this.thetaOffset[i]);
        float yf = y+l*sin(this.thetaPerBranch*n+this.thetaOffset[i]);

        treesBelow[i] = new FancyTree(xf, yf, l/this.lReduction, (this.thetaPerBranch*n+this.thetaOffset[i])*180/PI, this.lReduction, this.thetaPerBranch*180.0/PI, this.thetaOffsetRange*180.0/PI, this.countBelow, this.level-1);
      }
    }
  }

  void display() {
    if (level > 0) {
      stroke(C);
      strokeWeight(1);

      for (int i = 0; i < countBelow; i++) {
        int n = i-countBelow/2;
        float xf = x+l*cos(thetaPerBranch*n+thetaOffset[i]);
        float yf = y+l*sin(thetaPerBranch*n+thetaOffset[i]);

        line(x, y, xf, yf);

        treesBelow[i].display();
      }
    }
  }

  public void setThetaPerBranch(float val) {
    thetaPerBranch = val;
  }
}
