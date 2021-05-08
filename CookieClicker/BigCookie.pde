class BigCookie {
  float x, y; // x, y
  float r; // radius
  float rs; // 
  float cS = 1; // cookie's swell amount
  boolean cSwell = false; // cookie swelling?

  BigCookie(float xt, float yt, float rt, float rst) {
    x = xt;
    y = yt;
    r = rt;
    rs = rst;
  }

  void display() {
    if (cSwell && cS <= 1.25) {
      cS*=1.1;
    } else if (cSwell && cS >= 1.25) {
      cSwell = false;
      cS/=1.1;
    } else if (cS > 1) {
      cS/=1.1;
    }
    pushMatrix();
    translate(x, y);
    scale(cS);
    fill(251, 243, 243, 50);
    rect(-r, -r, r*2, r*2);
    fill(122.5);
    ellipse(0, 0, r*2, r*2);
    popMatrix();
  }

  void click() {
    // assume called only if mouseClicked, add cookies. NOT PRESSED, clicked or released
    if (sqrt(sq(mouseX-x) + sq(mouseY-y)) <= r) {
      cookies += cPC;
      swell();
    }
  }

  void swell() {
    cSwell = true;
  }
}
