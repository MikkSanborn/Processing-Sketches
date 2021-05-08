float x = 200;
float y = 200;
float xs = 0;
float ys = 0;
float g = 9.8/30; // units/frame > 60 fps (9.8 u/s) positive 9.8, because the y direction is positive in processing
float r = 40;
float d = 2;

color c;

void setup() {
  size(1960, 1080);

  noStroke();
  background(0);

  c = color(random(255), random(255), random(255));
}

void draw() {
  fill(0, 0, 0, 20);
  rect(-2, -2, width+4, height+4);

  fill(255);
  rect(0, height-100, width, 100);

  fill(c);
  ellipse(x, y, r, r);

  x+=xs; // move
  y+=ys;

  ys+=g; // grav

  if (y+r/2 > height-100) {
    ys*=-1;
    ys+=g;
  }

  if (x+r/2 > width && xs > 0) {
    xs*=-.95;
    c = color(random(255), random(255), random(255));
  }
  if (x-r/2 < 0 && xs < 0) {
    xs*=-.95;
    c = color(random(255), random(255), random(255));
  }

  if (keyPressed && keyCode == LEFT) {
    xs-=0.2;
  }
  if (keyPressed && keyCode == RIGHT) {
    xs+=0.2;
  }

  if (keyPressed && key == 'M' && mousePressed) {
    xs = 0;
    ys = 0;
    key = 'm'; // calls the rest
  }

  if (keyPressed && key == 'm' && mousePressed) {
    x = mouseX;
    y = mouseY;

    ys-=g; // to prevent speed multiplying
    xs = 0;
  }
  if (keyPressed && key == 'g' && g > 1.1/60) {
    g-=1.0/30;
  }
  if (keyPressed && key == 'G' && g < 2) {
    g+=1.0/30;
  }
}
