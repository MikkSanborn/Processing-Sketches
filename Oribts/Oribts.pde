final float G = 9.8;

boolean checkCollision = true;

ArrayList<Object> p = new ArrayList<Object>();

void setup() {
  size(800, 800);
  frameRate(120);

  background(0);
  // new Object(x, y, xs, ys, r, m, color);
  p.add(new Object(400, 400, 0, 0, 50, 1000, color(150, 255, 40), true));
  p.add(new Object(-10, -8, 10.5, .5, 10, 20, color(30, 240, 126), true));
}

void draw() {
  // background(0);
  fill(0, 40);
  rect(-10, -10, width+20, height+20);

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

  short d = (short) (o2.x > o1.x ? -1:1);

  if (!checkCollision || (dist(o1.x, o1.y, o2.x, o2.y) > o1.r+o2.r)) {
    o1.xs+=x*a1*-d;
    o1.ys+=y*a1*-d;
    o2.xs+=x*a2*d;
    o2.ys+=y*a2*d;
  } else {
    o1.display(color(255));
    o2.display(color(255));
  }
}

void mouseClicked() {
  p.clear();
  p.add(new Object(400, 400, 0, 0, 50, 1000, color(150, 255, 40), true));
  p.add(new Object(-10, -8, 10.5, .5, 10, 20, color(30, 240, 126), true));
}

void keyReleased() {
  if (key == 'n') {
    p.add(new Object(mouseX, mouseY, 0, 0, 20, 50, color(170, 150, 230), true));
  } else if (key == 'c') {
    p.clear();
  } else if (key == '1') {
    p.add(new Object(mouseX, mouseY, 1, 0, 20, 50, color(255, 255, 0), true));
  } else if (key == '2') {
    p.add(new Object(mouseX, mouseY, -1, 0, 20, 50, color(255, 0, 255), true));
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
  }
}
