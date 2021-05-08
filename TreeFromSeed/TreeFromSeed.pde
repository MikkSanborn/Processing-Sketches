// fancy tree based on seed. do something so branchCount = seed%1000/10 or something.
Tree tree;

// #834A14

String in = "-46954";
int seed;

void setup() {
  size(500, 500);

  try {
    seed = Integer.parseInt(in);
  }
  catch (NumberFormatException e) {
    seed = Short.MAX_VALUE;

    for (int i = 0; i < in.length(); i++) {
      seed += in.charAt(i);
      seed <<= 1;
    }

    seed*=in.length();
  } 
  catch (NullPointerException n) {
    seed = 0;
  }

  if (seed == 0) {
    seed = 341023;
  }
  
  tree = new Tree(seed, width/2, height-50, width/2-seed%12*25, height-50-((int) Math.abs(seed%9.8)*25));

  println(seed);
}

void draw() {
  background(255);

  tree.display();
}

void keyReleased() {
  seed = (int) random(-100000, 100000);
  
  tree = new Tree(seed, width/2, height-50, width/2-seed%7*17, height-50-((int) Math.abs(seed%9.31)*23));

  println(seed);
}

void mouseClicked() {
  println(mouseX, mouseY);
}

class Tree {
  int x1, y1, x2, y2;
  int seed;
  Branch[] branches;

  Tree (int seed, int x1, int y1, int x2, int y2) {
    this.seed = seed;
    this.x1 = x1;
    this.y1 = y1;
    this.x2 = x2;
    this.y2 = y2;
    
    println("Tree: " + x1 + "   " + y1 + "   " + x2 + "   " + y2);

    branches = new Branch[(int) Math.abs(seed%6+2)];

    for (int i = 0; i < branches.length; i++) {
      float M = 1.0*(y2-y1)/(x2-x1);
      int xR = (int) ((seed/6)%Math.abs(x1-x2-.5)+(x1 > x2 ? x2:x1));
      int yR = (int) (M*xR+(y1-M*x1));
      yR =  (int) (M*xR+(y1-M*x1));
      branches[i] = new Branch(seed-(i*i), (int) Math.abs(seed*i/branches.length)%4, xR, yR, (int) (xR+((seed/321)%16+8)*cos(seed%20/PI)), (int) (yR+(seed/4)%17+8*sin(seed%19/PI)));
    }// y = mx+b  // b = y-m*x
    /*
    
    120 -- 230
    
    */
  }

  void display() {
    fill(80, 13, 9);
    stroke(#834A14);
    strokeWeight(5);
    
    line(x1, y1, x2, y2);
    text("P1", x1, y1-4);
    text("P2", x2, y2-4);
    
    for (int i = 0; i < branches.length; i++) {
      branches[i].display();
    }
  }
}

class Branch {
  Branch[] branches;
  int seed;
  int level; // set in constructor based on seed.
  int x1, y1, x2, y2;

  Branch(int seed, int level, int x1, int y1, int x2, int y2) {
    this.seed = seed;
    this.level = level;
    this.x1 = x1;
    this.y1 = y1;
    this.x2 = x2;
    this.y2 = y2;

    if (level > 0) {
      branches = new Branch[(int) Math.abs(seed%6+2)];

      for (int i = 0; i < branches.length; i++) {
        branches[i] = new Branch(seed-(i*i), level-1, 0, 0, 0, 0);
      }
    } else if (level < 0) {
      println("Nope");
    }
  }

  void display() {
    fill(80, 13, 9);
    stroke(#834A14);
    strokeWeight(5);
    
    line(x1, y1, x2, y2);
    text("P1", x1, y1-4);
    text("P2", x2, y2-4);
    
    // println("Branch: " + x1 + "   " + y1 + "   " + x2 + "   " + y2);
    
    /*
    for (int i = 0; i < branches.length; i++) {
      branches[i].display();
    }
    */
  }
}
