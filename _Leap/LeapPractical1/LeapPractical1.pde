import de.voidplus.leapmotion.*;

LeapMotion leap;

void setup() {
  size(800, 600);
  leap = new LeapMotion(this);

  background(0);
  stroke(255);
  strokeWeight(3);
  textSize(24);
}

void draw() {
  background(0);
  
  float pitch = 0;
  float roll = 0;
  float yaw = 0;
  float x = width;
  float y = 0;
  
  float confidence = 0;
  
  ArrayList<Hand> hands = leap.getHands();
  
  for (int i = 0; i < hands.size(); i++) {
    Hand thisHand = hands.get(i);
    
    if (thisHand.isLeft()) {
      pitch = thisHand.getPitch();
      roll = thisHand.getRoll();
      yaw = thisHand.getYaw();
      confidence = thisHand.getConfidence();
    } // not else, technically
    if (thisHand.isRight()) {
      Finger thisFinger = thisHand.getFrontFinger();
      x = thisFinger.getPosition().x;
      y = thisFinger.getPosition().y;
    }
  }
  
  fill(255);
  text(("Pitch: " + nf(pitch, 0, 1)), 0, 24);
  text(("Roll: " + nf(roll, 0, 1)), 0, 48);
  text(("Yaw: " + nf(yaw, 0, 1)), 0, 72);
  text(("X: " + nf(x, 0, 1)), 0, 96);
  text(("y: " + nf(y, 0, 1)), 0, 120);
  
  text("Left Hand: Color", 0, height-32);
  text("Right Hand: Position", 0, height-8);
  
  stroke(155-(confidence*100));
  fill(150+pitch, 150+roll, 150+yaw); // ~-70 to 70
  ellipse(x, y, 50, 50);
}

/*
Draw data and ellipse

Left hand
  Pitch
  Roll
  Yaw
Right hand
  Front finger
    X
    Y
*/
