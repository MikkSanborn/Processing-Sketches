import de.voidplus.leapmotion.*;

LeapMotion leap;
float currX, currY, lastX, lastY;
color currColor, lastColor;

float dirX, dirY;

PGraphics pGraphics;

void setup() {
  size(800, 600);
  leap = new LeapMotion(this);
  noStroke();                      //turns off the outline when drawing a shape
  background(0);
  pGraphics = createGraphics(width,height);
}

void draw() {
 // background(0);
  int numbLeftFingers = 0;
  float currX = width/2, currY = height/2;
  boolean drawStuff = true;
  
  for(Hand hand : leap.getHands()) {
    if(hand.isLeft()) {
      
      //count how many fingers are pointing "up"...up is the negative direction
      //in this library (y-values and y-directions are mapped so that down is positive)
      for(Finger leftFinger : hand.getFingers()) {
        if(leftFinger.getDirection().y > 0)
          numbLeftFingers++;
      }
      dirX = hand.getFinger("index").getDirection().x;
      dirY = hand.getFinger("index").getDirection().y;
      //the problem with this abandoned approach is 
      //that the Leap always "detects" 5 fingers...
      //numbLeftFingers = hand.getFingers().size();  
    }
    else {
      
      Finger indexFinger = hand.getFinger("index");
      
      //The finger's positions are mapped to a range based on the
      //size of your sketch. The Leap's origin's x-coordinate is 
      //mapped to the middle of the Processing window and the 
      //y-coordinate is mapped so that moving your finger up 
      //decreases the y-coordinate while moving it down to the Leap
      //itself basically gives you the bottom of your program's window
      if(indexFinger != null) {
        currX = indexFinger.getPosition().x;
        currY = indexFinger.getPosition().y;
      }
    }
  }
  
  switch(numbLeftFingers) {
     case 0:
       currColor = color(255);
       break;
     case 1:
       currColor = color(127);
       break;
     case 2:
       currColor = color(255, 0, 0);
       break;
     case 3:
       currColor = color(0, 255, 0);
       break;
     case 4:
       currColor = color(0, 0, 255);
       break;
     default:
       drawStuff = false;
       currColor = color(0, 0, 0, 0);
  }
  
  //if drawing, draw to offscreen image
  if(drawStuff) {
    pGraphics.beginDraw();
    //draw at current location with current color
    pGraphics.noStroke();
    pGraphics.fill(currColor);
    pGraphics.ellipseMode(CENTER);
    pGraphics.ellipse(currX, currY, 50, 50);
    pGraphics.endDraw();
  }
  
  //now draw offscreen image with a black dot on top to help locate "pen"
  image(pGraphics, 0, 0);
  image(pGraphics, 800, 0);
  
  for(int blah = 0; blah < 4; blah++) {
    fill(50*blah);
    ellipse(currX, currY, 20 - 4*blah, 20 - 4*blah);
  }
  
  //just drawing some data...
  fill(0);
  rect(0, 0, 250, 90);
  fill(255);
  textSize(20);
  text("Fingers: " + numbLeftFingers, 0, 30);
  text("(x, y): " + (int)currX + ", " + (int)currY, 0, 60);
  
  
    text("Index Dir: " +  nf(dirX, 0, 1) + ", " + nf(dirY, 0, 1), 0, 90);
  
  
  /*
  //cover up the old dot so that you can change to "transparent" mode and move
  //without leaving a trail of dots
  fill(lastColor);
  ellipse(lastX, lastY, 3, 3);
  
  lastColor = currColor;
  lastX = currX;
  lastY = currY;
  */
}
