ArrayList<Position> Points = new ArrayList<Position>();

void setup() {
  size(500, 500);

  noFill();
}

void draw() {
  background(0);

  stroke(255);
  strokeWeight(1);
  line(0, 0, width, height);

  for (int i = 0; i < Points.size()-3; i++) {
    strokeWeight(3);
    point(Points.get(i).getX(), Points.get(i).getY());
    point(Points.get(i+1).getX(), Points.get(i+1).getY());
    point(Points.get(i+2).getX(), Points.get(i+2).getY());

    strokeWeight(1);
    triangle(Points.get(i).getX(), Points.get(i).getY(), Points.get(i+1).getX(), Points.get(i+1).getY(), Points.get(i+2).getX(), Points.get(i+2).getY());
    triangle(Points.get(i).getY(), Points.get(i).getX(), Points.get(i+1).getY(), Points.get(i+1).getX(), Points.get(i+2).getY(), Points.get(i+2).getX());
  }

  if (mousePressed) {
    Points.add(new Position(mouseX, mouseY));
  }

  if (Points.size() > 0 && frameCount % 5 == 0) {
    Points.remove(0);
  }

  if (keyPressed && key == ' ') {
    Points.clear();
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
