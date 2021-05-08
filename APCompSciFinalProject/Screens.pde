public void calculateScreen(int timeStamp) {
  int seconds = timeStamp/afr;

  for (int i = 0; i < screenDrawTimes.length-1; i++) {
    if (seconds >= timeRanges[i] && seconds < timeRanges[i+1]) {
      displayScreen(i, (timeStamp-(int) (timeRanges[i]*afr)));
      return;
    }
  }
  displayScreen(screenDrawTimes.length, (timeStamp-(int) (timeRanges[screenDrawTimes.length-1]*afr)));
}

public void displayScreen(int n, int framesDisplayed) {
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
  background(0);
  image(Images[0], 0, 0, width, height);

  // Text
  fill(0);
  textSize(24);
  text(poem[0], 125, 50);
  text((hasLoadedAudio ? "Click to show poem":"Preparing audio... please standby"), (hasLoadedAudio ? 170:115), 475);

  // Fade to next screen
  fill(255, 1.0*framesDisplayed/afr*80);
  rect(0, 0, width, height);
}

public void screen1(int n, int framesDisplayed) {
  float l = 255-18.0*framesDisplayed; // 18 is fade speed, 255 is origin
  background(0); // Fade in, background

  // Clock
  strokeWeight(3);
  stroke(220, 203, 36);
  fill(255);
  ellipse(width/2, 100, 62.5*2, 62.5*2);
  line(width/2, 100, width/2+60*sin(framesDisplayed/2.5), 100+60*cos(framesDisplayed/2.5));
  line(width/2, 100, width/2+60*sin(framesDisplayed/60.0), 100+60*cos(framesDisplayed/60.0));

  // Text
  fill(255);
  text(poem[1], 80, 200);

  // Syd
  fill(45);
  rect(25, height/2-25, width/2, height/2);
  fill(255);
  textSize(fS*0.66);
  text("Syd Barrett", width/2+30, height-50);
  image(Images[1], 25, height/2-25, width/2, height/2);

  // The fading overlay
  noStroke();
  fill(255, (l >= 0 && l <= 255 ? l:0));
  rect(0, 0, width, height);
}

public void screen2(int n, int framesDisplayed) {
  background(0);

  noStroke();

  // Sky
  fill(151, 238, 245);
  rect(0, 0, width, height);

  // Ground
  float R1, R2, G1, G2, B1, B2;

  // Green
  R1 = 89;
  G1 = 237;
  B1 = 41;

  // Brown
  R2 = 188;
  G2 = 125;
  B2 = 42;

  // Sun
  fill(255, 236, 21);
  ellipse(width/2+350*cos(3.4+framesDisplayed/40.0), 300+275*sin(3.4+framesDisplayed/40.0), 50, 50);

  // Mountains
  fill(157);
  triangle(275, 300, 475, 300, 375, 80);
  fill(168);
  triangle(200, 350, 400, 350, 300, 130);

  // Bushes ("shrubbery")
  fill(R1, G1, B1);
  ellipse(135, 320, 70, 115);
  fill(60, 206, 48);
  ellipse(50, 300, 125, 70);

  // Clouds
  fill(240);
  ellipse(200+framesDisplayed/2.5, 50, 125, 45);
  ellipse(280+framesDisplayed/2.5, 55, 105, 45);
  ellipse(160+framesDisplayed/1.75, 45, 50, 40);
  ellipse(185+framesDisplayed/1.67, 65, 50, 40);
  ellipse(340+framesDisplayed/1.5, 50, 97.5, 32.5);

  // Gradient ground
  for (int i = 300; i < height; i+=5) {
    fill(lerp(R1, R2, (i-300)*1.0/200), lerp(G1, G2, (i-300)*1.0/200), lerp(B1, B2, (i-300)*1.0/200));
    rect(0, i, width, 5);
  }

  // Text
  fill(80, 80, 255);
  textSize(fS*2);
  text(poem[2], 20+framesDisplayed*.8, height-150);

  // Overlaying fade based on time
  fill(0, (1.5*(40-framesDisplayed) > 0 ? 1.5*(40-framesDisplayed):0));
  rect(0, 0, width, height);
  fill(0, (1.5*(-60+framesDisplayed) > 0 ? 1.5*(-60+framesDisplayed):0));
  rect(0, 0, width, height);
}

public void screen3(int n, int framesDisplayed) {
  background(0);

  // Show GIF
  image(Gifs[0][(framesDisplayed)%18], (width-350)/2, (height-400)/2, 350, 400);

  // Text
  textSize(fS*1.5);
  fill(149, 255, 254);
  text(poem[3], 80, 300);
}

