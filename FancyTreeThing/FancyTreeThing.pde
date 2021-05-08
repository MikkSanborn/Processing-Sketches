// new FancyTree(x, y, l, thetaBase, lReduction, thetaPerBranch, thetaOffsetRange, countBelow, level)
FancyTree Tree1 = new FancyTree(250, 250, 100, 90, 2.25, 90, 0, 3, 6);
color C = color(90, 120, 235, 120);

void setup() {
  size(500, 500);
}

void draw() {
  background(0);

  // new FancyTree(250, 250, 100, 0, 2.25, 360*mouseX/width, 0, 11, 4).display();
  new FancyTree(250, 250, 100, 0, 2.5, 360*mouseX/width, 0, 7, 4).display();
}

void mouseClicked() {
  Tree1 = new FancyTree(250, 250, 100, 0, 2.25, 25, 0, 9, 4);
}
