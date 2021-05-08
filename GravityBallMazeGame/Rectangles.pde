class DeathRect {
  float xpos;
  float ypos;
  float w;
  float h;
  float rectnum;

  DeathRect(float xpost, float ypost, float xsizet, float ysizet, float rectumt) {
    xpos = xpost;
    ypos = ypost;
    w = xsizet;
    h = ysizet;
    rectnum = rectumt;
  }

  void display() {
    fill(0, 100, 90);
    strokeWeight(0);
    stroke(0, 0, 100);
    rect(xpos, ypos, w, h);
  }

  void use() {
    if (bmain.xpos+21 > xpos && bmain.xpos-21 < xpos + w && bmain.ypos+21 > ypos && bmain.ypos-21 < ypos+h) {
      bmain.xpos = 50;
      bmain.ypos = 365;
      bmain.xspeed = 0;
      bmain.yspeed = 0;
    }

    if (bmain.xpos+21 > xpos && bmain.xpos-21 < xpos + w && bmain.ypos+21 > ypos && bmain.ypos-21 < ypos+h && showDebugInfo) {
      fill(180, 100, 100);
      strokeWeight(0);
      stroke(0, 0, 100);
      rect(xpos, ypos, w, h);
    }

    if (showDebugInfo) {
      fill(130, 100, 100);
      textSize(18);
      text(ceil(rectnum), xpos+w/2, ypos);
    }
  }
}

class SlowRect {
  float xpos;
  float ypos;
  float w;
  float h;
  float rectnum;
  Boolean oneSide;
  Boolean onBoxR;

  float friction = 0.15;

  SlowRect(float xpost, float ypost, float xsizet, float ysizet, float rectumt) {
    xpos = xpost;
    ypos = ypost;
    w = xsizet;
    h = ysizet;
    rectnum = rectumt;
  }

  void display() {
    fill(120, 100, 100, 80);
    fill(0, 0, 100);
    strokeWeight(0);
    stroke(0, 0, 100);
    rect(xpos, ypos, w, h);
  }

  void use() {
    oneSide = true;


    if (rectnum < 100) {
      if (bmain.xpos+20 > xpos && bmain.xpos-20 < xpos+w && bmain.ypos > ypos-21 && bmain.ypos < ypos) { // on top
        // on top
        bmain.ypos = ypos-20;
        if (bmain.xspeed > (friction/2)) {
          bmain.xspeed -= friction;
        }
        if (bmain.xspeed < -(friction/2)) {
          bmain.xspeed += friction;
        }
        if (bmain.xspeed > -(friction/2) && bmain.xspeed < (friction/2)) {
          bmain.xspeed = 0;
        }

        onBoxR = true;
      } else if (bmain.xpos+20 > xpos && bmain.xpos-20 < xpos+w && bmain.ypos < ypos+h+20 && bmain.ypos > ypos+h && ((keyPressed && key == ' ') || (clickBounce == true && mousePressed))) { // on top
        // on bottom with spacebar
        bmain.ypos = ypos+h+20;

        onBoxR = true;
      } else if (bmain.xpos+20 > xpos && bmain.xpos-20 < xpos+w && bmain.ypos < ypos+h+20 && bmain.ypos > ypos+h) { // on top
        // on bottom
        bmain.ypos = ypos+h+31;

        onBoxR = true;
      } else if (bmain.xpos+20 > xpos && bmain.xpos-20 < xpos+w && bmain.ypos+20 > ypos && bmain.ypos-20 < ypos+h) {
        if (showDebugInfo) {
          fill(150, 100, 100, 100);
          strokeWeight(0);
          stroke(0, 0, 100);
          rect(xpos, ypos, w, h);
        }
        if (bmain.xspeed > 0 && oneSide) {
          bmain.xspeed--;
          bmain.xspeed = 0 - bmain.xspeed;
          bmain.xpos -= 5;
          oneSide = false;
        }
        if (bmain.xspeed < 0 && oneSide) {
          bmain.xspeed++;
          bmain.xspeed = 0 - bmain.xspeed;
          bmain.xpos += 5;
          oneSide = false;
        }

        onBoxR = true;
        oneSide = true;
      } else {
        onBoxR = false;
      }
    }


    if (rectnum > 100) {
      if (bmain.xpos+20 > xpos && bmain.xpos-20 < xpos+w && bmain.ypos+20 > ypos && bmain.ypos-20 < ypos+h) { // on top
        // on top
        bmain.ypos = ypos-20;
        bmain.xspeed = 0;

        if (showDebugInfo) {
          fill(300, 100, 100);
          strokeWeight(0);
          stroke(0, 0, 100);
          rect(xpos, ypos, w, h);
        }

        onBoxR = true;
      }
    }

    if (showDebugInfo) {
      fill(45, 90, 100);
      textSize(20);
      text(ceil(rectnum), xpos + w/3, ypos + h/3);
    }
  }
}
