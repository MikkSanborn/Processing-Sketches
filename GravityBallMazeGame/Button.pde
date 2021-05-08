class BackButton {
  float xpos;
  float ypos;

  BackButton(float xpost, float ypost) {
    xpos = xpost;
    ypos = ypost;
  }

  void display() {
    fill(0, 0, 100);
    rect(xpos, ypos, 50, 50, 10);
    stroke(0, 0, 0);
    strokeWeight(3);
    line(xpos+13, ypos+25, xpos+35, ypos+25);
    line(xpos+25, ypos+15, xpos+12, ypos+25);
    line(xpos+25, ypos+35, xpos+12, ypos+25);
  }

  void use() {
    if (mouseX>xpos && mouseY > ypos && mouseX < xpos+50 && mouseY < ypos + 50) {
      fill(180, 60, 80);
      rect(xpos, ypos, 50, 50, 10);
      stroke(0, 0, 0);
      strokeWeight(3);
      line(xpos+13, ypos+25, xpos+35, ypos+25);
      line(xpos+25, ypos+15, xpos+12, ypos+25);
      line(xpos+25, ypos+35, xpos+12, ypos+25);
    }
    if (mouseX>xpos && mouseY > ypos && mouseX < xpos+50 && mouseY < ypos + 50 && mousePressed) {
      level = 0;
    }
  }

  void pauseDisplay() {
    fill(0, 0, 100);
    noStroke();
    rect(xpos, ypos, 50, 50, 10);
    stroke(0, 0, 0);
    strokeWeight(4);
    line(xpos+20, ypos+15, xpos+20, ypos+35);
    line(xpos+30, ypos+15, xpos+30, ypos+35);
  }

  void pauseUse() {
    noStroke();
    noFill();
    if (mouseX>xpos && mouseY > ypos && mouseX < xpos+50 && mouseY < ypos + 50) {
      fill(180, 60, 80);
      noStroke();
      rect(xpos, ypos, 50, 50, 10);
      stroke(0, 0, 0);
      strokeWeight(4);
      line(xpos+20, ypos+15, xpos+20, ypos+35);
      line(xpos+30, ypos+15, xpos+30, ypos+35);
      noStroke();
    }
    if (mouseX>xpos && mouseY > ypos && mouseX < xpos+50 && mouseY < ypos + 50 && mousePressed) {
      fill(180, 60, 80);
      noStroke();
      rect(xpos, ypos, 50, 50, 10);
      stroke(0, 0, 0);
      strokeWeight(4);
      line(xpos+20, ypos+15, xpos+20, ypos+35);
      line(xpos+30, ypos+15, xpos+30, ypos+35);
      noStroke();
      ballactive = false;
      paused = true;
    }
  }

  void pauseOverlay() {
    fill(0, 0, 100, 50);
    rect(150, 100, 500, 300, 10);
    strokeWeight(5);
    stroke(0, 0, 5, 80);

    // continue
    fill(0, 0, 90, 80);
    if (mouseX > 300 && mouseY > 150 && mouseX < 500 && mouseY < 200) {
      fill(0, 0, 70);
    }
    if (mouseX > 300 && mouseY > 150 && mouseX < 500 && mouseY < 200 && mousePressed) {
      fill(0, 0, 50);
      paused = false;
      ballactive = true;
    }
    rect(300, 150, 200, 50, 7.5);

    // controls
    fill(0, 0, 90, 80);
    if (mouseX > 300 && mouseY > 225 && mouseX < 500 && mouseY < 275) {
      fill(0, 0, 70);
    }
    if (mouseX > 300 && mouseY > 225 && mouseX < 500 && mouseY < 275 && mousePressed) {
      fill(0, 0, 50);
      paused = false;
      ballactive = false;
      levelsave = level;
      level = 1;
    }
    rect(300, 225, 200, 50, 7.5);

    // main menu
    fill(0, 0, 90, 80);
    if (mouseX > 300 && mouseY > 300 && mouseX < 500 && mouseY < 350) {
      fill(0, 0, 70);
    }
    if (mouseX > 300 && mouseY > 300 && mouseX < 500 && mouseY < 350 && mousePressed) {
      fill(0, 0, 50);
      paused = false;
      ballactive = false;
      levelsave = level;
      level = 0;
    }
    rect(300, 300, 200, 50, 7.5);

    if (paused) {
      ballactive = false;
    }

    // text
    fill(0, 0, 10, 90);
    textSize(25);
    text("Continue", xpos+348, ypos+185);
    text("Controls", xpos+348, ypos+260);
    text("Main Menu", xpos+332, ypos+335);
  }
}
