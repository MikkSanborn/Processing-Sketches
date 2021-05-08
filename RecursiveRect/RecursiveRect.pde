Quad Q;
int count = 0;

float[][] pos = {{0, 500, 500, 0}, {0, 0, 500, 500}};

void setup() {
  size(500, 500);

  Q = new Quad(pos[0][0], pos[1][0], pos[0][1], pos[1][1], pos[0][2], pos[1][2], pos[0][3], pos[1][3], count);
}

void draw() {
  background(0);

  Q.display();
}

void mouseClicked() {
  count++;
  if (count <= 7) {
  Q = new Quad(pos[0][0], pos[1][0], pos[0][1], pos[1][1], pos[0][2], pos[1][2], pos[0][3], pos[1][3], count);
  } 
  println(count);
}

void mouseWheel() {
  count = 0;
  Q = new Quad(pos[0][0], pos[1][0], pos[0][1], pos[1][1], pos[0][2], pos[1][2], pos[0][3], pos[1][3], count);
  println(count);
}

class Quad {
  float x1, y1, x2, y2, x3, y3, x4, y4;
  int level;

  Quad(float x1, float y1, float x2, float y2, float x3, float y3, float x4, float y4, int level) {
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
    noFill();
    strokeWeight(1);
    stroke(255);
    quad(x1, y1, x2, y2, x3, y3, x4, y4);
    if (level > 0) {
      displaySubQuads();
    }
  }

  void displaySubQuads() {
    // 000
    // 0-0
    // 000
    
    float C1 = x1; // (x1+x1+x1)/3
    float C2 = (x1+x1+x3)/3; // as it is
    float C3 = (x1+x3+x3)/3; // as it is
    float C4 = x3; // (x2+x2+x2)/3
    
    float R1 = y1; // (y1+y1+y1)/3
    float R2 = (y1+y1+y3)/3; // as it is
    float R3 = (y1+y3+y3)/3; // as it is
    float R4 = y3; // (y2+y2+y2)/3
    
    // [11] = {(x1+x1+x1)/3, (y1+y1+y1)/3}
    // [12] = {(x1+x1+x2)/3, (y1+y1+y1)/3}
    
    // [11] = {C1, R1}
    // [32] = {C2, R3}
    
    //      C1:  C2:  C3:  C4:
    // R1: [11] [12] [13] [14]
    // R2: [21] [22] [23] [24]
    // R3: [31] [32] [33] [34]
    // R4: [41] [42] [43] [44]
    
    Quad q1 = new Quad(C1, R1, C2, R1, C2, R2, C1, R2, level-1);
    Quad q2 = new Quad(C2, R1, C3, R1, C3, R2, C2, R2, level-1);
    Quad q3 = new Quad(C3, R1, C4, R1, C4, R2, C3, R2, level-1);
    
    Quad q4 = new Quad(C1, R2, C2, R2, C2, R3, C1, R3, level-1);
    // Quad q5 = new Quad("");
    Quad q6 = new Quad(C3, R2, C4, R2, C4, R3, C3, R3, level-1);
    
    Quad q7 = new Quad(C1, R3, C2, R3, C2, R4, C1, R4, level-1);
    Quad q8 = new Quad(C2, R3, C3, R3, C3, R4, C2, R4, level-1);
    Quad q9 = new Quad(C3, R3, C4, R3, C4, R4, C3, R4, level-1);
    
    q1.display();
    q2.display();
    q3.display();
    q4.display();
    // q5.display();
    q6.display();
    q7.display();
    q8.display();
    q9.display();
  }
}
