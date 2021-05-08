PolygonHitbox p1;
PolygonHitbox p2;

float theta = 0;

void setup() {
  size(500, 500);

  p1 = new PolygonHitbox(150-width/2, 134-height/2, 200-width/2, 12-height/2, 200-width/2, 200-height/2, 20-width/2, 210-height/2);
  p2 = new PolygonHitbox(random(-width/2, width/2), random(-height/2, height/2), random(-width/2, width/2), random(-height/2, height/2), random(-width/2, width/2), random(-height/2, height/2), random(-width/2, width/2), random(-height/2, height/2), random(-width/2, width/2), random(-height/2, height/2));
}

void draw() {
  pushMatrix();
  translate(width/2, height/2);
  rotate(theta);
  // p1.findPointsInside();
  p2.findPointsInside();
  background(0);

  /*
  p1.display(color(255));
   p1.hit(mouseX, mouseY);
   */


  p2.display(color(255));
  p2.hit(mouseX, mouseY);


  // theta+=0.002;
  popMatrix();
}


class PolygonHitbox {
  int vertecies;

  float[] x;
  float[]y;

  boolean[][] isInside;

  boolean hit;

  PolygonHitbox(float x0, float y0, float x1, float y1, float x2, float y2, float... points) {
    vertecies = points.length/2+3;

    x = new float[vertecies];
    y = new float[vertecies];

    isInside = new boolean[width][height];

    x[0] = x0;
    y[0] = y0;
    x[1] = x1;
    y[1] = y1;
    x[2] = x2;
    y[2] = y2;

    if (points.length%2 != 0) {
      throw new IllegalArgumentException("Incmplete Point(s) detected");
    }

    for (int i = 0; i < points.length; i++) {
      if (i%2 == 0) {
        x[i/2+3] = points[i];
      } else if (i%2 == 1) {
        y[i/2+3] = points[i];
      }
    }

    findPointsInside();
  }

  void findPointsInside() {
    loadPixels();
    updatePixels();
    background(0);
    display(color(255));

    loadPixels();

    for (int i = 0; i < width*height; i++) {
      if (pixels[i] != color(0)) {
        isInside[i%width][i/width] = true;
      } else {
        isInside[i%width][i/width] = false;
      }
    }
  }

  void display(color c) {
    strokeWeight(1);
    stroke(0);
    fill(c);
    beginShape();
    for (int i = 0; i < vertecies; i++) {
      vertex(x[i], y[i]);
    }
    endShape(CLOSE);
  }

  boolean hit(int x, int y) {
    hit = isInside[x][y];
    display((hit ? color(200):color(255)));
    return hit;
  }
}

void mouseClicked() {
  p2 = new PolygonHitbox(random(-width/2, width/2), random(-height/2, height/2), random(-width/2, width/2), random(-height/2, height/2), random(-width/2, width/2), random(-height/2, height/2), random(-width/2, width/2), random(-height/2, height/2), random(-width/2, width/2), random(-height/2, height/2));
  p2.findPointsInside();
}
