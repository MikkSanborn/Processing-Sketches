class Button {
  protected float x, y, w, h;
  protected color stroke, fill;

  public Button(float x, float y, float w, float h, color stroke, color fill) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.stroke = stroke;
    this.fill = fill;
  }

  public void display() {
    strokeWeight(3);
    stroke(stroke);
    fill(fill);

    rect(x, y, w, h, 5);
  }

  public void display(color stroke, color fill) {
    strokeWeight(3);
    stroke(stroke);
    fill(fill);

    rect(x, y, w, h, 15);
  }

  public boolean hit() {
    return mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h;
  }

  public boolean hit(float x, float y) {
    return x > this.x && x < this.x+w && y > this.y && y < this.y+h;
  }

  public float getX() {
    return x;
  }

  public float getY() {
    return y;
  }

  public float getW() {
    return w;
  }

  public float getH() {
    return h;
  }

  public void setX(float x) {
    this.x = x;
  }

  public void setY(float y) {
    this.x = y;
  }

  public void setW(float w) {
    this.x = w;
  }

  public void setH(float h) {
    this.x = h;
  }
}

public class HitButton extends Button {
  public color hitFill;

  public HitButton(float x, float y, float w, float h, color stroke, color fill, color hitFill) {
    super(x, y, w, h, stroke, fill);
    this.hitFill = hitFill;
  }

  public void display() {
    strokeWeight(3);
    stroke(stroke);
    fill(hit() ? hitFill:fill);

    rect(x, y, w, h, 15);
  }

  public void display(float x, float y) {
    strokeWeight(3);
    stroke(stroke);
    fill(hit(x, y) ? hitFill:fill);

    rect(this.x, this.y, w, h, 15);
  }
}
