import de.voidplus.leapmotion.*;

LeapMotion leap;

void setup() {
  size(500, 500);
  
  leap = new LeapMotion(this);
  
  fill(0);
  textSize(16);
}

void draw() {
  boolean left = false;
  boolean right = false;
  int fingersLeft = 0;
  int fingersRight = 0;
  
  background(255);
  
  text("Hand:", 10, 20);
  text("Fingers:", 10, 40);
  text("Hand:", width-140, 20);
  text("Fingers:", width-140, 40);
  
  for (Hand h : leap.getHands()) {
    if (h.isLeft() && !left) {
      left = true;
      for (Finger f : h.getFingers()) {
        if (f.isExtended())
          fingersLeft++;
      }
    }
    if (h.isRight() && !right) {
      right = true;
      for (Finger f : h.getFingers()) {
        if (f.isExtended())
          fingersRight++;
      }
    }
  }
  
  text((left ? "Present":"Absent"), 80, 20);
  text((left ? "" + fingersLeft:"null"), 80, 40);
  text((right ? "Present":"Absent"), width-60, 20);
  text((right ? "" + fingersRight:"null"), width-60, 40);
}
