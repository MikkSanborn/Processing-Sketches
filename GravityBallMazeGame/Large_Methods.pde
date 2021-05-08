void triangleSetup() {
  //Level 1
  t1 = new BounceTriangle(25, 25, 200, 100, 1);
  t2 = new BounceTriangle(650, 475, -100, -100, 2);
  t3 = new BounceTriangle(775, 25, -550, 300, 3);
  t4 = new BounceTriangle(150, 475, 300, -190, 4);
  t5 = new BounceTriangle(650, 475, 50, -100, 5);
  t6 = new BounceTriangle(300, 200, -120, -100, 6);
  t7 = new SlowRect(650, 375, 10, 101, 7);
  t8 = new SlowRect(140, 285, 10, 191, 8);
  t9 = new BounceTriangle(300, 200, -120, 30, 9);
  t10 = new SlowRect(300, 100, 5, 130, 10);
  //Level 2
  t11 = new BounceTriangle(25, 25, 150, 200, 11);
  t12 = new BounceTriangle(775, 475, -150, -200, 12);
  t13 = new BounceTriangle(775, 25, -150, 100, 13);
  t14 = new BounceTriangle(25, 475, 250, -125, 14);
  t15 = new BounceTriangle(475, 25, -300, 200, 15);
  t16 = new BounceTriangle(475, 25, 150, 100, 16);
  t17 = new SlowRect(475, 25, 4, 200, 17);
  t18 = new BounceTriangle(625, 225, -150, 100, 18);
  t19 = new SlowRect (476, 222, 200, 4, 19);
  t20 = new BounceTriangle(275, 475, 350, -204, 20);
  t21 = new BounceTriangle(175, 275, 100, 50, 21);
  t22 = new BounceTriangle(625, 225, 50, 100, 22);
  t23 = new BounceTriangle(175, 275, -100, 50, 23);
  t24 = new SlowRect(265, 275, 10, 200, 24);
  t25 = new SlowRect(25, 450, 250, 25, 25);
  t26 = new SlowRect(75, 268, 200, 8, 26);
  t27 = new SlowRect(598, 160, 5, 62, 27);
  t28 = new BounceTriangle(602, 222, 73, -62, 28);
  // Level3

  t29 = new BounceTriangle(25, 25, 100, 225, 29);
  t30 = new BounceTriangle(225, 25, -100, 125, 30);
  t31 = new BounceTriangle(225, 25, 75, 50, 31);
  t32 = new BounceTriangle(375, 25, 75, 50, 32);
  t33 = new BounceTriangle(525, 25, 75, 50, 33);
  t34 = new BounceTriangle(775, 200, -100, -175, 34);
  t35 = new BounceTriangle(775, 200, -100, 100, 35);
  t36 = new BounceTriangle(625, 475, 150, -150, 36);
  t37 = new BounceTriangle(625, 475, -280, -150, 37);
  t38 = new BounceTriangle(200, 475, 210, -175, 38);
  t39 = new BounceTriangle(25, 475, 150, -105, 39);
  t40 = new BounceTriangle(350, 175, 50, -40, 40);
  t41 = new BounceTriangle(400, 215, 50, -40, 41);
  t42 = new BounceTriangle(500, 200, -60, -75, 42);
  t43 = new SlowRect(400, 201, 100, 25, 43);
  t44 = new BounceTriangle(500, 175, 125, -50, 44);
  t45 = new BounceTriangle(550, 175, 75, 50, 45);
  t46 = new SlowRect(500, 176, 50, 50, 46);
  t47 = new SlowRect(250, 425, 200, 40, 47);
  t48 = new SlowRect(350, 175, 50, 5, 48);
  t49 = new SlowRect(397, 177, 4, 49, 49);
  t50 = new SlowRect(345, 140, 5, 300, 50);
  t51 = new SlowRect(250, 400, 100, 50, 51);
  t52 = new DeathRect(343, 150, 5, 250, 52);
  t53 = new DeathRect(769, 291, 6, 180, 53);
  t54 = new DeathRect(195, 300, 5, 175, 54);
  t55 = new DeathRect(300, 25, 75, 5, 55);
  t56 = new DeathRect(450, 25, 75, 5, 56);
  t57 = new DeathRect(600, 25, 175, 5, 57);
  t58 = new DeathRect(405, 222, 145, 5, 58);
  t59 = new SlowRect(225, 75, 5, 75, 59);
  t60 = new SlowRect(345, 150, 5, 285, 60);
  t61 = new SlowRect(250, 380, 100, 50, 161);
  t162 = new SlowRect(350, 450, 200, 20, 1620);
  t63 = new SlowRect(370, 25, 5, 50, 63);
  t64 = new SlowRect(520, 25, 5, 50, 64);
}