public void screen4(int n, int framesDisplayed) {
  background(255, 245, 209);

  // Display image
  pushMatrix();
  translate(250, 250);
  scale(1+abs(sq(framesDisplayed%20-10)/320.0));
  rotate(sq(framesDisplayed)/2000.0);
  image(Images[2], -150, -150, 300, 300);
  popMatrix();

  // Text
  fill(0);
  text(poem[4], 120, 480);
}

public void screen5(int n, int framesDisplayed) {
  background(0);

  // In case frames have not loaded (somehow), show error message
  fill(255);
  text("Frames not loaded.", 100, height/2);

  // Do not crash program if images not loaded
  try {
    image(Gifs[1][framesDisplayed%90], 10, 115, 480, 270); // original size. Also, yes, I know this is not a black hole... but it looks cool, so I chose this.
  } 
  catch (NullPointerException e) {
  }

  // Text
  fill(196, 91, 234);
  text(poem[5], 100, 480);
}

public void screen6(int n, int framesDisplayed) {
  background(0);

  // Image
  pushMatrix();
  translate(width/2, height/2);
  rotate(framesDisplayed/30.0);
  image(Gifs[0][(framesDisplayed)%18], -150, -200, 350, 400);
  popMatrix();

  // Text
  textSize(fS*0.8+framesDisplayed/fS);
  fill(149, 255, 254);
  textSize(fS*1.4);
  text(poem[6], 60+20*cos(framesDisplayed/30.0), 450);
}

public void screen7(int n, int framesDisplayed) {
  background(0);

  // Images
  image(Images[3], 0, 52, width, 396); // aspect ratio maintained
  image(Images[1], width-150, height-150, 150, 150);

  // Text
  fill(255);
  text(poem[7].substring(0, 32), 110-framesDisplayed/2.0, 26);
  text(poem[7].substring(32), 130+framesDisplayed/2.0, 50);
  fill(framesDisplayed < 255 ? framesDisplayed:255);

  // Crossfire
  noStroke();
  fill(221, 220, 164);
  for (int i = 0; i < 20; i++) {
    if (i < 10 || i > 15) { // add a gap
      ellipse(-2000+i*100+framesDisplayed*22, i*1+230+framesDisplayed*0.1, 16, 4);
      ellipse(2000+i*-100+framesDisplayed*-24, i*1+140+framesDisplayed*0.3, 16, 4);
    }
  }
}

public void screen8(int n, int framesDisplayed) {
  background(0);

  // Text
  textSize(fS*1.2);
  fill(130, 70, 6);
  text(poem[8], 100+leaves[0].getX()/4.0, 200+leaves[0].getY()/3.0);

  // Show leaves
  for (int i = 0; i < leaves.length; i++) {
    leaves[i].move();
    leaves[i].display();
  }
}

public void screen9(int n, int framesDisplayed) {
  background(0);

  for (int i = 0; i < leaves.length; i++) {
    leaves[i].setXS(-8.0*(leaves[i].getX()-mouseX)/width);
    leaves[i].setYS(-8.0*(leaves[i].getY()-mouseY)/height);

    leaves[i].move();
    leaves[i].display();
  }

  // Text
  fill(255);
  text(poem[9], 100, 300);
}

public void screenDefault(int n, int framesDisplayed) {
  background(255);

  // Text
  fill(0);
  textSize(24); // Not set relative to font size. Needs to be visible, always
  text("Press 'R' to restart", width/2-80, height/2+10); // add album cover?

  for (int i = 0; i < leaves.length; i++) {
    leaves[i].setXS(-8.0*(leaves[i].getX()-mouseX)/width);
    leaves[i].setYS(-8.0*(leaves[i].getY()-mouseY)/height);

    leaves[i].move();
    leaves[i].display();
  }

  // Stop playing music, if it has been loaded
  try {
    if (file.isPlaying()) {
      file.stop();
      isPlayingAudio = false;
    }
  } 
  catch (NullPointerException e) {
    isPlayingAudio = false;
  }
}

public class Leaf {
  private float x, y;
  private float xs, ys;
  private byte imageIndex;
  private float t;

  public Leaf() {
    x = random(0, width);
    y = random(0, width);
    xs = random(1, 5);
    ys = random(-.1, -1);
    imageIndex = (byte) (4 + (int) random(0, 3));
    t = random(0, TWO_PI);
  }

  public void display() {
    pushMatrix();
    translate(x, y);
    rotate(t);
    image(Images[imageIndex], -5, -5, 10, 10);
    popMatrix();
  }

  public void move() {
    xs+=random(-0.1, 0.1);
    ys+=random(-0.1, 0.1);
    x+=xs;
    y+=ys;
    t+=(xs+sqrt(abs(ys)))/16.0;
  }

  public float getX() {
    return x;
  }

  public float getY() {
    return y;
  }

  public void setXS(float xs) {
    this.xs = xs;
  }

  public void setYS(float ys) {
    this.ys = ys;
  }
}
