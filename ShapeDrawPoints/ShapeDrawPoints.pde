int count = 25;
float r = 100;
Point c;
ArrayList<Point> list;
int displayCount = 0;
boolean centerLine = false;
boolean outerLine = true;

void setup() {
  size(500, 500);

  c = new Point(width/2, height/2);
  list = new ArrayList<Point>();

  for (int i = 0; i < count; i++) {
    list.add(new Point(r*cos(TWO_PI/(count-1)*i)+c.x, r*sin(TWO_PI/(count-1)*i)+c.y));
  }

  stroke(0);
  strokeWeight(3);
  noFill();
}

void draw() {
  background(255);

  strokeWeight(5);
  point(c.x, c.y);

  for (int i = 0; i < displayCount; i++) {
    strokeWeight(5);
    point(list.get(i).x, list.get(i).y);

    strokeWeight(3);
    if (centerLine)
      line(list.get(i).x, list.get(i).y, c.x, c.y);
    
    if (outerLine && i+1 < displayCount) {
      line(list.get(i).x, list.get(i).y, list.get(i+1).x, list.get(i+1).y);
    } /* else if (outerLine && i+1 == displayCount && displayCount == count) {
     line(list.get(i).x, list.get(i).y, list.get(0).x, list.get(0).y);
     } */
  }

  if (keyPressed && key == ' ') {
    displayCount++;
    if (displayCount > count) {
      displayCount = 0;
    }
  }
}

void mouseClicked() {
  displayCount++;
  if (displayCount > count) {
    displayCount = 0;
  }
}

class Point {
  float x, y;

  Point(float x, float y) {
    this.x = x;
    this.y = y;
  }

  float getX() {
    return x;
  }

  float getY() {
    return y;
  }

  void setX(float x) {
    this.x = x;
  }

  void setY(float y) {
    this.y = y;
  }
}
