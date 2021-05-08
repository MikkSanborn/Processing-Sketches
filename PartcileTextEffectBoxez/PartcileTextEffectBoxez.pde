/*
Particles text effects
 
 Uses particles with a seek behavior to make up a word.
 The word is loaded into memory so that each particle can figure out their own position they need to seek.
 Inspired by Daniel Shiffman's arrival explantion from The Nature of Code. (natureofcode.com)
 
 Controls:
 - Left-click for a new word.
 - Drag & right-click over particles to interact with them.
 - Press any key to toggle draw styles.
 
 Author:
 Jason Labbe
 
 Site:
 jasonlabbe3d.com
 */

Box sq = new Box(0, 0, 0, 0, color(0, 0, 0), 0.01);

// Global variables
ArrayList<Particle> particles = new ArrayList<Particle>();
int pixelSteps = 6; // Amount of pixels to skip
boolean drawAsPoints = false;
ArrayList<String> words = new ArrayList<String>();
int wordIndex = 0;
color bgColor = color(255, 100);
String fontName = "Arial"; // was "Arial Bold"


class Particle {
  PVector pos = new PVector(0, 0);
  PVector vel = new PVector(0, 0);
  PVector acc = new PVector(0, 0);
  PVector target = new PVector(0, 0);

  float closeEnoughTarget = 50;
  float maxSpeed = 4.0;
  float maxForce = 0.1;
  float particleSize = 5;
  boolean isKilled = false;

  color startColor = color(0);
  color targetColor = color(0);
  float colorWeight = 0;
  float colorBlendRate = 0.025;

  void move() {
    // Check if particle is close enough to its target to slow down
    float proximityMult = 1.0;
    float distance = dist(this.pos.x, this.pos.y, this.target.x, this.target.y);
    if (distance < this.closeEnoughTarget) {
      proximityMult = distance/this.closeEnoughTarget;
    }

    // Add force towards target
    PVector towardsTarget = new PVector(this.target.x, this.target.y);
    towardsTarget.sub(this.pos);
    towardsTarget.normalize();
    towardsTarget.mult(this.maxSpeed*proximityMult);

    PVector steer = new PVector(towardsTarget.x, towardsTarget.y);
    steer.sub(this.vel);
    steer.normalize();
    steer.mult(this.maxForce);
    this.acc.add(steer);

    // Move particle
    this.vel.add(this.acc);
    this.pos.add(this.vel);
    this.acc.mult(0);
  }

  void draw() {
    // Draw particle
    color currentColor = lerpColor(this.startColor, this.targetColor, this.colorWeight);
    if (drawAsPoints) {
      stroke(currentColor);
      point(this.pos.x, this.pos.y);  
      sq.x = this.pos.x;
      sq.y = this.pos.y;
      sq.c = currentColor;
      sq.w = 2;
      sq.display();
    } else {
      noStroke();
      fill(currentColor);
      // ellipse(this.pos.x, this.pos.y, this.particleSize, this.particleSize);
      // rect(this.pos.x-this.particleSize, this.pos.y-this.particleSize, this.particleSize*2, this.particleSize*2);
      sq.x = this.pos.x;
      sq.y = this.pos.y;
      sq.c = currentColor;
      sq.w = 10;
      sq.display();
    }

    // Blend towards its target color
    if (this.colorWeight < 1.0) {
      this.colorWeight = min(this.colorWeight+this.colorBlendRate, 1.0);
    }
  }

  void kill() {
    if (! this.isKilled) {
      // Set its target outside the scene
      PVector randomPos = generateRandomPos(width/2, height/2, (width+height)/2);
      this.target.x = randomPos.x;
      this.target.y = randomPos.y;

      // Begin blending its color to black
      this.startColor = lerpColor(this.startColor, this.targetColor, this.colorWeight);
      this.targetColor = color(0);
      this.colorWeight = 0;

      this.isKilled = true;
    }
  }
}


// Picks a random position from a point's radius
PVector generateRandomPos(int x, int y, float mag) {
  PVector randomDir = new PVector(random(0, width), random(0, height));

  PVector pos = new PVector(x, y);
  pos.sub(randomDir);
  pos.normalize();
  pos.mult(mag);
  pos.add(x, y);

  return pos;
}


// Makes all particles draw the next word
void nextWord(String word) {
  // Draw word in memory
  PGraphics pg = createGraphics(width, height);
  pg.beginDraw();
  pg.fill(0);
  pg.textSize(100);
  pg.textAlign(CENTER);
  PFont font = createFont(fontName, 100);
  pg.textFont(font);
  pg.text(word, width/2, height/2);
  pg.endDraw();
  pg.loadPixels();

  // Next color for all pixels to change to
  color newColor = color(random(0.0, 255.0), random(0.0, 255.0), random(0.0, 255.0));

  int particleCount = particles.size();
  int particleIndex = 0;

  // Collect coordinates as indexes into an array
  // This is so we can randomly pick them to get a more fluid motion
  ArrayList<Integer> coordsIndexes = new ArrayList<Integer>();
  for (int i = 0; i < (width*height)-1; i+= pixelSteps) {
    coordsIndexes.add(i);
  }

  for (int i = 0; i < coordsIndexes.size (); i++) {
    // Pick a random coordinate
    int randomIndex = (int)random(0, coordsIndexes.size());
    int coordIndex = coordsIndexes.get(randomIndex);
    coordsIndexes.remove(randomIndex);

    // Only continue if the pixel is not blank
    if (pg.pixels[coordIndex] != 0) {
      // Convert index to its coordinates
      int x = coordIndex % width;
      int y = coordIndex / width;

      Particle newParticle;

      if (particleIndex < particleCount) {
        // Use a particle that's already on the screen 
        newParticle = particles.get(particleIndex);
        newParticle.isKilled = false;
        particleIndex += 1;
      } else {
        // Create a new particle
        newParticle = new Particle();

        PVector randomPos = generateRandomPos(width/2, height/2, (width+height)/2);
        newParticle.pos.x = randomPos.x;
        newParticle.pos.y = randomPos.y;

        newParticle.maxSpeed = random(2.0, 5.0);
        newParticle.maxForce = newParticle.maxSpeed*0.025;
        newParticle.particleSize = random(3, 6);
        newParticle.colorBlendRate = random(0.0025, 0.03);

        particles.add(newParticle);
      }

      // Blend it from its current color
      newParticle.startColor = lerpColor(newParticle.startColor, newParticle.targetColor, newParticle.colorWeight);
      newParticle.targetColor = newColor;
      newParticle.colorWeight = 0;

      // Assign the particle's new target to seek
      newParticle.target.x = x;
      newParticle.target.y = y;
    }
  }

  // Kill off any left over particles
  if (particleIndex < particleCount) {
    for (int i = particleIndex; i < particleCount; i++) {
      Particle particle = particles.get(i);
      particle.kill();
    }
  }
}


