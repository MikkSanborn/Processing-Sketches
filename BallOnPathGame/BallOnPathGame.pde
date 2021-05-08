int[] pathPos = new int[11]; // values can be: {1 - 10}, 0-50, 50-100, 100-150, etc. (exclude 10)
int x, y, r; // r is actually diameter
float yo; // path y-offset
float mi; // movement index
int si;

void setup() {
  size(500, 500);

  for (int i = 0; i < pathPos.length; i++) {
    pathPos[i] = 5;
  }

  x = 250;
  y = 250;
  r = 25;
  si = r;

  yo = 0;
  mi = 1;
}

void draw() {
  background(0);

  strokeWeight(1);
  stroke(0);
  fill(255, 120, 25);
  for (int i = 0; i < pathPos.length; i++) {
    rect(pathPos[i]*width/10, (i-1)*50+yo, 50, 50);
    fill(120, 255, 255);
  }
  stroke(255, 0, 120);
  for (int i = 0; i < 10; i++) {
    line(50*i, 0, 50*i, height);
  }
  noStroke();
  fill(0, 0, 255);
  ellipse(x, y, r, r);

  if (keyPressed && keyCode == LEFT) {
    x-=mi*1.5;
  }
  if (keyPressed && keyCode == RIGHT) {
    x+=mi*1.5;
  }
  if (x > width) {
    x = width;
  }
  if (x < 0) {
    x = 0;
  }
  fall();
  modifyR();

  yo+=mi;
  if (yo/50 > 1) {
    yo = 0;
    for (int i = pathPos.length-1; i > 0; i--) {
      pathPos[i] = pathPos[i-1];
    } // 1 = 0, 2 = 1, 3 = 2, 4 = 3, 5 = 4, 6 = 5, 7 = 6, 8 = 7, 9 = 8, 10 = 9, 11 = 10, 0 = new
    pathPos[0] += (int) random(-2, 2); // -1.9 <> 1.9 (truncates)
    if (pathPos[0] > 9) {
      pathPos[0] = 9;
    }
    if (pathPos[0] < 0) {
      pathPos[0] = 0;
    }
  }
  // noLoop();
  mi*=1.0025;
}

void fall() {
  boolean onOne = false;
  // check 4, 5, 6
  for (int i = 4; i <= 6; i++) {
    if (x+r/2 > pathPos[i]*width/10 && x-r/2 < pathPos[i]*width/10+50 && y+r/2 > (i-1)*50+yo && y-r/2 < (i-1)*50+yo+50) {
      onOne = true;
    }
  }
  
  if (!onOne) {
    si = 26;
    mi = 1;
  }
}

void modifyR() {
  if (si > 25 && si%2==0) {
    si+=2;
  }
  if (si > 25 && si%2!=0) {
    si-=2;
  }
  if (si > 52) {
    si--;
  }
  r = si;
}
