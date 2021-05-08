final float G = 9.8;

boolean checkCollision = true;

boolean showMagnitude = true;

boolean wrapWalls = false; // errors when true...

boolean fades = false;

ArrayList<Object> p = new ArrayList<Object>();

void setup() {
  size(800, 800);
  frameRate(120);

  background(0);
}

void draw() {
  if (fades) {
    fill(0, 35);
    rect(-10, -10, width+20, height+20);
  } else {
    background(0);
  }

  for (int i = 0; i < p.size(); i++) {
    p.get(i).display();

    for (int j = 0; j < p.size(); j++) {
      if (i!=j) {
        gravitate(p.get(i), p.get(j));
      }
    }

    p.get(i).move();
  }
}

void gravitate(Object o1, Object o2) {
  float F = G*o1.m*o2.m/(sq(dist(o1.x, o1.y, o2.x, o2.y)));
  float m = 0;

  try {
    m = (o1.y-o2.y)/(o1.x-o2.x);
  } 
  catch (ArithmeticException e) {
  }

  float a1 = (float) (F/o1.m);
  float a2 = (float) (F/o2.m);
  float x = F*sqrt(1/(1+sq(m)));
  float y = m*x;

  short d = (short) -(o2.x > o1.x ? -1:1);

  if (!checkCollision || (dist(o1.x, o1.y, o2.x, o2.y) > o1.r+o2.r)) {
    o1.xs+=x*a1*-d;
    o1.ys+=y*a1*-d;
    o2.xs+=x*a2*d;
    o2.ys+=y*a2*d;
  } else {
    o1.display(color(255));
    o2.display(color(255));
  }

  if (showMagnitude) {
    strokeWeight(3);
    stroke(F*30, F*15, 255-F*20);
    line(o1.x, o1.y, o2.x, o2.y);
  }
}

void mouseClicked() {
  p.clear();
}

void keyReleased() {
  if (key == 'n') {
    p.add(new Object(mouseX, mouseY, 0, 0, 25, 250, color(170, 150, 230), true));
  } else if (key == 'c') {
    p.clear();
  } else if (key == '1') {
    p.add(new Object(mouseX, mouseY, 1, 0, 20, 50, color(255, 255, 0), true));
  } else if (key == '2') {
    p.add(new Object(mouseX, mouseY, -1, 0, 20, -50, color(255, 0, 255), true));
  } else if (key == '3') {
    p.add(new Object(mouseX, mouseY, 0, 1, 20, 50, color(0, 255, 255), true));
  } else if (key == '4') {
    p.add(new Object(mouseX, mouseY, 0, -1, 20, 50, color(255, 0, 0), true));
  }
}

class Object {
  float x, y;
  float r, m;
  float xs, ys;
  color c;

  boolean moveable;

  Object (float x, float y, float xs, float ys, float r, float m, color c, boolean isMoveable) {
    this.x = x;
    this.y = y;
    this.xs = xs;
    this.ys = ys;
    this.r = r;
    this.m = m;
    this.c = c;
    this.moveable = isMoveable;
  }

  void display() {
    display(c);
  }

  void display(color C) {
    noStroke();
    strokeWeight(1);
    stroke(0, 0, 0, 20);
    fill(C);
    ellipse(x, y, 2*r, 2*r);
  }

  void move() {
    if (moveable) {
      x+=xs;
      y+=ys;
    }

    if (!wrapWalls) {
      if (x-r < 0 || x+r > width) {
        xs*=-1;
        x+=xs;
      }
      if (y-r < 0 || y+r > height) {
        ys*=-1;
        y+=ys;
      }
    } else {
      if (x-r < 0 || x+r > width) {
        x = (x > width/2 ? 0:width);
        x+=2*xs;
      }
      if (y-r < 0 || y+r > height) {
        y = (y > height/2 ? 0:height);
        y+=2*ys;
      }
    }
  }
}