void setup() {
  size(1000, 750);
  background(255);

  /*
  words.add("JAVA");
   words.add("Python <3");
   words.add("C++");
   words.add("Bye :-)");
   words.add("");
   */
  // words.add("Portal 2");
  // words.add("sin(θ) = o/h");
  // words.add("ʕ•ᴥ•ʔ");
  // words.add("Multi\nLine");
  words.add("+");
  // words.add("Black Lotus");

  nextWord(words.get(wordIndex));
}


void draw() {
  // Background & motion blur
  fill(bgColor);
  noStroke();
  rect(0, 0, width*2, height*2);

  for (int x = particles.size ()-1; x > -1; x--) {
    // Simulate and draw pixels
    Particle particle = particles.get(x);
    particle.move();
    particle.draw();

    // Remove any dead pixels out of bounds
    if (particle.isKilled) {
      if (particle.pos.x < 0 || particle.pos.x > width || particle.pos.y < 0 || particle.pos.y > height) {
        particles.remove(particle);
      }
    }
  }

  // Display control tips
  fill(255-red(bgColor));
  textSize(9);
  String tipText = "Left-click for a new word.";
  tipText += "\nDrag right-click over particles to interact with them.";
  tipText += "\nPress any key to toggle draw styles.";
  text(tipText, 10, height-40);
  
  // println(frameRate);
}

void keyReleased() {
  if (keyCode == UP && newWord2 != "") {
    if (words.get(0).equals("+")) {
      words.set(0, newWord2);
    } else {
      words.add(newWord2);
    }

    // added = true;
    lastChar = DOWN;
    println("[ phrase added ]  -  \"" + newWord2 + "\"");
    newWord2 = "";
  }
  if ((keyCode == ALT || keyCode == TAB)) {
    lastChar = '`';
    key = ALT;
    keyCode = ALT;
  }
  if (keyCode == BACKSPACE && newWord2.length() >= 1) {
    char[] a = newWord2.toCharArray();
    newWord2 = "";
    
    for (int i = 0; i< a.length-1; i++) {
      newWord2 += a[i];
    }
    println("- Key " + a[a.length-1] + " removed");
  } else // added to prevent adding an uncoded char in string
  if (keyCode == DELETE) {
    lastChar = '`';
    key = ALT;
    keyCode = ALT;
    newWord2 = "";
  } else // added to ensure [DEL] (/null) is not added
  if (key != lastChar && keyCode != ALT && keyCode != TAB && keyCode != SHIFT && keyCode != UP && keyCode != DOWN && keyCode != BACKSPACE) {
    newWord2 += key;
    keyPressed = false;
    lastChar = key;
    println("+ Key " + lastChar + " appended");
    key = ALT;
    keyCode = ALT;
    lastChar = key;
  }
}

char lastChar = '`';
String newWord2 = "";
boolean added = false;

// Show next word
void mousePressed() {
  if (mouseButton == LEFT) {
    wordIndex += 1;
    if (wordIndex > words.size()-1) { 
      wordIndex = 0;
    }
    nextWord(words.get(wordIndex));
  }
}


// Kill pixels that are in range
void mouseDragged() {
  if (mouseButton == RIGHT) {
    for (Particle particle : particles) {
      if (dist(particle.pos.x, particle.pos.y, mouseX, mouseY) < 25) {
        particle.kill();
      }
    }
  }
}


// Toggle draw modes
void mouseWheel() {
  drawAsPoints = (! drawAsPoints);
  if (drawAsPoints) {
    background(0);
    bgColor = color(0, 40);
  } else {
    background(255);
    bgColor = color(255, 100);
  }
}

class Box {
  float x, y, xs, ys;
  float theta, thetaInc;
  int w;
  color c;

  Box(float xt, float yt, float xst, float yst, color ct, float thetaInct) {
    x = xt;
    y = yt;
    xs = xst;
    ys = yst;
    c = ct;
    theta = 0;
    thetaInc = thetaInct;

    w = 10;
  }

  void display() {
    pushMatrix();
    translate(x, y);
    rotate(theta);
    theta += thetaInc;
    noStroke();
    fill(c);
    rect(-w/2, -w/2, w, w);
    popMatrix();
  }

  void move() {
    x += xs;
    y += ys;

    if (x-w/2 <= 0) {
      xs*=-1;
      x = w/2+1;
    } else if (x+w/2 > width) {
      xs*=-1;
      x = width-w/2-1;
    }
    if (y-w/2 <=0) {
      ys*=-1;
      y = w/2+1;
    } else if (y+w/2 >= height) {
      ys*=-1;
      y = height-w/2-1;
    }
  }
}
