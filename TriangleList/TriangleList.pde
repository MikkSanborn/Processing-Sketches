ArrayList<Position> Points = new ArrayList<Position>();

void setup() {
  size(500, 500);

  noFill();
}

void draw() {
  background(0);

  stroke(255);
  strokeWeight(1);

  for (int i = 0; i < Points.size(); i++) {
    for (int j = 0; j < Points.size(); j++) {
      for (int k = 0; k < Points.size(); k++) {
        strokeWeight(3);
        point(Points.get(i).getX(), Points.get(i).getY());
        point(Points.get(j).getX(), Points.get(j).getY());
        point(Points.get(k).getX(), Points.get(k).getY());

        strokeWeight(1);
        triangle(Points.get(i).getX(), Points.get(i).getY(), Points.get(j).getX(), Points.get(j).getY(), Points.get(k).getX(), Points.get(k).getY());
      }
    }
  }

  if (mousePressed) {
    Points.add(new Position(mouseX, mouseY));
  }

  if (Points.size() > 0 && frameCount % 5 == 0) {
    Points.remove(0);
  }
}

class Position {
  float x, y;

  Position(float x, float y) {
    this.x = x;
    this.y = y;
  }

  float getX() {
    return x;
  }

  float getY() {
    return y;
  }
}