void drawAll() {
  if (level == 0) { //MainMenu
    // background(100, 30, 20);
    background(0, 0, 0);
    image(bgpic, 0, 0);


    // Title
    fill(h, 75, 90);
    // fill(tc);
    textSize(28);
    text("Gravity Ball Maze", 50, 75);

    // Hitboxes and buttons
    fill(0, 0, 100);

    if (mouseX>50 && mouseX<200 && mouseY>110 && mouseY<160) {
      fill(90, 50, 80);
    }
    rect(50, 110, 150, 50, 7.5);

    fill(0, 0, 100);
    if (mouseX>50 && mouseX<200 && mouseY>210 && mouseY<260) {
      fill(90, 50, 80);
    }
    rect(50, 210, 150, 50, 7.5);
    fill(0, 0, 100);
    if (mouseX>50 && mouseX<200 && mouseY>310 && mouseY<360) {
      fill(90, 50, 80);
    }
    rect(50, 310, 150, 50, 7.5);
    fill(0, 0, 100);
    if (mouseX>50 && mouseX<200 && mouseY>410 && mouseY<460) {
      fill(90, 50, 80);
    }
    rect(50, 410, 150, 50, 7.5);

    // Button Usage Boxes
    /*
    if (mouseX>50 && mouseX<200 && mouseY>110 && mouseY<160 && mousePressed) {
     level = 4;
     }
     if (mouseX>50 && mouseX<200 && mouseY>210 && mouseY<260 && mousePressed) {
     level = 1;
     }
     if (mouseX>50 && mouseX<200 && mouseY>310 && mouseY<360 && mousePressed) {
     level = 2;
     }
     if (mouseX>50 && mouseX<200 && mouseY>410 && mouseY<460 && mousePressed) {
     level = 3;
     }*/

    // Button Filling

    // Button 1 - play (lv.4)

    fill(90, 90, 0);
    textSize(24);
    text("Play", 101, 144);

    // Button 2 - controls (lv.1)

    fill(90, 90, 0);
    textSize(20);
    text("Controls", 82, 242);

    // Button 3 -

    fill(90, 90, 0);
    textSize(20);
    text("Backstory", 77, 342);

    // Button 4 -

    fill(90, 90, 0);
    textSize(20);
    text("Credits", 90, 442);

    BSP.display();
  } else if (level == 1) { //ControlsGuide ------------ CONTROLS
    background(0, 0, 0);
    image(bgpic, 0, 0);
    backHome.display();
    backHome.use();

    // Title
    fill(h, 75, 90);
    textSize(28);
    text("Gravity Ball Maze - Controls", 50, 75);

    // Text
    textSize(20);
    text("To select the levels and press buttons -", 50, 120);
    text("Use the mouse", 50, 145);

    text("To jump or move the ball -", 50, 220);
    text("Use the space bar", 50, 245);

    text("To reset the level -", 50, 330);
    text("Use the key 'r'", 50, 355);

    textSize(12);
    if (clickBounce == false) {
      fill(0, 100, 100);
      rect(125, 430, 50, 15);
      fill(0, 0, 90);
      rect(125, 430, 25, 15);
      fill(0, 0, 0);
      text("O", 134, 442);
    }
    if (clickBounce == true) {
      fill(135, 100, 100);
      rect(125, 430, 50, 15);
      fill(0, 0, 90);
      rect(150, 430, 25, 15);
      fill(0);
      text("I", 160, 442);
    }


    textSize(16);
    fill(h, 75, 90);
    text("Alternate jump key (for non-compatible devices) -", 50, 420);
    text("Click", 50, 445);

    // Spacebar: to jump
    //Mouse click: to select level
  } else if (level == 2) {//BackStory
    background(0, 0, 0);
    image(bgpic, 0, 0);
    backHome.display();
    backHome.use();

    fill(h, 75, 90);
    textSize(28);
    text("Gravity Ball Maze", 50, 75);

    background(0, 0, 0);
    image(bgpic, 0, 0);
    backHome.display();
    backHome.use();

    // Title
    fill(h, 75, 90);
    textSize(28);
    text("Gravity Ball Maze - Backstory", 50, 75);

    // Text
    textSize(16);
    text("Hello human we are the Marsonians from the planet Mars.io", 50, 150);
    text("We are here to conduct experiments with your kind to see how our Transmutation", 50, 175);
    text("machine works.", 50, 200);
    text("We will also test our perpetual motion machines.", 50, 225);
    text("You will be put into a series of tests to see if you lose any brainpower through", 50, 250); // Add there are perpetual motion machines involved ---------------------------------------------------------------------------------------------------------------------------
    text("the transformation.", 50, 275);                                                              // There may also be some strange gravitational properties aswell...
    text("The machine works by turning your body into a sphere, and moving your", 50, 300);
    text("nervous system functions into a computer which has a camera on your body.", 50, 325);
    text("If you wish to survive these trials you must make it to the purple box that will be", 50, 350);
    text("at the end of the trials.", 50, 375);
    textSize(20);
    text("You may begin at any time, we are always waiting.", 50, 425);


    //Aliens from the planet Mars.io abducted you and transformed you into a ball. The only way to become a human again is to get to the purple transmutation device at the end of each of the mazes.
  } else if (level == 3) { //Credits Screen --------------------- CREDITS
    background(0, 0, 0);
    image(bgpic, 0, 0);
    backHome.display();
    backHome.use();

    fill(h, 75, 90);
    textSize(28);
    text("Gravity Ball Maze - Credits", 50, 75);

    fill(h, 75, 90);
    textSize(24);
    text("Game Designers -", 50, 165);

    textSize(20);
    text("Mikk Sanborn and Adam Tobin-Williams", 50, 205);

    textSize(24);
    text("Project Directed by -", 50, 266); // Directed by or dedicated to??

    textSize(20);
    text("Denver Guess", 50, 305); // Denver or Mr. ???

    textSize(24);
    text("Photo Credits -", 50, 375);

    if (mouseX > 50 && mouseX < 740 && mouseY > 384 && mouseY < 400) { // hover
      fill(310, 60, 60);
      textSize(16);
      text("Background: " + bgploc, 50, 400);
      // text("Background - http://androidmarket.cz/ruzne/top-10-nejstahovanejsich-pozadi-vzory/", 50, 400);
    } else { // neither
      fill(310, 60, 80);
      textSize(16);
      text("Background: " + bgploc, 50, 400);
      // text("Background - http://androidmarket.cz/ruzne/top-10-nejstahovanejsich-pozadi-vzory/", 50, 400);
    }
    fill(h, 75, 80);
    textSize(12);
    // text("Machoczek, Michal. “TOP 10 Nejstahovanějších Pozadí: VzoryAndroidmarket.cz.” Androidmarket.cz, AdroidMarket,", 50, 425);
    // text("12 Oct. 2014, androidmarket.cz/ruzne/top-10-nejstahovanejsich-pozadi-vzory/", 50, 440);
  } else if (level == 4) { //Loading Screen
    background(0, 0, 0);
    image(bgpic, 0, 0);

    backHome.display();
    backHome.use();

    fill(h, 75, 90);
    textSize(36);
    text("Gravity Ball Maze", 252, 125);
    textSize(24);

    fill(0, 0, 100);
    if (mouseX > 150 && mouseY > 200 && mouseX < 350 && mouseY < 350) {
      fill(0, 0, 75);
    }
    rect(150, 200, 200, 150, 7.5);
    fill(0, 0, 0);
    text("New Game", 187, 283);

    fill(0, 0, 100);
    if (mouseX > 450 && mouseY > 200 && mouseX < 650 && mouseY < 350) {
      fill(0, 0, 75);
    }
    rect(450, 200, 200, 150, 7.5);
    fill(0, 0, 0);
    text("Load Game", 485, 283);
  } else if (level == 5) {
    background(0, 0, 0);
    image(bgpic, 0, 0);

    backHome.display();
    backHome.use();

    fill(h, 75, 90);
    textSize(36);
    text("Gravity Ball Maze - Load Game", 125, 125);

    fill(0, 0, 100);
    if (mouseX > 100 && mouseX < 275 && mouseY > 200 && mouseY < 350) {
      fill(0, 0, 75);
    }
    rect(100, 200, 175, 150, 7.5);

    fill(0, 0, 100);
    if (mouseX > 312.5 && mouseX < 487.5  && mouseY > 200 && mouseY < 350 && hs1 != 0) {
      fill(0, 0, 75);
    }
    rect(312.5, 200, 175, 150, 7.5);

    fill(0, 0, 100);
    if (mouseX > 525 && mouseX < 700 && mouseY > 200 && mouseY < 350 && hs2 != 0) {
      fill(0, 0, 75);
    }
    rect(525, 200, 175, 150, 7.5);

    textSize(24);
    fill(0);

    text("Level 1", 148, 280);
    text("Level 2", 360.5, 280);
    text("Level 3", 573, 280);
  } else if (level == 8) {
    background(0, 0, 0);
    stroke(0, 0, 0);
    fill(0, 0, 100);
    textSize(12);
    text("You shouldn't be here...", 100, 100);

    backHome.use();

    // ==========================================================================================================================================================================================================================
    //                                         LEVEL DESIGN                                         LEVEL DESIGN                                         LEVEL DESIGN                                         LEVEL DESIGN       
    // ___________________________________________________________________________________________________________________________________________________________________________________________________________________________
  } else if (level > 10) {
    // background
    background(0, 0, 0);
    image(bgpic, 0, 0);
    // border
    noStroke();
    fill(240, 80, 80);
    rect(0, 475, 800, 25);
    rect(0, 0, 800, 25);
    rect(0, 0, 25, 500);
    rect(775, 0, 25, 500);
    bmain.display();
    bmain.move();
    bmain.jump();
    ballactive = true;

    sI = 1.5;

    if (level == 11) { // level 1
      noStroke();
      sI = sI;
      fill(280, 80, 75, 60);
      rect(650, 400, 125, 75);

      // ball


      // triangles (stage obstacles)
      t1.display();
      t1.use();
      t2.display();
      t2.use();
      t3.display();
      t3.use();
      t4.display();
      t4.use();
      // t5.display();
      // t5.use();
      t6.display();
      t6.use();
      t7.display();
      t7.use();
      t8.display();
      t8.use();
      t9.display();
      t9.use();
      t10.display();
      t10.use();

      if ( bmain.xpos > 625 && bmain.ypos > 400 && waitWin == 180) {
        waitWin = 179;
      }

      if (waitWin < 180 && waitWin > 0 && bmain.xpos > 625 && bmain.ypos > 400) {
        waitWin--;
      } else {
        waitWin = 180;
      }
      if (waitWin == 0 && bmain.xpos > 625 && bmain.ypos > 400) {
        level = 12;
        levelsave = 12;
        bmain.xpos = 200;
        bmain.ypos = 400;
        bmain.xspeed = 0;
        bmain.yspeed = 0;
        if (hs1 == 0 || timer < hs1) {
          hs1 = timer;
        }
        timer = 0;
      }
    }

    if (level == 12) {
      // sI = 1.50;

      t11.display();
      t11.use();
      t12.display();
      t12.use();
      t13.display();
      t13.use();
      t14.display();
      t14.use();
      t15.display();
      t15.use();
      t16.display();
      t16.use();
      t17.display();
      t17.use();
      t18.display();
      t18.use();
      t19.display();
      t19.use();
      t20.display();
      t20.use();
      t21.display();
      t21.use();
      t22.display();
      t22.use();
      t23.display();
      t23.use();
      t24.display();
      t24.use();
      t25.display();
      t25.use();
      t26.display();
      t26.use();
      t27.display();
      t27.use();
      t28.display();
      t28.use();


      noStroke();
      fill(280, 80, 75, 60);
      rect(479, 160, 121, 62);

      if ( bmain.xpos > 479 && bmain.ypos > 160 && bmain.xpos < 600 && bmain.ypos < 222 && waitWin == 180) {
        waitWin = 179;
      }

      if (waitWin < 180 && waitWin > 0 && bmain.xpos > 479 && bmain.ypos > 160 && bmain.xpos < 600 && bmain.ypos < 222) {
        waitWin--;
      } else {
        waitWin = 180;
      }
      if (waitWin == 0 && bmain.xpos > 479 && bmain.ypos > 160 && bmain.xpos < 600 && bmain.ypos < 222) {
        level = 13;
        levelsave = 13;
        bmain.xpos = 50;
        bmain. ypos = 365;
        bmain.xspeed = 0;
        if (hs2 == 0 || timer < hs2) {
          hs2 = timer;
        }
        timer = 0;
      }
    }

    if (level == 13) {

      t29.display();
      t29.use();
      t30.display();
      t30.use();
      t31.display();
      t31.use();
      t32.display();
      t32.use();
      t33.display();
      t33.use();
      t34.display();
      t34.use();
      t35.display();
      t35.use();
      t36.display();
      t36.use();
      t37.display();
      t37.use();
      t38.display();
      t38.use();
      t39.display();
      t39.use();
      t40.display();
      t40.use();
      t41.display();
      t41.use();
      t42.display();
      t42.use();
      t43.display();
      t43.use();
      t44.display();
      t44.use();
      t45.display();
      t45.use();
      t46.display();
      t46.use();
      t47.display();
      t47.use();
      t48.display();
      t48.use();
      t49.display();
      t49.use();
      t50.display();
      t50.use();
      t51.display();
      t51.use();
      t52.display();
      t52.use();
      t53.display();
      t53.use();
      t54.display();
      t54.use();
      t55.display();
      t55.use();
      t56.display();
      t56.use();
      t57.display();
      t57.use();
      t58.display();
      t58.use();
      t59.display();
      t59.use();
      t60.display();
      t60.use();
      t61.display();
      t61.use();
      t162.display();
      t162.use();
      t63.display();
      t63.use();
      t64.display();
      t64.use();


      noStroke();
      fill(280, 80, 75, 60);
      rect(350, 180, 47, 46);

      if ( bmain.xpos > 350 && bmain.ypos > 170 && bmain.xpos < 400 && bmain.ypos < 235 && waitWin == 180) {
        waitWin = 179;
      }

      if (waitWin < 180 && waitWin > 0 && bmain.xpos > 350 && bmain.ypos > 170 && bmain.xpos < 400 && bmain.ypos < 235 && bmain.ypos < 222) {
        waitWin--;
      } else {
        waitWin = 180;
      }
      if (waitWin == 0 && bmain.xpos > 350 && bmain.ypos > 170 && bmain.xpos < 400 && bmain.ypos < 235) {
        level = 0; // reset to beginning screen
        levelsave = 13;
        bmain.xpos = 100;
        bmain. ypos = 400;
        bmain.xspeed = 0;
        if (hs3 == 0 || timer < hs3) {
          hs3 = timer;
        }
        timer = 0;
      }
    }



    // timer display
    if (level == 13) {
      fill(0, 0, 100);
      noStroke();
      if (timer/afr <= 9) {
        rect(757, 30, 19, 27);
      }
      if (timer/afr > 9 && timer/afr <= 99) {
        rect(743, 30, 33, 22);
      }
      if (timer/afr > 99 && timer/afr <= 999) {
        rect(728, 30, 48, 23);
      }
      if (timer/afr > 999) {
        rect(712, 30, 64, 24);
      }
    }
    fill(0, 0, 0);
    textSize(24);
    if (timer/afr <= 9) {
      text(ceil(timer/afr), 758, 50);
    }
    if (timer/afr > 9 && timer/afr <= 99) {
      text(ceil(timer/afr), 744, 50);
    }
    if (timer/afr > 99 && timer/afr <= 999) {
      text(ceil(timer/afr), 728, 50);
    }
    if (timer/afr > 999) {
      text(ceil(timer/afr), 712, 50);
    }

    // pause button
    pause.pauseDisplay();
    pause.pauseUse();
  }

  if (paused) {
    pause.pauseOverlay();
  }

  fill(0, 0, 100);
  textSize(16);

  if (keyPressed && key == 'r') {
    bmain.xpos = 100;
    bmain.ypos = 400;
    bmain.xspeed = 0;
    bmain.yspeed = 0;
  }

  if (keyPressed && key == 'r' && level == 12) {
    bmain.xpos = 200;
    bmain.ypos = 400;
    bmain.xspeed = 0;
    bmain.yspeed = 0;
  }
  if (keyPressed && key == 'r' && level == 13) {
    bmain.xpos = 50;
    bmain.ypos = 365;
    bmain.xspeed = 0;
    bmain.yspeed = 0;
  }

  if (ballactive) {
    timer++;
  }

  if (showDebugInfo) {
    fill(0, 0, 100);
    rect(0, 0, 190, 30);
    textSize(24);
    fill(0);
    text("Debug Info: On", 5, 24);
  }


  fill(0);
  rect(0, 500, width, height);
}

