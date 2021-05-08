public void calculateScreen(int timeStamp) {
  int seconds = timeStamp/afr;

  // draw stuffs
  for (int i = 0; i < screenDrawTimes.length-1; i++) {
    if (seconds >= timeRanges[i] && seconds < timeRanges[i+1]) {
      displayScreen(i, (timeStamp-(int) (timeRanges[i]*afr)));
      return;
    }
  }
  displayScreen(screenDrawTimes.length, (timeStamp-(int) (timeRanges[screenDrawTimes.length-1]*afr)));
}

public int prevScreen = -1; // FLAGGED TO REMOVE >>{[<|||>]}<<

public void displayScreen(int n, int framesDisplayed) { // add screens
  if (n != prevScreen) { // FLAGGED TO REMOVE  >>{[<|||>]}<<
    println(n);
    prevScreen = n;
    background(0);
  }

  pushStyle();
  textFont(myFont);

  noFill();
  noStroke();
  textSize(fS);

  if (n == 0) {
    screen0(n, framesDisplayed);
  } else if (n == 1) {
    screen1(n, framesDisplayed);
  } else if (n == 2) {
    screen2(n, framesDisplayed);
  } else if (n == 3) {
    screen3(n, framesDisplayed);
  } else if (n == 4) {
    screen4(n, framesDisplayed);
  } else if (n == 5) {
    screen5(n, framesDisplayed);
  } else if (n == 6) {
    screen6(n, framesDisplayed);
  } else if (n == 7) {
    screen7(n, framesDisplayed);
  } else if (n == 8) {
    screen8(n, framesDisplayed);
  } else if (n == 9) {
    screen9(n, framesDisplayed);
  } else {
    screenDefault(n, framesDisplayed);
  }

  popStyle();
}

public void screen0(int n, int framesDisplayed) {
  // Title
  // Background
  image(Images[0], 0, 0, width, height);

  // Text
  fill(0);
  textSize(24);
  text(poem[0], 125, 50);
  text((hasLoadedAudio ? "Click to show poem":"Preparing audio... please standby"), (hasLoadedAudio ? 170:115), 475);

  // Fade to next slide
  fill(255, 1.0*framesDisplayed/afr*80);
  rect(0, 0, width, height);
}

public void screen1(int n, int framesDisplayed) {
  // Line 1
  float l = 255-18.0*framesDisplayed; // 18 is fade speed, 255 is origin
  background((l >= 0 && l <= 255 ? l:0)); // Fade in, background

  fill(255);
  text(poem[1], 80, 260);
  // Line 1: "Remember when you were young,"
  // Syd?
}

public void screen2(int n, int framesDisplayed) {
  background(0);

  fill(255);
  text(poem[2], 0, height);
  // Line 2: "You shone like the sun"
  // Screen1+Light orb over landscape? (Screen 1 IS the sun)
}

public void screen3(int n, int framesDisplayed) {
  background(0);
  image(Gifs[0][(framesDisplayed)%18], (width-400)/2, (height-350)/2, 400, 350);

  textSize(fS*1.5);
  fill(255);
  text(poem[3], 80, 300);

  //               possibly reduce to change speed

  // Line 3: "Shine on you crazy diamond!"
  // Screen 2 + Diamond spinning? (Animate a diamond, 3 framesfor now)
  // check the spinnydiamond class
}

public void screen4(int n, int framesDisplayed) {
  background(0);
  // Line 4: "Now there's a look in your eye,"
  fill(255);
  text(poem[4], 100, 300);
  // Iris?
}

public void screen5(int n, int framesDisplayed) {
  background(0);
  // Line 5: "Like black holes in the sky"
  fill(255);
  text(poem[5], 100, 300);
  // Srg. A?
}

public void screen6(int n, int framesDisplayed) {
  background(0);
  // Line 6: "Shine on you crazy diamond!"
  fill(255);
  text(poem[6], 100, 300);
  // Diamond again? chek line 3...
}

public void screen7(int n, int framesDisplayed) {
  background(0);
  // Line 7: "You were caught in the crossfire of childhood and stardom,"
  fill(255);
  text(poem[7], 100, 300);
  // flying yellow streaks (crossfire) with white spots (for stardom)... stardom? idk?
}

public void screen8(int n, int framesDisplayed) {
  background(0);
  // Line 8: "Blown on the steel breeze"
  fill(255);
  text(poem[8], 100, 300);
  // lots of particles on a wave to the right? <Breeze>
}

public void screen9(int n, int framesDisplayed) {
  background(0);
  // Line 9: "~Pink Floyd"
  fill(255);
  text(poem[9], 100, 300);
  // Album cover/band picture
}

public void screenDefault(int n, int framesDisplayed) {
  background(255);
  if (file.isPlaying()) {
    file.stop();
    isPlayingAudio = false;
  }
}
