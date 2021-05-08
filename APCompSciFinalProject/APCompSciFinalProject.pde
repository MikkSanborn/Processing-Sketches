/*
* AP Computer Science A Final Project
 * ~ Mikk Sanborn
 */

// DUE DATE: June 5, 2019, by 11:59:59 PM

// TASKS:
// Remove flagged lines -> TO-DO
// Reformat all comments -> TO-DO
// write a README.txt file, make sure to describe importing the sound library. -> In progress

import processing.sound.*;

public float[] screenDrawTimes = {3.8, 5.1, 4.7, 10.3, 5.8, 5.0, 8.95, 4.5, 5.8, 7.0, 0};

public int afr = 20;
public float[] timeRanges;

public boolean hasStarted = false;

public String[] poem;

public PImage[] Images;
public PImage[][] Gifs;

public SoundFile file;

public int frames = 0;

public float fS = 24;

public Leaf[] leaves;

public boolean isPlayingAudio = false;
public boolean hasLoadedAudio = false;

public PFont myFont;

public void setup() {
  size(500, 500);

  // Set up time ranges
  timeRanges = new float[screenDrawTimes.length+1];

  timeRanges[0] = 0; // starts at 0, then goes to screenDrawTimes[0], ...

  for (int i = 0; i < screenDrawTimes.length-1; i++) {
    timeRanges[i+1] = timeRanges[i]+screenDrawTimes[i];
  }

  // Gather lines
  poem = loadStrings("Poem.txt");

  // Find images
  Images = new PImage[7];

  Images[0] = loadImage("wish_you_were_here.jpg");
  Images[1] = loadImage("Syd.png");
  Images[2] = loadImage("eye.png");
  Images[3] = loadImage("starryNight.jpg");
  Images[4] = loadImage("leaf1.png");
  Images[5] = loadImage("leaf2.png");
  Images[6] = loadImage("leaf3.png");

  Gifs = new PImage[2][];

  Gifs[0] = new PImage[18];
  Gifs[1] = new PImage[90];

  thread("getDiamondGif");
  thread("getPulsarGif");

  // Font
  myFont = createFont(PFont.list()[1], fS);

  // Push audio to memory
  thread("prepareAudio"); // Takes a long time, run in parallel to not delay the main program

  // Create leaves
  leaves = new Leaf[40];

  for (int i = 0; i < leaves.length; i++) {
    leaves[i] = new Leaf();
  }

  frameRate(afr);

  textSize(20);

  background(0);
}

public void draw() {
  calculateScreen(frames);

  if (hasStarted)
    frames++;
}

public void keyReleased() {
  if (key == 'r' || key == 'R') {
    frames = 0;

    // reset leaves
    for (int i = 0; i < leaves.length; i++) {
      leaves[i] = new Leaf();
    }

    // reset music
    file.stop();
    file.play();
  }
}

void mouseClicked() {
  if (hasLoadedAudio && !hasStarted && !isPlayingAudio) {
    hasStarted = true;
    try {
      file.play();
      isPlayingAudio = true;
    } 
    catch (NullPointerException e) {
      isPlayingAudio = false;
      hasLoadedAudio = false;
    }
  }
}

void prepareAudio() {
  file = new SoundFile(this, "audio.mp3");
  hasLoadedAudio = true;
}

void getDiamondGif() {
  Gifs[0][0] = loadImage("crazy_diamond\\frame01.gif");
  Gifs[0][1] = loadImage("crazy_diamond\\frame02.gif");
  Gifs[0][2] = loadImage("crazy_diamond\\frame03.gif");
  Gifs[0][3] = loadImage("crazy_diamond\\frame04.gif");
  Gifs[0][4] = loadImage("crazy_diamond\\frame05.gif");
  Gifs[0][5] = loadImage("crazy_diamond\\frame06.gif");
  Gifs[0][6] = loadImage("crazy_diamond\\frame07.gif");
  Gifs[0][7] = loadImage("crazy_diamond\\frame08.gif");
  Gifs[0][8] = loadImage("crazy_diamond\\frame09.gif");
  Gifs[0][9] = loadImage("crazy_diamond\\frame10.gif");
  Gifs[0][10] = loadImage("crazy_diamond\\frame11.gif");
  Gifs[0][11] = loadImage("crazy_diamond\\frame12.gif");
  Gifs[0][12] = loadImage("crazy_diamond\\frame13.gif");
  Gifs[0][13] = loadImage("crazy_diamond\\frame14.gif");
  Gifs[0][14] = loadImage("crazy_diamond\\frame15.gif");
  Gifs[0][15] = loadImage("crazy_diamond\\frame16.gif");
  Gifs[0][16] = loadImage("crazy_diamond\\frame17.gif");
  Gifs[0][17] = loadImage("crazy_diamond\\frame18.gif");
}

void getPulsarGif() {
  for (int i = 0; i < 90; i++) {
    Gifs[1][i] = loadImage("pulsar\\frame (" + (i+1) + ").gif");
  }
}
