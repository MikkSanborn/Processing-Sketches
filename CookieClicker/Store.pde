class Store {
  float x, y, w, h;
  boolean pMousePressed = mousePressed;

  Store (float xt, float yt, float wt, float ht) {
    x = xt;
    y = yt;
    w = wt;
    h = ht;
  }

  void display() {
    pushMatrix();
    translate(x, y);

    fill(0, 0, 200);
    rect(0, 0, w, h);

    itemBox(10, 10, 1);
    itemBox(10, 50, 2);
    itemBox(10, 90, 3);

    pMousePressed = mousePressed;
    popMatrix();
  }

  void itemBox(float x2, float y2, int upgradeNum) {
    fill(80);

    if (pMousePressed != mousePressed && !mousePressed && mouseX > x+x2 && mouseY > y+y2 && mouseX < x+x2+w/4 && mouseY < y+y2+w/4) { // clicked in box
      tryUpgrade(upgradeNum);
      fill(100);
    }

    rect(x2, y2, w/4, w/4);
  }

  void tryUpgrade(int uNum) {
    switch (uNum) {
    case 1:
      if (cookies >= 100.0+((upgrade1)*10.0)) {
        upgrade1++;
        cookies-=100.0+((upgrade1)*10.0);
        break;
      }
    case 2:
      if (cookies >= 250.0+((upgrade2)*10.0)) {
        upgrade2++;
        cookies-=250.0+((upgrade2)*10.0);
        break;
      }
    case 3:
      if (cookies >= 500.0+((upgrade3)*10.0)) {
        upgrade3++;
        cookies-=500.0+((upgrade3)*10.0);
        break;
      }
    default:
      println("Not a valid upgrade id (itemBox)");
      break;
    }
  }
}
