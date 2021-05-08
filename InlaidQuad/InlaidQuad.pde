InlaidQuad Q;

void setup() {
  size(500, 500);

  Q = new InlaidQuad(0, 0, 0, height, width, height, width, 0, 15);
  Q = new InlaidQuad(10, 10, 20, 387, 467, 468, 237, 23, 15);
}

void draw() {
  background(0);

  Q.display();
}

class InlaidQuad {
  float x1, y1, x2, y2, x3, y3, x4, y4;
  int level;

  InlaidQuad(float x1, float y1, float x2, float y2, float x3, float y3, float x4, float y4, int level) {
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
    strokeWeight(1);
    stroke(255);
    noFill();
    quad(x1, y1, x2, y2, x3, y3, x4, y4);
    if (level > 0) {
      displaySubQuads();
    }
  }

  void displaySubQuads() {
    InlaidQuad I = new InlaidQuad((x1+x2)/2, (y1+y2)/2, (x2+x3)/2, (y2+y3)/2, (x3+x4)/2, (y3+y4)/2, (x4+x1)/2, (y4+y1)/2, level-1);

    I.display();
  }
}
