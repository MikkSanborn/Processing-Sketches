class BounceTriangle {
  float xpos;
  float ypos;
  float w;
  float h;
  float l;
  float x;
  float y;
  float m;
  float b;
  Boolean onBox;
  int trinum;
  float mSI; // movementSpeedIndex
  float bDiff;

  BounceTriangle(float xpost, float ypost, float wt, float ht, int trinumt) {
    xpos = xpost;
    ypos = ypost;
    w = wt;
    h = ht;
    trinum = trinumt;
  }

  void display() {
    fill(270, 80, 100, 50);
    stroke(0, 0, 0);
    strokeWeight(1);
    triangle(xpos, ypos, xpos+w, ypos, xpos, ypos+h);

    strokeWeight(5);
    stroke(180, 90, 90);
  }

  void use() {
    bDiff = 0;
    strokeWeight(1);
    stroke(0, 0, 0);
    x = bmain.xpos;
    y = bmain.ypos;
    m = -(h/w);
    b = -(m*xpos) + (ypos + h);

    l = sqrt((sq(w)+sq(h)));

    mSI = ((1/m)*sI);

    fill(0, 0, 100);

    if ( w > 0 && h > 0 ) { // +w, +h     - 1 good
      if (x+20 > xpos && y+18 > ypos && y < m*x + b + 20 && y < ypos+h) {
        onBox = true;
        bDiff = (1/m)*2.5; // pretty good
      } else {
        onBox = false;
      }
    } else if ( w < 0 && h > 0 ) { // -w, +h     - 2 good
      if (x-20 < xpos && y+18 > ypos && y < m*x + b + 20 && x > xpos+w && y-20 < ypos+h) {
        onBox = true;
        bDiff = m*3.5; // not super good
      } else {
        onBox = false;
      }
    } else if ( w < 0 && h < 0 ) { // -w, -h      - 3 good
      if ((x-20 < xpos && y-18 < ypos) && y > m*x + b - 20 && x < xpos && y < ypos) { // re overhaul
        onBox = true;
        bDiff = (1/m)*2.5;  // not splendidly good
      } else {
        onBox = false;
      }
    } else if ( w > 0 && h < 0 ) { // +w, -h      - 4  good
      if (x+20 > xpos && y-18 < ypos && y > m*x + b - 20 && x < xpos+w && y+20 > ypos+h) {
        onBox = true;
        bDiff = m*2.5; // pretty good
      } else {
        onBox = false;
      }
    }

    // attempt 3 (to fix)
    if (onBox && paused == false) {
      bmain.offBox = false;
      ballactive = false;


      if (h > 0) { // with jumping...
        bmain.xpos -= mSI;
        bmain.ypos = m*bmain.xpos+b+20-bDiff;
      }
      if (h < 0) { // no jumping...
        bmain.xpos += mSI;
        bmain.ypos = m*bmain.xpos+b-20+bDiff;
      }

      if (w > 0 && h > 0) {
        bmain.xspeed = -mSI*2.5; // increased, to fix marginal error(s)
      } else if (w > 0 && h < 0) {
        bmain.xspeed = mSI*1.5;
      } else if (w < 0 && h > 0) {
        bmain.xspeed = -mSI*1.5;
      } else if (w < 0 && h < 0) {
        bmain.xspeed = mSI*1.5;
      }

      // manual overrides
      if (trinum == 11) {
        bmain.xpos += 5;
        bmain.xspeed += 0.7;
      }
      if (trinum == 28) {
        bmain.xpos += 5;
        bmain.xspeed += 0.7;
      }
      if (trinum == 6) {
        bmain.ypos += 2;
        bmain.xspeed -= 0.4;
      }
    } else {
      bmain.offBox = true;
      ballactive = true;
    }


    if (onBox && showDebugInfo) {
      fill(100, 80, 100, 90);
      stroke(0, 0, 0);
      strokeWeight(1);
      triangle(xpos, ypos, xpos+w, ypos, xpos, ypos+h);
    }

    stroke(0, 0, 100);
    triangle(xpos, ypos, xpos+w, ypos, xpos, ypos+h);
    if (showDebugInfo) {
      fill(0, 0, 0);
      textSize(20);
      text(trinum, xpos+(w/3), ypos+(h/3));
    }
  }
}
