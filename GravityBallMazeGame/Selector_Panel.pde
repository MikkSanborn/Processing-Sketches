class BallSelectorPanel {
  float col = 0;

  BallSelectorPanel(float colt) {
    col = colt;
  }


  void display() {   


    // Ball select / balltype selector panel ================================================================================================================================================================================
    strokeWeight(2);
    stroke(0, 0, 0);
    textSize(16);
    fill(0, 0, 100);
    rect(325, 110-50, 400, 300+50+50, 7.5);


    // Overall // 
    fill(0, 0, 40, 80);
    rect(325, 110-50, 400, 24, 7.5); // 325 - 725, 110 - 134, 400w, 24h
    textSize(14);

    fill(347, 12, 100);
    text("Overall", 332, 129-50);
    if (hs1 == 0 || hs2 == 0 || hs3 == 0) {
      text("Highscore: N/A", 600, 129-50);
    } else if (ceil((hs1/afr)+(hs2/afr)+(hs3/afr)) > 0 && ceil((hs1/afr)+(hs2/afr)+(hs3/afr)) < 10) {
      text("Highscore: " + ceil((hs1/afr)+(hs2/afr)+(hs3/afr)), 615, 129-50);
    } else if (ceil((hs1/afr)+(hs2/afr)+(hs3/afr)) >= 10 && ceil((hs1/afr)+(hs2/afr)+(hs3/afr)) < 100) {
      text("Highscore: " + ceil((hs1/afr)+(hs2/afr)+(hs3/afr)), 610, 129-50);
    } else if (ceil((hs1/afr)+(hs2/afr)+(hs3/afr)) >= 100 && ceil((hs1/afr)+(hs2/afr)+(hs3/afr)) < 1000) {
      text("Highscore: " + ceil((hs1/afr)+(hs2/afr)+(hs3/afr)), 600, 129-50);
    }


    fill(0, 0, 100);
    rect(350, 145-50, 100, 50, 7.5);
    fill(0, 0, 80, 50);
    rect(350, 145-50, 50, 50, 7.5);
    fill(0, 0, 0);


    // Current Ball
    // text("Current", 358, 162-50-14);
    text("Ball", 360, 177-50-10);
    text("Type", 356, 192-50-6);

    // 425, 120
    strokeWeight(2);
    stroke(0, 0, 100);
    fill(0, 0, 0);


    strokeWeight(2);
    stroke(0);

    if (bmain.designtype == 0) { // default
      fill(0, 0, 0);
      ellipse(425, 120, 40, 40);
    } else if (bmain.designtype == 1) { // complete lv 1
      strokeWeight(2);
      stroke(0);
      fill(0, 0, 100);
      ellipse(425, 120, 40, 40);
    } else if (bmain.designtype == 2) { // complete lv 1 under 30 seconds
      fill(123, 100, 100);
      strokeWeight(35);
      stroke(123, 100, 100);
      ellipse(425, 120, 5, 5);
    } else if (bmain.designtype == 3) { // complete lv 1 under 15 seconds - my best: 9s
      noStroke();
      fill(0, 100, 100);
      ellipse(425, 120, 40, 40);
      fill(45, 100, 100);
      ellipse(425, 120, 30, 30);
      fill(90, 100, 100);
      ellipse(425, 120, 20, 20);
      fill(135, 100, 100);
      ellipse(425, 120, 10, 10);
    } else if (bmain.designtype == 4) { // complete lv 2
      strokeWeight(2);
      stroke(0);
      fill(270, 100, 100);
      ellipse(425, 120, 40, 40);
    } else if (bmain.designtype == 5) { // complete lv 2 under 30 seconds
      noStroke();
      fill(180, 100, 100);
      ellipse(425.5, 119.5, col/13.5, col/13.5);

      fill(0, 100, 100);
      noFill();
      strokeWeight(35);
      stroke(0, 100, 100);
      ellipse(425, 120, 5, 5);
    } else if (bmain.designtype == 6) { // complete lv 2 under 15 seconds - my best: 10s
      noStroke();
      fill(180, 100, 100);
      ellipse(425, 120, 40, 40); // -10
      fill(225, 100, 100);
      ellipse(425, 120, 30, 30);
      fill(270, 100, 100);
      ellipse(425, 120, 20, 20);
      fill(315, 100, 100);
      ellipse(425, 120, 10, 10);
    } else if (bmain.designtype == 7) { // complete lv 3
      strokeWeight(2);
      stroke(0);
      fill(45, 100, 100);
      ellipse(425, 120, 40, 40);
      line(425-14, 120-14, 420, 115);
      line(425+14, 120-14, 430, 115);
      line(425+14, 120+14, 430, 125);
      line(425-14, 120+14, 420, 125);
      ellipse(425, 120, 11, 11);
      noFill();
      ellipse(425, 120, 25, 25);
    } else if (bmain.designtype == 8) { // complete lv 3 under 45 seconds
      fill(0);
      noStroke();
      ellipse(425, 120, 36, 36);

      fill(col, 100, 100);
      strokeWeight(35);
      stroke(col, 100, 100);
      ellipse(425, 120, 5, 5);
    } else if (bmain.designtype == 9) { // complete lv 3 under 120 seconds
      noFill();
      strokeWeight(2);
      stroke(0);
      ellipse(425, 120, 40, 40);
      rect(425-(13.3333), 120-(13.3333), 40-(13.3333), 40-(13.3333));
      line(425-(13.3333), 120-(13.3333), 425+(13.3333), 120+(13.3333));
      line(425-(13.3333), 120+(13.3333), 425+(13.3333), 120-(13.3333));
    } else if (bmain.designtype == 10) {
      strokeWeight(2);
      stroke(col, 100, 100);
      noFill();
      ellipse(425, 120, 40, 40);

      col++;
      if (col > 360) {
        col = 0;
      }
    } else if (bmain.designtype == 11) {
      strokeWeight(2);
      stroke(col, 100, 100);
      fill(col, 100, 100);
      ellipse(425, 120, 40, 40);

      col++;
      if (col > 360) {
        col = 0;
      }
    }

    strokeWeight(2);
    stroke(0, 0, 0);
    textSize(16);
    fill(0);


    if (((hs1/afr)+(hs2/afr)+(hs3/afr)) < 60 && hs1 != 0 && hs2 != 0 && hs3 != 0) { // complete overall && beat 60 seconds
      fill(0, 0, 100);
    } else {
      fill(0, 0, 80, 80);
    }
    if (mouseX > 475 && mouseX < 575 && mouseY > 145-50 && mouseY < 195-50 && ((hs1/afr)+(hs2/afr)+(hs3/afr)) < 60 && hs1 != 0 && hs2 != 0 && hs3 != 0) {
      fill(0, 0, 70, 80);
    }
    if (mouseX > 475 && mouseX < 575 && mouseY > 145-50 && mouseY < 195-50 && ((hs1/afr)+(hs2/afr)+(hs3/afr)) < 60 && hs1 != 0 && hs2 != 0 && hs3 != 0 && mousePressed) {
      fill(0, 0, 50, 80);
      bmain.designtype = 10;
    }
    rect(475, 145-50, 100, 50, 7.5);

    rect(475, 145-50, 100, 50, 7.5);
    fill(0, 0, 80, 50);
    rect(475, 145-50, 50, 50, 7.5);

    fill(0);
    textSize(13);
    text("Beat all", 477, 162-50);
    textSize(14);
    text("under", 480, 177-50);
    text("60s", 484, 192-50);

    strokeWeight(2);
    stroke(col, 100, 100);
    noFill();
    ellipse(550, 120, 40, 40);

    stroke(0);

    if (((hs1/afr)+(hs2/afr)+(hs3/afr)) < 120 && hs1 != 0 && hs2 != 0 && hs3 != 0) { // complete overall && beat 120 seconds
      fill(0, 0, 100);
    } else {
      fill(0, 0, 80, 80);
    }
    if (mouseX > 600 && mouseX < 700 && mouseY > 145-50 && mouseY < 195-50 && ((hs1/afr)+(hs2/afr)+(hs3/afr)) < 120 && hs1 != 0 && hs2 != 0 && hs3 != 0) {
      fill(0, 0, 70, 80);
    }
    if (mouseX > 600 && mouseX < 700 && mouseY > 145-50 && mouseY < 195-50 && ((hs1/afr)+(hs2/afr)+(hs3/afr)) < 120 && hs1 != 0 && hs2 != 0 && hs3 != 0 && mousePressed) {
      fill(0, 0, 50, 80);
      bmain.designtype = 11;
    }
    rect(600, 145-50, 100, 50, 7.5);

    rect(600, 145-50, 100, 50, 7.5);
    fill(0, 0, 80, 50);
    rect(600, 145-50, 50, 50, 7.5);
    fill(0);
    textSize(13);
    text("Beat all", 603, 162-50);
    textSize(14);
    text("under", 605, 177-50);
    text("120s", 606, 192-50);

    strokeWeight(2);
    stroke(col, 100, 100);
    fill(col, 100, 100);
    ellipse(675, 120, 40, 40);

    stroke(0);

    col++;
    if (col > 360) {
      col = 0;
    }


    // lv. 1
    fill(0, 0, 40, 80);
    rect(325, 110+50, 400, 24, 7.5); // 325 - 725, 110 - 134, 400w, 24h

    fill(347, 12, 100);
    text("Level 1", 332, 129+50);
    if (hs1 == 0) {
      text("Highscore: N/A", 600, 129+50);
    } else if (ceil(hs1/afr) > 0 && ceil(hs1/afr) < 10) {
      text("Highscore: " + ceil(hs1/afr), 615, 129+50);
    } else if (ceil(hs1/afr) >= 10 && ceil(hs1/afr) < 100) {
      text("Highscore: " + ceil(hs1/afr), 610, 129+50);
    } else if (ceil(hs1/afr) >= 100 && ceil(hs1/afr) < 1000) {
      text("Highscore: " + ceil(hs1/afr), 600, 129+50);
    }

    if (hs1 != 0) { // complete lv.1 
      fill(0, 0, 100);
    } else {
      fill(0, 0, 80, 80);
    }
    if (mouseX > 350 && mouseX < 450 && mouseY > 145+50 && mouseY < 195+50 && hs1 != 0) {
      fill(0, 0, 70, 80);
    }
    if (mouseX > 350 && mouseX < 450 && mouseY > 145+50 && mouseY < 195+50 && hs1 != 0 && mousePressed) {
      fill(0, 0, 50, 80);
      bmain.designtype = 1;
    }
    rect(350, 145+50, 100, 50, 7.5);

    fill(0, 0, 80, 50);
    rect(350, 145+50, 50, 50, 7.5);
    fill(0, 0, 0);

    text("Beat", 358, 162+50);
    text("level", 358, 177+50);
    text("1", 370, 192+50);

    fill(0, 0, 100);
    ellipse(425, 170+50, 40, 40);


    if (hs1/afr < 15 && hs1 != 0) { // complete lv.1 && beat 15 seconds
      fill(0, 0, 100);
    } else {
      fill(0, 0, 80, 80);
    }
    if (mouseX > 475 && mouseX < 575 && mouseY > 145+50 && mouseY < 195+50 && hs1/afr < 15 && hs1 != 0) {
      fill(0, 0, 70, 80);
    }
    if (mouseX > 475 && mouseX < 575 && mouseY > 145+50 && mouseY < 195+50 && hs1/afr < 15 && hs1 != 0 && mousePressed) {
      fill(0, 0, 50, 80);
      bmain.designtype = 2;
    }
    rect(475, 145+50, 100, 50, 7.5);

    rect(475, 145-50+100, 100, 50, 7.5);
    fill(0, 0, 80, 50);
    rect(475, 145-50+100, 50, 50, 7.5);

    fill(123, 100, 100);
    strokeWeight(35);
    stroke(123, 100, 100);
    ellipse(550, 220, 5, 5);

    fill(0);
    text("Lv. 1", 482, 162-50+100);
    text("under", 480, 177-50+100);
    text("15s", 484, 192-50+100);

    strokeWeight(2);
    stroke(0);

    if (hs1/afr < 45 && hs1 != 0) { // complete lv.1 && beat 45 seconds
      fill(0, 0, 100);
    } else {
      fill(0, 0, 80, 80);
    }
    if (mouseX > 600 && mouseX < 700 && mouseY > 145+50 && mouseY < 195+50 && hs1/afr < 45 && hs1 != 0) {
      fill(0, 0, 70, 80);
    }
    if (mouseX > 600 && mouseX < 700 && mouseY > 145+50 && mouseY < 195+50 && hs1/afr < 45 && hs1 != 0 && mousePressed) {
      fill(0, 0, 50, 80);
      bmain.designtype = 3;
    }
    rect(600, 145+50, 100, 50, 7.5);

    rect(600, 145-50+100, 100, 50, 7.5);
    fill(0, 0, 80, 50);
    rect(600, 145-50+100, 50, 50, 7.5);

    fill(0);
    text("Lv. 1", 482+125, 162-50+100);
    text("under", 480+125, 177-50+100);
    text("45s", 484+125, 192-50+100);

    noStroke();
    fill(0, 100, 100);
    ellipse(675, 220, 40, 40);
    fill(45, 100, 100);
    ellipse(675, 220, 30, 30);
    fill(90, 100, 100);
    ellipse(675, 220, 20, 20);
    fill(135, 100, 100);
    ellipse(675, 220, 10, 10);

    strokeWeight(2);
    stroke(0);


    // lv. 2 ball select ---------------

    // lv. 2
    fill(0, 0, 40, 80);
    rect(325, 210+50, 400, 24, 7.5);

    fill(347, 12, 100);
    text("Level 2", 332, 229+50);
    if (hs2 == 0) {
      text("Highscore: N/A", 600, 229+50);
    } else if (ceil(hs2/afr) > 0 && ceil(hs2/afr) < 10) {
      text("Highscore: " + ceil(hs2/afr), 615, 229+50);
    } else if (ceil(hs2/afr) >= 10 && ceil(hs2/afr) < 100) {
      text("Highscore: " + ceil(hs2/afr), 610, 229+50);
    } else if (ceil(hs2/afr) >= 100 && ceil(hs2/afr) < 1000) {
      text("Highscore: " + ceil(hs2/afr), 600, 229+50);
    }

    if (hs2 != 0) { // complete lv.2 
      fill(0, 0, 100);
    } else {
      fill(0, 0, 80, 80);
    }
    if (mouseX > 350 && mouseX < 450 && mouseY > 245+50 && mouseY < 295+50 && hs2 != 0) {
      fill(0, 0, 70, 80);
    }
    if (mouseX > 350 && mouseX < 450 && mouseY > 245+50 && mouseY < 295+50 && hs2 != 0 && mousePressed) {
      fill(0, 0, 50, 80);
      bmain.designtype = 4;
    }
    rect(350, 245+50, 100, 50, 7.5);
    // dt4

    fill(0, 0, 80, 50);
    rect(350, 145+50+100, 50, 50, 7.5);
    fill(0, 0, 0);

    text("Beat", 358, 162+50+100);
    text("level", 358, 177+50+100);
    text("2", 370, 192+50+100);

    fill(270, 100, 100);
    ellipse(425, 320, 40, 40);


    if (hs2/afr < 15 && hs2 != 0) { // complete lv.2 && beat 15 seconds
      fill(0, 0, 100);
    } else {
      fill(0, 0, 80, 80);
    }
    if (mouseX > 475 && mouseX < 575 && mouseY > 245+50 && mouseY < 295+50 && hs2/afr < 15 && hs2 != 0) {
      fill(0, 0, 70, 80);
    }
    if (mouseX > 475 && mouseX < 575 && mouseY > 245+50 && mouseY < 295+50 && hs2/afr < 15 && hs2 != 0 && mousePressed) {
      fill(0, 0, 50, 80);
      bmain.designtype = 5;
    }
    rect(475, 245+50, 100, 50, 7.5);

    rect(475, 145-50+300-100, 100, 50, 7.5);
    fill(0, 0, 80, 50);
    rect(475, 145-50+300-100, 50, 50, 7.5);

    noStroke();
    fill(180, 100, 100);
    ellipse(550.5, 319.5, col/13.5, col/13.5);

    fill(0, 100, 100);
    noFill();
    strokeWeight(35);
    stroke(0, 100, 100);
    ellipse(550, 320, 5, 5);

    fill(0);
    text("Lv. 2", 482, 162-50+300-100);
    text("under", 480, 177-50+300-100);
    text("15s", 484, 192-50+300-100);

    strokeWeight(2);
    stroke(0);

    if (hs2/afr < 45 && hs2 != 0) { // complete lv.2 && beat 45 seconds
      fill(0, 0, 100);
    } else {
      fill(0, 0, 80, 80);
    }
    if (mouseX > 600 && mouseX < 700 && mouseY > 245+50 && mouseY < 295+50 && hs2/afr < 45 && hs2 != 0) {
      fill(0, 0, 70, 80);
    }
    if (mouseX > 600 && mouseX < 700 && mouseY > 245+50 && mouseY < 295+50 && hs2/afr < 45 && hs2 != 0 && mousePressed) {
      fill(0, 0, 50, 80);
      bmain.designtype = 6;
    }
    rect(600, 245+50, 100, 50, 7.5);

    rect(600, 145-50+300-100, 100, 50, 7.5);
    fill(0, 0, 80, 50);
    rect(600, 145-50+300-100, 50, 50, 7.5);

    fill(0);
    text("Lv. 2", 482+125, 162-50+300-100);
    text("under", 480+125, 177-50+300-100);
    text("45s", 484+125, 192-50+300-100);

    noStroke();
    fill(180, 100, 100);
    ellipse(675, 320, 40, 40); // -10
    fill(225, 100, 100);
    ellipse(675, 320, 30, 30);
    fill(270, 100, 100);
    ellipse(675, 320, 20, 20);
    fill(315, 100, 100);
    ellipse(675, 320, 10, 10);

    strokeWeight(2);
    stroke(0);


    // lv. 3 ball select ---------------

    // lv. 3
    fill(0, 0, 40, 80);
    rect(325, 310+50, 400, 24, 7.5);

    fill(347, 12, 100);
    text("Level 3", 332, 329+50);
    if (hs3 == 0) {
      text("Highscore: N/A", 600, 329+50);
    } else if (ceil(hs3/afr) > 0 && ceil(hs3/afr) < 10) {
      text("Highscore: " + ceil(hs3/afr), 615, 329+50);
    } else if (ceil(hs3/afr) >= 10 && ceil(hs3/afr) < 100) {
      text("Highscore: " + ceil(hs3/afr), 610, 329+50);
    } else if (ceil(hs3/afr) >= 100 && ceil(hs3/afr) < 1000) {
      text("Highscore: " + ceil(hs3/afr), 600, 329+50);
    }

    if (hs3 != 0) { // complete lv.3 
      fill(0, 0, 100);
    } else {
      fill(0, 0, 80, 80);
    }

    if (mouseX > 350 && mouseX < 450 && mouseY > 345+50 && mouseY < 395+50 && hs3 != 0) {
      fill(0, 0, 70, 80);
    }
    if (mouseX > 350 && mouseX < 450 && mouseY > 345+50 && mouseY < 395+50 && hs3 != 0 && mousePressed) {
      fill(0, 0, 50, 80);
      bmain.designtype = 7;
    }
    rect(350, 345+50, 100, 50, 7.5);

    fill(0, 0, 80, 50);
    rect(350, 145+50+200, 50, 50, 7.5);
    fill(0, 0, 0);

    text("Beat", 358, 162+50+200);
    text("level", 358, 177+50+200);
    text("3", 370, 192+50+200);

    fill(45, 100, 100);
    ellipse(425, 420, 40, 40);
    strokeWeight(2);
    line(425-14, 420-14, 420, 415);
    line(425+14, 420-14, 430, 415);
    line(425+14, 420+14, 430, 425);
    line(425-14, 420+14, 420, 425);
    ellipse(425, 420, 11, 11);
    noFill();
    ellipse(425, 420, 25, 25);

    if (hs3/afr < 30 && hs3 != 0) { // complete lv.3 && beat 45 seconds
      fill(0, 0, 100);
    } else {
      fill(0, 0, 80, 80);
    }
    if (mouseX > 475 && mouseX < 575 && mouseY > 345+50 && mouseY < 395+50 && hs3/afr < 30 && hs3 != 0) {
      fill(0, 0, 70, 80);
    }
    if (mouseX > 475 && mouseX < 575 && mouseY > 345+50 && mouseY < 395+50 && hs3/afr < 30 && hs3 != 0 && mousePressed) {
      fill(0, 0, 50, 80);
      bmain.designtype = 8;
    }
    rect(475, 345+50, 100, 50, 7.5);

    rect(475, 145-50+300, 100, 50, 7.5);
    fill(0, 0, 80, 50);
    rect(475, 145-50+300, 50, 50, 7.5);

    fill(0);
    noStroke();
    ellipse(550, 420, 36, 36);

    fill(col, 100, 100);
    strokeWeight(35);
    stroke(col, 100, 100);
    ellipse(550, 420, 5, 5);

    fill(0);
    text("Lv. 3", 482, 162-50+300);
    text("under", 480, 177-50+300);
    text("30s", 484, 192-50+300);

    strokeWeight(2);
    stroke(0);

    if (hs3/afr < 60 && hs3 != 0) { // complete lv.3 && beat 120 seconds
      fill(0, 0, 100);
    } else {
      fill(0, 0, 80, 80);
    }
    if (mouseX > 600 && mouseX < 700 && mouseY > 345+50 && mouseY < 395+50 && hs3/afr < 60 && hs3 != 0) {
      fill(0, 0, 70, 80);
    }
    if (mouseX > 600 && mouseX < 700 && mouseY > 345+50 && mouseY < 395+50 && hs3/afr < 60 && hs3 != 0 && mousePressed) {
      fill(0, 0, 50, 80);
      bmain.designtype = 9;
    }
    rect(600, 345+50, 100, 50, 7.5);

    rect(600, 145-50+300, 100, 50, 7.5);
    fill(0, 0, 80, 50);
    rect(600, 145-50+300, 50, 50, 7.5);

    fill(0);
    text("Lv. 3", 482+125, 162-50+300);
    text("under", 480+125, 177-50+300);
    text("60s", 484+125, 192-50+300);

    noFill();
    strokeWeight(2);
    stroke(0);
    ellipse(550+125, 420, 40, 40);
    rect(425-(13.3333)+125+125, 420-(13.3333), 40-(13.3333), 40-(13.3333));
    line(425-(13.3333)+125+125, 420-(13.3333), 425+(13.3333)+125+125, 420+(13.3333));
    line(425-(13.3333)+125+125, 420+(13.3333), 425+(13.3333)+125+125, 420-(13.3333));
  }
}