void mouseClickedAll() {
  stop = false; // to prevent 2 code links to run simultaniously
  if (mouseX > 50 && mouseX < 740 && mouseY > 384 && mouseY < 400 && level == 3) { // click link
    fill(310, 60, 60);
    textSize(16);
    // text("Background - http://androidmarket.cz/ruzne/top-10-nejstahovanejsich-pozadi-vzory/", 50, 450);
    // link("http://androidmarket.cz/ruzne/top-10-nejstahovanejsich-pozadi-vzory/");
    link(bgploc);
  }


  if (mouseX > 125 && mouseX < 175 && mouseY > 430 && mouseY < 445 && level == 1 && clickBounce == true && stop == false) {
    clickBounce = false;
    stop = true;
  }
  if (mouseX > 125 && mouseX < 175 && mouseY > 430 && mouseY < 445 && level == 1 && clickBounce == false && stop == false) {
    clickBounce = true;
    stop = true;
  }
  stop = false;


  if (level == 5) {
    if (mouseX > 100 && mouseX < 275 && mouseY > 200 && mouseY < 350) { // lv.1 
      level = 11;
      timer = 0;
      bmain.xpos = 100;
      bmain.ypos = 400;
      paused = true;
      bmain.xspeed = 0;
      bmain.yspeed = 0;
    }

    if (mouseX > 312.5 && mouseX < 487.5  && mouseY > 200 && mouseY < 350 && hs1 != 0) { // lv. 2
      level = 12;
      timer = 0;
      bmain.xpos = 100;
      bmain.ypos = 400;
      paused = true;
      bmain.xspeed = 0;
      bmain.yspeed = 0;
    }

    if (mouseX > 525 && mouseX < 700 && mouseY > 200 && mouseY < 350 && hs2 != 0) { // lv.3
      level = 13;
      timer = 0;
      bmain.xpos = 100;
      bmain.ypos = 400;
      paused = true;
      bmain.xspeed = 0;
      bmain.yspeed = 0;
    }
  }
  if (level == 4) { // load game
    if (mouseX > 450 && mouseY > 200 && mouseX < 650 && mouseY < 350) {
      level = 5;
      if (level != 4 && level != 5) {
        paused = true;
      }
    }
  }
  if (level == 4) {
    if (mouseX > 150 && mouseY > 200 && mouseX < 350 && mouseY < 350) {
      level = 11;
      timer = 0;
      bmain.xpos = 100;
      bmain.ypos = 400;
      bmain.xspeed = 0;
      bmain.yspeed = 0;
    }
  }

  if (level == 0) {
    if (mouseX>50 && mouseX<200 && mouseY>110 && mouseY<160) {
      level = 4;
    }
    if (mouseX>50 && mouseX<200 && mouseY>210 && mouseY<260) {
      level = 1;
    }
    if (mouseX>50 && mouseX<200 && mouseY>310 && mouseY<360) {
      level = 2;
    }
    if (mouseX>50 && mouseX<200 && mouseY>410 && mouseY<460) {
      level = 3;
    }
  }
}
