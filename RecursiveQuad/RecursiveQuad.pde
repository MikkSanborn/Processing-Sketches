Quadrilateral T;
int count = 0;

float[][] pos = {{10, 400, 490, 100}, {50, 100, 440, 480}};

float num = 1;
float den = 1;

void setup() {
  size(500, 500);

  T = new Quadrilateral(pos[0][0], pos[1][0], pos[0][1], pos[1][1], pos[0][2], pos[1][2], pos[0][3], pos[1][3], count);
}

void draw() {
  background(0);

  T.display();
}

void mouseClicked() {
  count++;
  if (count <= 9) {
  T = new Quadrilateral(pos[0][0], pos[1][0], pos[0][1], pos[1][1], pos[0][2], pos[1][2], pos[0][3], pos[1][3], count);
  } 
  println(count);
}

void mouseWheel() {
  count = 0;
  T = new Quadrilateral(pos[0][0], pos[1][0], pos[0][1], pos[1][1], pos[0][2], pos[1][2], pos[0][3], pos[1][3], count);
  println(count);
}

void keyReleased() {
  if (key == '1') {
    pos[0][0] = mouseX;
    pos[1][0] = mouseY;
  T = new Quadrilateral(pos[0][0], pos[1][0], pos[0][1], pos[1][1], pos[0][2], pos[1][2], pos[0][3], pos[1][3], count);
  } else if (key == '2') {
    pos[0][1] = mouseX;
    pos[1][1] = mouseY;
  T = new Quadrilateral(pos[0][0], pos[1][0], pos[0][1], pos[1][1], pos[0][2], pos[1][2], pos[0][3], pos[1][3], count);
  } else if (key == '3') {
    pos[0][2] = mouseX;
    pos[1][2] = mouseY;
  T = new Quadrilateral(pos[0][0], pos[1][0], pos[0][1], pos[1][1], pos[0][2], pos[1][2], pos[0][3], pos[1][3], count);
  }
}

class Quadrilateral {
  float x1, y1, x2, y2, x3, y3, x4, y4;
  int level;

  Quadrilateral(float x1, float y1, float x2, float y2, float x3, float y3, float x4, float y4, int level) {
    this.x1 = x1;
    this.y1 = y1;
    this.x2 = x2;
    this.y2 = y2;
    this.x3 = x3;
    this.y3 = y3;
    this.x4 = x4;
    this.y4 = y4;
    this.level = level;
  }

  void display() {
    // if (level == 0) {
      noFill();
      strokeWeight(1);
      stroke(255);
      // stroke((x1+y2)/2*255.0/width, (y2+y3)/2*255.0/width, (x3+y1)/2*255.0/width);
      quad(x1, y1, x2, y2, x3, y3, x4, y4);
    // } else {
      drawSubQuadrilaterals();
    // }
  }

  void drawSubQuadrilaterals() {
    if (level > 0) {
      Quadrilateral q1 = new Quadrilateral((x1+x4)/2, (y1+y4)/2, num*(x1+x2+x3+x4)/(4*den), num*(y1+y2+y3+y4)/(4*den), (x1+x2)/2, (y1+y2)/2, x1, y1, level-1);
      Quadrilateral q2 = new Quadrilateral((x1+x2)/2, (y1+y2)/2, x2, y2, (x2+x3)/2, (y2+y3)/2, num*(x1+x2+x3+x4)/(4*den), num*(y1+y2+y3+y4)/(4*den), level-1);
      Quadrilateral q3 = new Quadrilateral((x2+x3)/2, (y2+y3)/2, x3, y3, (x3+x4)/2, (y3+y4)/2, num*(x1+x2+x3+x4)/(4*den), num*(y1+y2+y3+y4)/(4*den), level-1);
      Quadrilateral q4 = new Quadrilateral((x3+x4)/2, (y3+y4)/2, x4, y4, (x4+x1)/2, (y4+y1)/2, num*(x1+x2+x3+x4)/(4*den), num*(y1+y2+y3+y4)/(4*den), level-1);
      
      q1.display();
      q2.display();
      q3.display();
      // q4.display();
    }
  }
}
