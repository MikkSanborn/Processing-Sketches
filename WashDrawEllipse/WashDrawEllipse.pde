float a = 250;
float b = 250;
float c = 8;
float d = 4;
float e = 500;

int drawW = 1;
int drawH = 250;

int x = 0;
int y = 0;

void setup() {
  size(500, 500);
  frameRate(200);

  strokeWeight(1);
  stroke(255);
  background(200, 160, 70);
}

void draw() {
  for (int X = x; X < x+drawW; X++) {
    for (int Y = y; Y < y+drawH; Y++) {
      if ((int) ((sq(X-a)/sq(c))+(sq(Y-b)/sq(d))) == (int) (e)) {
        stroke(255);
      } else {
        stroke(0);
      }
      point(X, Y);
    }
  }

  x+=drawW;
  if (x > width) {
    x%=width;
    x-=drawW;
    y+=drawH;
  }
  if (y > height) {
    y%=height;
  }
}
