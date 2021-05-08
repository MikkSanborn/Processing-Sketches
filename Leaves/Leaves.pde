PImage[] LeafImages;
Leaf[] leaves;

float w = 20;

void setup() {
  size(500, 500);

  LeafImages = new PImage[3];
  LeafImages[0] = loadImage("leaf1.png");
  LeafImages[1] = loadImage("leaf2.png");
  LeafImages[2] = loadImage("leaf3.png");

  leaves = new Leaf[120];

  for (int i = 0; i < leaves.length; i++) {
    leaves[i] = new Leaf();
  }
}

void draw() {
  background(0);


  for (int i = 0; i < leaves.length; i++) {
    leaves[i].display();
    leaves[i].move();
  }
}

void mouseClicked() {
  for (int i = 0; i < leaves.length; i++) {
    leaves[i] = new Leaf();
  }
}

public class Leaf {
  private float x, y;
  private float xs, ys;
  private byte imageIndex;
  private float t;

  public Leaf() {
    x = random(-width/2, width);
    y = random(0, height);
    xs = random(1, 5);
    ys = random(-.1, -1);
    imageIndex = (byte) (int) random(0, 3);
    t = random(0, TWO_PI);
  }

  void display() {
    pushMatrix();
    translate(x, y);
    rotate(t);
    image(LeafImages[imageIndex], -w/2, -w/2, w, w);
    popMatrix();
  }

  void move() {
    xs+=random(-0.1, 0.1);
    ys+=random(-0.1, 0.1);
    x+=xs;
    y+=ys;
    t+=(xs+sqrt(abs(ys)))/16.0;
  }
}
