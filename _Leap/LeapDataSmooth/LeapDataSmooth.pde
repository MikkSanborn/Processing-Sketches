import de.voidplus.leapmotion.*;

LeapMotion leap;

int numDataPoints = 5;

int lastWritten;
Hand[][] data;

void setup() {
  size(800, 600);
  leap = new LeapMotion(this);

  lastWritten = numDataPoints-1; // the "last slot"

  data = new Hand[numDataPoints][];

  background(0);
  stroke(255);
}

void draw() {
  background(0);

  // int numWritingTo = ;
  data[(lastWritten+1)%numDataPoints] = toArrayHand(leap.getHands());
  lastWritten = (lastWritten+1)%numDataPoints;

  for (int i = 0; i < data[lastWritten].length; i++) {
    Hand[] h = new Hand[data[lastWritten].length];
    for (int j = 0; j < data[lastWritten].length; j++) {
      try {
        h[j] = data[i][j];
      } 
      catch (IndexOutOfBoundsException e) {
        // Hand instance not found, may have cut out/fallen out of view. No issue, just skip it.
      }
    }
    PVector pv = getSmoothHandVector(h);
    strokeWeight(1);
    ellipse(pv.x, pv.y, pv.z/2, pv.z/2);

    PVector[] pvF = getSmoothFingerVectors(h);
    for (int j = 0; j < data[lastWritten].length; j++) {
      try {
        ellipse(pvF[j].x, pvF[j].y, pvF[j].z/2, pvF[j].z/2);
      } catch (NullPointerException e) {
        // might be missing a hand, which is fine.
      }
    }
  }
}

Hand[] toArrayHand(ArrayList<Hand> al) {
  Hand[] out = new Hand[al.size()];

  for (int i = 0; i < al.size(); i++) {
    out[i] = al.get(i);
  }

  return out;
}

Finger[] toArrayFinger(ArrayList<Finger> al) {
  Finger[] out = new Finger[al.size()];

  for (int i = 0; i < al.size(); i++) {
    out[i] = al.get(i);
  }

  return out;
}

PVector getSmoothHandVector(Hand[] data) { // all of the data from one hand, collected through some amount of iterations of data collection. Send this as (new Hand[] {this.data[0], this.data[1], ... this.data[n]}), and try to ensure that they're all the same hand (otherwise you'll mix data from a left hand and a right hand).
  // Hand h = new Hand();
  if (data == null || data.length <= 0) throw new IllegalArgumentException("");

  // use hand's getConfidence as a multiplier for each point in the vector
  float xOut = 0;
  float yOut = 0;
  float zOut = 0;

  for (int i = 0; i < data.length; i++) {
    try {
      PVector pvI = data[i].getDirection();
      xOut+=pvI.x;
      yOut+=pvI.y;
      zOut+=pvI.z;
    } 
    catch (NullPointerException e) {
      // Hand missing, but that's ok.
    }
  }

  return new PVector(xOut/data.length, yOut, zOut);
}

PVector[] getSmoothFingerVectors(Hand[] data) {
  // Hand h = new Hand();
  if (data == null || data.length <= 0) throw new IllegalArgumentException("");

  // use hand's getConfidence as a multiplier for each point in the vector
  PVector[] pvOut = new PVector[5];

  for (int i = 0; i < data.length; i++) {
    try {
      float xOut = 0;
      float yOut = 0;
      float zOut = 0;
      Finger[] f = toArrayFinger(data[i].getFingers());
      for (int j = 0; j < f.length /*always 5*/; j++) {
        xOut+=f[j].getPosition().x;
        yOut+=f[j].getPosition().y;
        zOut+=f[j].getPosition().z;
      }
      pvOut[i] = new PVector(xOut/5, yOut/5, zOut/5);
    } 
    catch (NullPointerException e) {
      // Again, hand might be missing, which is fine.
    }
  }
  return pvOut;
}
