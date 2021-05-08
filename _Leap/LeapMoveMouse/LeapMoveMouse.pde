import de.voidplus.leapmotion.*;

import java.awt.Robot;
import java.awt.AWTException;
import java.awt.event.InputEvent;

LeapMotion leap;

void setup() {
  size(800, 600);
  leap = new LeapMotion(this);

  background(0);
  stroke(255);
}

void draw() {
  background(mousePressed ? 255:120);
  try {

    try {
      Robot robot = new Robot();
      for (int i = 0; i < leap.countHands(); i++) {
        Hand h = leap.getHands().get(i);

        float[] x = new float[5];
        float[] y = new float[5];
        float[] z = new float[5];

        for (int j = 0; j < h.countFingers(); j++) {
          Finger f = h.getFingers().get(j);
          PVector fPos = f.getPosition();

          println(i + "\t" + j + "\t" + fPos.x + "\t\t" + fPos.y + "\t\t" + fPos.z);

          fill(((i*437)>>2)%122+122, ((i*217)>>3)%122+122, ((i*1027)<<1)%122+122);
          x[j] = fPos.x;
          y[j] = fPos.y;
          z[j] = fPos.z;
          strokeWeight(1);
          ellipse(x[j], y[j], z[j]/2, z[j]/2);
          f.drawBones();
        }
        
        // Move mouse
        if (i == 0) {
          // robot.mouseMove((int) (getX(x, 1)), (int) (getY(y, 1))); // the normal one. 0 == thumb, 1 == index
          robot.mouseMove((int) (getX(x, 1)/5.0)+1920/2, (int) (getY(y, 1)/5.0)+1080/2);
        }
        
        // Click
        /*
        if (dist((int) (getX(x, 1)), (int) (getZ(z, 1)), (int) (getX(x, 0)), (int) (getZ(z, 0))) <= 25 && abs((int) getY(y, 1) - (int) getY(y, 1)) <= 10) {
          robot.mousePress(InputEvent.BUTTON1_DOWN_MASK);
        } else {
          robot.mouseRelease(InputEvent.BUTTON1_DOWN_MASK);
        }
        */
        
        if (leap.getHands().get(0).getPinchStrength() >= 0.6) {
          robot.mousePress(InputEvent.BUTTON1_DOWN_MASK);
        } else {
          robot.mouseRelease(InputEvent.BUTTON1_DOWN_MASK);
        }
        
        stroke(0, 100);
        for (int k = 0; k < x.length; k++) {
          for (int l = 0; l < x.length; l++) {
            strokeWeight(1);
            line(x[k], y[k], x[l], y[l]);
          }
        }
      }
    } 
    catch (AWTException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }
  } 
  catch (Exception e) {
    println("-");
  }
}

float getX(float[] x, int n) {
  return map(x[n], 0, width, -3020, 3020);
  // return x[n]*2.5-100;
}

float getY(float[] y, int n) {
  return map(y[n], 0, height, -2080, 2000);
  // return y[n]*3-300;
}

float getZ(float[] z, int n) {
  return z[n];
}
