import de.voidplus.leapmotion.*;

/*
Create a project in Processing that uses the Leap for hand input. In this program, display an image on screen (in the middle of the program). 
You get to choose which of the following to use, but your program must use either the yaw, pitch, or roll of one of your hands to rotate the on screen image. 
The amount of rotation should map to the motion of your hand; a large change in your yaw/pitch/roll should create a large rotation for the image. 
If you "zero" out your hand motion (neutral position), then the image rotation should also go back to zero.

Create a program
use leap for hand input
display an image that:
  is in the center
  uses Yaw, Pitch, or Roll to rotate the image
    Rotation should map decently
    zero roll = zero tilt (on screen)
*/


PImage img;

LeapMotion leap;

void setup() {
  size(500, 500);
  
  leap = new LeapMotion(this);
  
  img = loadImage("img.png");
}

void draw() {
  background(255);
  
  pushMatrix();
  translate(width/2, height/2);
  if (leap.countHands() > 0) {
    println(leap.getHands().get(0).getRoll());
    rotate(radians(leap.getHands().get(0).getRoll()));
  }
  image(img, -img.width/2, -img.height/2);
  popMatrix();
}
