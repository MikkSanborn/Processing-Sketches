/*
* AP Computer Science A Final Project
 * ~ Mikk Sanborn
 */

// DUE DATE: June 5, 2019, by 11:59:59 PM

// TASKS:
// Add music? If so, adjust line timings to that -> Completed!
// Re-Adjust timing after adding each screen to animate the lines -> In progress...
// Animate screens -> TO-DO
// Import italic font, import poem font -> Completed!
// Remove flagged lines -> TO-DO
// Reformat all comments -> TO-DO
// write a README.txt file, make sure to describe importing the sound library. -> In progress
// get sleep -> never.

import processing.sound.*;

// LINES
// 0 = Shine On, You Crazy Diamond
// 1 = Remember when you were young,
// 2 = You shone like the sun
// 3 = Shine on you crazy diamond!
// 4 = Now there's a look in your eyes,
// 5 = Like black holes in the sky
// 6 = Shine on you crazy diamond!
// 7 = You were caught in the crossfire of childhood and stardom,
// 8 = Blown on the steel breeze
// 9 = ~Pink Floyd
// 10 = End screen?

//                                  0,   1,   2,    3,   4,   5,   6, 7,  8, 9
public float[] screenDrawTimes = {3.8, 5.4, 4.7, 10.3, 5.8, 5.0, 8.8, 7, 10, 1}; // re-adjust times
// 5, 11, 16, 26, 32, 37, 46, (50?), 53, 64

public int afr = 20;
public float[] timeRanges;

public boolean hasStarted = false;

public String[] poem;

public PImage[] Images;
public PImage[][] Gifs;

public SoundFile file;

public int frames = 0;

public float fS = 24; // fontSize

public boolean isPlayingAudio = false;
public boolean hasLoadedAudio = false;

public PFont myFont;

public void setup() {
  size(500, 500);

  // Set up time ranges
  timeRanges = new float[screenDrawTimes.length+1];

  timeRanges[0] = 0; // starts at 0, then goes to screenDrawTimes[0], ...

  for (int i = 0; i < screenDrawTimes.length; i++) {
    timeRanges[i+1] = timeRanges[i]+screenDrawTimes[i];
  }

  // Gather lines
  poem = loadStrings("Poem.txt");

  // Find images
  Images = new PImage[1];

  Images[0] = loadImage("wish_you_were_here.jpg");

  Gifs = new PImage[1][];

  Gifs[0] = new PImage[18];

  thread("getDiamondGif");

  myFont = createFont(PFont.list()[1], fS);

  thread("prepareAudio"); // Takes a long time, run in parallel to not delay the main program

  frameRate(afr);

  textSize(20);

  background(0);
  println("\r\n\r\n" + false);
}

public void draw() {
  calculateScreen(frames);

  if (hasStarted)
    frames++;
}

void mouseClicked() {
  if (hasLoadedAudio && !hasStarted && !isPlayingAudio) {
    hasStarted = true;
    file.play();
    isPlayingAudio = true;
    println(true);
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

/*
Shine On, You Crazy Diamond
 
 Remember when you were young,  -  display yound syd if possible
 You shone like the sun    -  Sun?
 
 Shine on you crazy diamond!  -  display rotating (3d?) diamond, maybe with flares
 
 Now there's a look in your eye,    -  Focus in on an eye/iris?
 Like black holes in the sky    -  Sgr. A*
 
 Shine on you crazy diamond!  -  Flash back to displaying the rotating (3d?) diamond, maybe with flares
 
 You were caught in the crossfire of childhood and stardom,  -  Yellow lines flashing across screen ("crossfire")
 Blown on the steel breeze          -  Wind/swirl animation.
 
 ~Pink Floyd    -  Album cover, followed by entire poem, written static.
 */
