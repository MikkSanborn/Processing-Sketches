Triangle T;
int count = 0;

float[][] pos = {{10, 250, 490}, {490, 10, 490}};

void setup() {
  size(500, 500);

  T = new Triangle(pos[0][0], pos[1][0], pos[0][1], pos[1][1], pos[0][2], pos[1][2], count);
}

void draw() {
  background(0);

  T.display();
}

void mouseClicked() {
  count++;
  if (count <= 9) {
    T = new Triangle(pos[0][0], pos[1][0], pos[0][1], pos[1][1], pos[0][2], pos[1][2], count);
  } 
  println(count);
}

void mouseWheel() {
  count = 0;
  T = new Triangle(pos[0][0], pos[1][0], pos[0][1], pos[1][1], pos[0][2], pos[1][2], count);
  println(count);
}

void keyReleased() {
  if (key == '1') {
    pos[0][0] = mouseX;
    pos[1][0] = mouseY;
    T = new Triangle(pos[0][0], pos[1][0], pos[0][1], pos[1][1], pos[0][2], pos[1][2], count);
  } else if (key == '2') {
    pos[0][1] = mouseX;
    pos[1][1] = mouseY;
    T = new Triangle(pos[0][0], pos[1][0], pos[0][1], pos[1][1], pos[0][2], pos[1][2], count);
  } else if (key == '3') {
    pos[0][2] = mouseX;
    pos[1][2] = mouseY;
    T = new Triangle(pos[0][0], pos[1][0], pos[0][1], pos[1][1], pos[0][2], pos[1][2], count);
  }
}

class Triangle {
  float x1, y1, x2, y2, x3, y3;
  int level;

  Triangle(float x1, float y1, float x2, float y2, float x3, float y3, int level) {
    this.x1 = x1;
    this.y1 = y1;
    this.x2 = x2;
    this.y2 = y2;
    this.x3 = x3;
    this.y3 = y3;
    this.level = level;
  }

  void display() {
    if (level == 0) {
      fill(0);
      strokeWeight(1);
      stroke(255);
      stroke((x1+y2)/2*255.0/width, (y2+y3)/2*255.0/width, (x3+y1)/2*255.0/width);
      triangle(x1, y1, x2, y2, x3, y3);
    } else {
      drawSubTriangles();
    }
  }

  void drawSubTriangles() {
    if (level > 0) {
      Triangle t1 = new Triangle(x1, y1, (x1+x2)/2, (y1+y2)/2, (x3+x1)/2, (y3+y1)/2, level-1);
      Triangle t2 = new Triangle((x1+x2)/2, (y1+y2)/2, x2, y2, (x3+x2)/2, (y3+y2)/2, level-1);
      Triangle t3 = new Triangle((x1+x3)/2, (y1+y3)/2, (x2+x3)/2, (y2+y3)/2, x3, y3, level-1);

      t1.display();
      t2.display();
      t3.display();
    }
  }
}
