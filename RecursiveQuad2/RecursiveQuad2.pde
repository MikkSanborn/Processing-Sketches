Quad Q;
int count = 0;

float[][] pos = {{10, 400, 490, 100}, {50, 100, 440, 480}};

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
  if (count <= 9) {
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
    // 0+0
    // 000

    //      C1:  C2:  C3:  C4:
    // R1: [11] [12] [13] [14]
    // R2: [21] [22] [23] [24]
    // R3: [31] [32] [33] [34]
    // R4: [41] [42] [43] [44]

    // 1  2  3  4
    // 5  6  7  8
    // 9  10 11 12
    // 13 14 15 16

    // [11] = {(x1+x1+x1)/3, (y1+y1+y1)/3}
    // [12] = {(x1+x1+x2)/3, (y1+y1+y1)/3}

    // [11] = {C1, R1}
    // [32] = {C2, R3}

    // X
    float p1x = (x1+x1+x1)/3;
    float p4x = (x2+x2+x2)/3;
    float p13x = (x4+x4+x4)/3;
    float p16x = (x3+x3+x3)/3;

    float p2x = (p1x+p1x+p4x)/3;
    float p3x = (p1x+p4x+p4x)/3;
    float p5x = (p1x+p1x+p13x)/3;
    float p9x = (p1x+p13x+p13x)/3;
    float p8x = (p4x+p4x+p16x)/3;
    float p12x = (p4x+p16x+p16x)/3;
    float p14x = (p13x+p13x+p16x)/3;
    float p15x = (p13x+p16x+p16x)/3;

    float p6x = (p5x+p5x+p8x)/3;
    float p7x = (p5x+p8x+p8x)/3;
    float p10x = (p9x+p9x+p12x)/3;
    float p11x = (p9x+p12x+p12x)/3;

    // Y
    float p1y = (y1+y1+y1)/3;
    float p4y = (y2+y2+y2)/3;
    float p13y = (y4+y4+y4)/3;
    float p16y = (y3+y3+y3)/3;

    float p2y = (p1y+p1y+p4y)/3;
    float p3y = (p1y+p4y+p4y)/3;
    float p5y = (p1y+p1y+p13y)/3;
    float p9y = (p1y+p13y+p13y)/3;
    float p8y = (p4y+p4y+p16y)/3;
    float p12y = (p4y+p16y+p16y)/3;
    float p14y = (p13y+p13y+p16y)/3;
    float p15y = (p13y+p16y+p16y)/3;

    float p6y = (p5y+p5y+p8y)/3;
    float p7y = (p5y+p8y+p8y)/3;
    float p10y = (p9y+p9y+p12y)/3;
    float p11y = (p9y+p12y+p12y)/3;

    // 1  2  3  4
    // 5  6  7  8
    // 9  10 11 12
    // 13 14 15 16

    Quad q1 = new Quad(p1x, p1y, p2x, p2y, p6x, p6y, p5x, p5y, level-1);
    Quad q2 = new Quad(p2x, p2y, p3x, p3y, p7x, p7y, p6x, p6y, level-1);
    Quad q3 = new Quad(p3x, p3y, p4x, p4y, p8x, p8y, p7x, p7y, level-1);
    Quad q4 = new Quad(p5x, p5y, p6x, p6y, p10x, p10y, p9x, p9y, level-1);
    Quad q5 = new Quad(p6x, p6y, p7x, p7y, p11x, p11y, p10x, p10y, level-1);
    Quad q6 = new Quad(p7x, p7y, p8x, p8y, p12x, p12y, p11x, p11y, level-1);
    Quad q7 = new Quad(p9x, p9y, p10x, p10y, p14x, p14y, p13x, p13y, level-1);
    Quad q8 = new Quad(p10x, p10y, p11x, p11y, p15x, p15y, p14x, p14y, level-1);
    Quad q9 = new Quad(p11x, p11y, p12x, p12y, p16x, p16y, p15x, p15y, level-1);

    // 1 2 3
    // 4 5 6
    // 7 8 9

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
