// X, Y, Z

public class Player {
  public float x, y;
  public int z;
  public int w, h;
  public color c;
  public float xs, ys; // theta to show directional heading?

  public Player() {
  }

  public void display() {
    noStroke();
    fill(c);
    rect(x-w/2, y-h/2, w, h);
  }

  public void move() {
    // only move if abs(xs) > Environment.frictionDragDeccel, to avoid moving back and forth repeatedly
    // change xs, ys proportional to distance from mouse to object, up to Env.plAccel
  }

  public void moveVert(int minZ, int maxZ) {
    if (keyCode == UP) {
      if (z < maxZ)
        z++;
    } else if (keyCode == DOWN) {
      if (z > minZ)
        z--;
    }
    // if key == [UP || DOWN]
  }

  public void moveTo(float x, float y, int z) {
    this.x = x;
    this.y = y;
    this.z = z;
  }
}
