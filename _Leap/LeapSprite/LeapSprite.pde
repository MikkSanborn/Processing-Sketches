/*
For this project, use the images provided in the document above to do the following. 
 Have a character move left and right on screen based on hand data taken from the Leap (might I recommend using the roll of the hand to move right or left). 
 The object should use spritesheet logic to create an animation effect (rather than having a static image float across the screen). 
 If you do left, right, up, and down motion, you can get the full 20 points; otherwise, 19 is the max you can get.
 
 Make project
 use provided image(s)
 have a character move
 move L and R on screen
 use hand pos taken from leap (maybe use roll?)
 for full points, go L, R, U, and D
 */

import de.voidplus.leapmotion.*;

LeapMotion leap;


Runner runner;

void setup() {
  size(500, 500);
  
  PImage sheet = loadImage("sheet.png");

  runner = new Runner(new PImage[] {sheet.get(0, 0, 120, 120), sheet.get(120, 0, 120, 120), sheet.get(240, 0, 120, 120), sheet.get(360, 0, 120, 120), sheet.get(480, 0, 120, 120), sheet.get(600, 0, 120, 120)});

  leap = new LeapMotion(this);
}

void draw() {
  background(255);

  runner.display();
  runner.step();
  // runner.setTarget(mouseX, mouseY);

  if (leap.countHands() > 0) {
    float roll = leap.getHands().get(0).getRoll();
    float pitch = leap.getHands().get(0).getPitch();
    float x = map(roll, -90, 90, 0, width);
    float y = map(pitch, -90, 90, height, 0);

    stroke(0);
    fill(0, 255, 220);
    strokeWeight(2);
    ellipse(x, y, 10, 10);

    runner.setTarget(x, y);
  }
}

class Runner {
  Direction dir;
  Direction prev_dir;

  static final float dir_tolerance = 0.2; // the difference between xs and ys for it to allow changing the direction.

  float dx_frame; // delta of x since frame switch (how much has "x" changed since the frame moved?)
  float dy_frame; // delta of y since frame switch (how much has "y" changed since the frame moved?)

  float x, y;
  float xs, ys;

  int frame_num;

  int frame_w, frame_h;

  static final float accelMax = 0.2;
  static final float d_frame = 4.75; // 5 // delta of any coord before the frame trips (switches) (i.e. if "dx_frames" > "d_frame" or if "dx_frame" < 0

  PImage[] frames;

  public Runner(PImage[] frames) {
    this.frames = frames;

    frame_w = 120;
    frame_h = 120;

    frame_num = 0;

    x = width/2;
    y = height/2;

    xs = 0;
    ys = 0;

    dir = Direction.Right;
  }

  void display() {
    if (dx_frame > d_frame) {
      frame_num++;
      frame_num%=frames.length;
      dx_frame%=d_frame;
    } else if (dx_frame < 0) {
      frame_num--;
      if (frame_num < 0) {
        frame_num = frames.length-1;
      }
      dx_frame+=d_frame;
    }
    if (dy_frame > d_frame) {
      frame_num++;
      frame_num%=frames.length;
      dy_frame%=d_frame;
    } else if (dy_frame < 0) {
      frame_num--;
      if (frame_num < 0) {
        frame_num = frames.length-1;
      }
      dy_frame+=d_frame;
    }

    pushMatrix();
    translate(x+frame_w/2, y+frame_h/2);
    println("     " + xs + "  " + ys);
    switch (dir) {
    case Right:
      rotate(0);
      println("R");
      break;
    case Up:
      rotate(HALF_PI);
      println("D");
      break;
    case Left:
      rotate(0);
      scale(-1.0, 1.0);
      println("L");
      break;
    case Down:
      rotate(HALF_PI);
      scale(-1.0, 1.0);
      println("U");
      break;
    default:
      // println("no");
      break;
    }
    image(frames[frame_num], -frame_w/2, -frame_h/2);
    popMatrix();
  }

  void setTarget(float dest_x, float dest_y) { // "dx" = destination's x, "dy" = dest_y. set dest to this, and change xs and ys to get there
    if (dist(dest_x, dest_y, x+frame_w/2, y+frame_h/2) > frame_w/2.0) {
      /*
      
       |    (dx, dy)
       |       .
       |      /|
       |     / |
       |    /  |
       |   /   |
       |  .____|
       |(x+w/2, y+h/2)
       
       */

      float dx = abs(dest_x-(x+frame_w/2));
      float dy = abs(dest_y-(y+frame_h/2));

      /*
      float d = dist(dest_x, dest_y, x+frame_w/2, y+frame_h/2);
       float theta = atan(dy/dx); // IN RADIANS
       */

      float sp_mult = 0.125;

      xs = sqrt(dx)*(dest_x > x+frame_w/2 ? 1:-1)*sp_mult; // NOT FINAL
      ys = sqrt(dy)*(dest_y > y+frame_h/2 ? 1:-1)*sp_mult; // NOT FINAL
    } else {
      xs = 0;
      ys = 0;
    }
  }

  void step() {
    prev_dir = dir;

    if (abs(xs) >= abs(ys)) {
      // x+=xs;
      // dx_frame+=xs;
      if (xs >= 0) {
        dir = Direction.Right;
      } else {
        dir = Direction.Left;
      }
    } else {
      // y+=ys;
      // dy_frame+=ys;
      if (ys >= 0) {
        dir = Direction.Up;
      } else {
        dir = Direction.Down;
      }
    }

    if (dir != prev_dir) {
      if (abs(xs)-dir_tolerance >= abs(ys)) { // if xs outweighs ys, over tolerance (threshold)
        if (xs >= 0) {
          dir = Direction.Right;
        } else {
          dir = Direction.Left;
        }
        x+=xs;
        dx_frame+=xs;
      } else { // ys outweighs xs, over tolerance (theshold)
        if (ys >= 0) {
          dir = Direction.Up;
        } else {
          dir = Direction.Down;
        }
        y+=ys;
        dy_frame+=ys;
      }
    } else {
      if (dir == Direction.Left || dir == Direction.Right) {
        x+=xs;
        dx_frame+=xs;
      } else {
        y+=ys;
        dy_frame+=ys;
      }
    }
  }
}

enum Direction {
  Right, Down, Left, Up
}
