Branch B;

float branchScale = 0.95;

void setup() {
  size(500, 500);

  B = new Branch(width/2, height-20, 450, 200, -100, 1, 8);
}

void draw() {
  background(0);
  B = new Branch(width/2, height-100, 20, 180, -360.0*mouseX/width-180, 1, 100);

  B.draw();
}

class Branch {
  float xBase, yBase;
  float l;
  float thetaBase, thetaOffPerBranch;
  int branchCount;
  int level;

  Branch(float xBase, float yBase, float l, float thetaBase, float thetaOffPerBranch, int branchCount, int level) {
    this.xBase = xBase;
    this.yBase = yBase;
    this.l = l;
    this.thetaBase = thetaBase;
    this.thetaOffPerBranch = thetaOffPerBranch;
    this.branchCount = branchCount;
    this.level = level;
  }

  void draw() {
    noFill();
    strokeWeight(3);
    stroke(255);

    pushMatrix();
    translate(xBase, yBase);
    rotate(radians(thetaBase));
    line(0, 0, 0, l);
    popMatrix();
    drawChildren();
  }

  void drawChildren() {
    if (level > 0) {
      Branch[] branches = new Branch[branchCount];
      for (int i = 0; i < branchCount; i++) {
        //  CONSTRUCTOR : Branch( xBase,                                              yBase,                                               l,               thetaBase,              thetaOffPerBranch, branchCount, level  );
        branches[i] = new Branch((i+1.0)*l*cos(radians(thetaBase+90))/branchCount+xBase, (i+1.0)*l*sin(radians(thetaBase+90))/branchCount+yBase, l*branchScale, thetaBase+thetaOffPerBranch, thetaOffPerBranch, branchCount, level-1);
        branches[i].draw();
      }
    }
  }

  void drawSubBranched() {
  }
}
