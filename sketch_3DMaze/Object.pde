// X1, Y1, Z1, X2, Y2, Z2
// col

public class Object {
  public float x1, y1, x2, y2;
  public int z1, z2;
  public color c;

  public Object(float x1, float y1, int z1, float x2, float y2, int z2, color c) {
    this.x1 = x1;
    this.y1 = y1;
    this.z1 = z1;
    this.x2 = x2;
    this.y2 = y2;
    this.z2 = z2;
    this.c = c;
  }

  public void display() {
    noStroke();
    fill(c);
    rect(x1, y1, x2, y2);
  }

  public void interact(Player playerIn) {
    // TO BE IMPLEMENTED
  }
}
