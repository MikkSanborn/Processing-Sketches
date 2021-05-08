class Ball {
  float xpos;
  float ypos;
  float xspeed;
  float yspeed;
  int designtype;
  Boolean offBox = true;
  float c = 0;

  Ball(float xpost, float ypost, float xspeedt, float yspeedt, int designtypet) {
    xpos = xpost;
    ypos = ypost;
    xspeed = xspeedt;
    yspeed = yspeedt;
    designtype = designtypet;
  }

  void display() {
    strokeWeight(2);
    stroke(0, 0, 100);
    fill(0, 0, 0);

    if (designtype == 0) { // default
      fill(0, 0, 0);
      ellipse(xpos, ypos, 40, 40);
    } else if (designtype == 1) { // complete lv 1
      strokeWeight(2);
      stroke(0);
      fill(0, 0, 100);
      ellipse(xpos, ypos, 40, 40);
    } else if (designtype == 2) { // complete lv 1 under 30 seconds
      fill(123, 100, 100);
      strokeWeight(35);
      stroke(123, 100, 100);
      ellipse(xpos, ypos, 5, 5);
    } else if (designtype == 3) { // complete lv 1 under 15 seconds - my best: 9s
      noStroke();
      fill(0, 100, 100);
      ellipse(xpos, ypos, 40, 40);
      fill(45, 100, 100);
      ellipse(xpos, ypos, 30, 30);
      fill(90, 100, 100);
      ellipse(xpos, ypos, 20, 20);
      fill(135, 100, 100);
      ellipse(xpos, ypos, 10, 10);
    } else if (designtype == 4) { // complete lv 2
      strokeWeight(2);
      stroke(0);
      fill(270, 100, 100);
      ellipse(xpos, ypos, 40, 40);
    } else if (designtype == 5) { // complete lv 2 under 30 seconds
      noFill();
      strokeWeight(35);
      stroke(0, 100, 100);
      ellipse(xpos, ypos, 5, 5);

      c += 2; // size


      noStroke();
      fill(180, 100, 100);
      ellipse(xpos, ypos, c/9, c/9);

      if (c > 240) {
        c = 0;
      }
    } else if (designtype == 6) { // complete lv 2 under 15 seconds - my best: 10s
      noStroke();
      fill(180, 100, 100);
      ellipse(xpos, ypos, 40, 40); // -10
      fill(225, 100, 100);
      ellipse(xpos, ypos, 30, 30);
      fill(270, 100, 100);
      ellipse(xpos, ypos, 20, 20);
      fill(315, 100, 100);
      ellipse(xpos, ypos, 10, 10);
    } else if (bmain.designtype == 7) { // complete lv 3
      strokeWeight(2);
      stroke(0);
      fill(45, 100, 100);
      ellipse(xpos, ypos, 40, 40);
      line(xpos-14, ypos-14, xpos-5, ypos-5);
      line(xpos+14, ypos-14, xpos+5, ypos-5);
      line(xpos+14, ypos+14, xpos+5, ypos+5);
      line(xpos-14, ypos+14, xpos-5, ypos+5);
      ellipse(xpos, ypos, 11, 11);
      noFill();
      ellipse(xpos, ypos, 25, 25);
    } else if (designtype == 7) { // complete lv 3
      fill(45, 100, 100);
      ellipse(xpos, ypos, 40, 40);
      strokeWeight(2);
      line(xpos-14, ypos-14, 420, 415);
      line(xpos+14, ypos-14, 430, 415);
      line(xpos+14, ypos+14, 430, 425);
      line(xpos-14, ypos+14, 420, 425);
      ellipse(xpos, ypos, 11, 11);
      noFill();
      ellipse(xpos, ypos, 25, 25);
    } else if (designtype == 8) { // complete lv 3 under 45 seconds
      fill(0);
      noStroke();
      ellipse(xpos, ypos, 36, 36);
      fill(c, 100, 100);
      strokeWeight(35);
      stroke(c, 100, 100);
      ellipse(xpos, ypos, 5, 5);

      c+= 1.25;
      if (c > 360) {
        c = 0;
      }
    } else if (designtype == 9) { // complete lv 3 under 120 seconds
      strokeWeight(2);
      stroke(0, 0, 98);
      noFill();
      ellipse(xpos, ypos, 40, 40);
      rect(xpos-(40/3), ypos-(40/3), 40-(40/3), 40-(40/3));
      line(xpos-(40/3), ypos-(40/3), xpos+(40/3), ypos+(40/3));
      line(xpos-(40/3), ypos+(40/3), xpos+(40/3), ypos-(40/3));
    } else if (designtype == 10) {
      strokeWeight(2);
      stroke(c, 100, 100);
      noFill();
      ellipse(xpos, ypos, 40, 40);

      c++;
      if (c > 360) {
        c = 0;
      }
    } else if (designtype == 11) {
      strokeWeight(2);
      stroke(c, 100, 100);
      fill(c, 100, 100);
      ellipse(xpos, ypos, 40, 40);

      c++;
      if (c > 360) {
        c = 0;
      }
    }
  }

  void move() {
    if (ballactive == true) {
      xpos += xspeed;
      ypos += yspeed;
      if (ypos < 450) {
        ypos += 5;
      }
      if (ypos > 425) {
        if (xspeed > 0) {
          xspeed -= 0.05;
        } else if (xspeed < 0) {
          xspeed += 0.05;
        }
      }
      if (yspeed < 0) {
        if (yspeed < -0.1) {
          yspeed = yspeed + 0.25;
        }
      }
      if (ypos < 50) {
        ypos = 50;
        yspeed = 0;
      }
      if (xpos > 750) {
        xspeed = -xspeed + 0.25;
        xpos = 749;
      }
      if (xpos < 50) {
        xspeed = -xspeed - 0.9;
        xpos = 51;
      }
      if (xspeed > -0.1 && xspeed < 0.1) {
        xspeed = 0;
      }
    }
  }

  void jump() {
    if (keyPressed && key == ' ' && yspeed <= 0 && ballactive == true && offBox == true) {
      yspeed = -10;
    }
    if (clickBounce) {
      if (mousePressed) {
        yspeed = -10;
      }
    }
  }
}
