boolean[] lightOn = new boolean[3]; // R, G, B

float lightSize = 50;

float bgLight = 0;

Object[] o = new Object[10];

void setup() {
  size(500, 800);

  lightOn[0] = true; // RED
  lightOn[1] = true; // GREEN
  lightOn[2] = true; // BLUE

  o[0] = new Ellipse(100, 100, 50, 50, 255, 255, 0);
  o[1] = new Rectangle(250, 250, 200, 100, 125, 210, 63);
  // o[2] = new Rectangle(0, lightSize, lightSize/2, (height-2*lightSize)/3, 255, 0, 0);
  // o[3] = new Rectangle(0, lightSize+(height-2*lightSize)/3, lightSize/2, (height-2*lightSize)/3, 0, 255, 0);
  // o[4] = new Rectangle(0, lightSize+2*(height-2*lightSize)/3, lightSize/2, (height-2*lightSize)/3, 0, 0, 255);
  o[5] = new Ellipse(width/3, height-100, 100, 150, 106, 173, 243);
  o[6] = new Rectangle(300, 543, 62, 51, 220, 62, 173);
}

void draw() {
  background((lightOn[0] ? bgLight:0), (lightOn[1] ? bgLight:0), (lightOn[2] ? bgLight:0));
  // background(0);
  
  // lights
  strokeWeight(1);
  stroke(122.5);
  fill((lightOn[0] ? 255:122.5), 0, 0);
  rect(0, 0, lightSize, lightSize);
  fill(0, (lightOn[1] ? 255:122.5), 0);
  rect(width-lightSize, 0, lightSize, lightSize);
  fill(0, 0, (lightOn[2] ? 255:122.5));
  rect(width-lightSize, height-lightSize, lightSize, lightSize);
  fill((lightOn[0] ? 255:0), (lightOn[1] ? 255:0), (lightOn[2] ? 255:0));
  rect(0, height-lightSize, lightSize, lightSize);

  // objects
  for (int i = 0; i < o.length; i++) {
    try {
      o[i].display((lightOn[0] ? o[i].getR():0), (lightOn[1] ? o[i].getG():0), (lightOn[2] ? o[i].getB():0));
    } 
    catch (NullPointerException e) {
    }
  }
}

void mouseClicked() {
  if (mouseX < lightSize && mouseY < lightSize) {
    lightOn[0] = !lightOn[0];
  } else if (mouseX > width-lightSize && mouseY < lightSize) {
    lightOn[1] = !lightOn[1];
  } else if (mouseX > width-lightSize && mouseY > height-lightSize) {
    lightOn[2] = !lightOn[2];
  }
}

public abstract class Object {
  protected float x, y, w, h;
  protected float R, G, B;

  Object(float x, float y, float w, float h, float R, float G, float B) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.R = R;
    this.G = G;
    this.B = B;
  }

  public abstract void display(float r, float g, float b);

  public float getR() {
    return R;
  }

  public float getG() {
    return G;
  }

  public float getB() {
    return B;
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
}

public class Ellipse extends Object {
  Ellipse(float x, float y, float w, float h, float R, float G, float B) {
    super(x, y, w, h, R, G, B);
  }

  public void display(float r, float g, float b) {
    stroke(255);
    fill(r, g, b);
    ellipse(x, y, w, h);
  }
}

public class Rectangle extends Object {
  Rectangle(float x, float y, float w, float h, float R, float G, float B) {
    super(x, y, w, h, R, G, B);
  }

  public void display(float r, float g, float b) {
    stroke(255);
    fill(r, g, b);
    rect(x, y, w, h);
  }
}
