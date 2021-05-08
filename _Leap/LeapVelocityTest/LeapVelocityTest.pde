
import de.voidplus.leapmotion.*;

LeapMotion leap;

ArrayList<ArrayList<Hand>> prevHands = new ArrayList<ArrayList<Hand>>();

// maybe track more than just 2 times?
ArrayList<Long> millisPrev = new ArrayList<Long>();
// long millisPrev;
//long millisCurr;
//long millisDiff;

int trackCount = 5;

void setup() {
  size(800, 600);
  
  leap = new LeapMotion(this);
  
  millisPrev.add((long) millis());
  
  //millisCurr = millis();
  //millisDiff = 1;
}

void draw() {
  background(0);
  //millisCurr = millis();
  // millisDiff = millisCurr-millisPrev;
  
  if (prevHands.size() == trackCount) {
    prevHands.remove(0);
  }
  prevHands.add(leap.getHands());
  
  if (millisPrev.size() == trackCount) {
    millisPrev.remove(0);
  }
  millisPrev.add((long) millis());
  
  PVector[] positions = getPositions(prevHands, 0);
  
  stroke(255);
  strokeWeight(3);
  
  try {
    line(width/2, height/2, width/2+getXVel(getXPositions(positions), millisPrev)*100, height/2+getYVel(getYPositions(positions), millisPrev)*100);
  } catch (Exception e) {
    // not enough points yet, just ignore
  }
}

// also add a check for millisPrev.size() == prevHands.size() etc.

PVector[] getPositions(ArrayList<ArrayList<Hand>> handsPrev, int handNum) {
  ArrayList<PVector> alOut = new ArrayList<PVector>();
  for (int i = 0; i < handsPrev.size(); i++) {
    try {
      alOut.add(handsPrev.get(i).get(handNum).getPosition());
    } catch (Exception e) {
      // entry missing, that's ok, skip it
    }
  }
  PVector[] lOut = new PVector[alOut.size()];
  for (int i = 0; i < lOut.length; i++) {
    lOut[i] = alOut.get(i);
  }
  return lOut;
}

float[] getXPositions(PVector[] posList) {
  float[] out = new float[posList.length];
  for (int i = 0; i < posList.length; i++) {
    out[i] = posList[i].x;
  }
  return out;
}

float[] getYPositions(PVector[] posList) {
  float[] out = new float[posList.length];
  for (int i = 0; i < posList.length; i++) {
    out[i] = posList[i].y;
  }
  return out;
}

float[] getZPositions(PVector[] posList) {
  float[] out = new float[posList.length];
  for (int i = 0; i < posList.length; i++) {
    out[i] = posList[i].z;
  }
  return out;
}

float getXVel(float[] xList, int timestamp) { // timestamp is for one iteration of the loop.
  if (xList.length == 0 || xList.length == 1) throw new IllegalArgumentException("Must have at least 2 points for a velocity.");
  float xVel = 0;
  
  for (int i = 0; i < xList.length-1; i++) {
    xVel+=(xList[i]-xList[i+1])/timestamp;
  }
  
  return xVel;
}

float getXVel(float[] xList, ArrayList<Long> millisPrev) { // timestamp is for one iteration of the loop.
  if (xList.length == 0 || xList.length == 1) throw new IllegalArgumentException("Must have at least 2 points for a velocity.");
  float xVel = 0;
  
  for (int i = 0; i < xList.length-1; i++) {
    xVel+=(xList[i]-xList[i+1])/(millisPrev.get(i+1)-millisPrev.get(i));
  }
  
  return xVel;
}

float getXVel(float[] xList, long[] millisPrev) { // timestamp is for one iteration of the loop.
  if (xList.length == 0 || xList.length == 1) throw new IllegalArgumentException("Must have at least 2 points for a velocity.");
  float xVel = 0;
  
  for (int i = 0; i < xList.length-1; i++) {
    xVel+=(xList[i]-xList[i+1])/(millisPrev[i+1]-millisPrev[i]);
  }
  
  return xVel;
}

float getYVel(float[] yList, int timestamp) { // timestamp is for one iteration of the loop.
  if (yList.length == 0 || yList.length == 1) throw new IllegalArgumentException("Must have at least 2 points for a velocity.");
  float yVel = 0;
  
  for (int i = 0; i < yList.length-1; i++) {
    yVel+=(yList[i]-yList[i+1])/timestamp;
  }
  
  return yVel;
}

float getYVel(float[] yList, ArrayList<Long> millisPrev) { // timestamp is for one iteration of the loop.
  if (yList.length == 0 || yList.length == 1) throw new IllegalArgumentException("Must have at least 2 points for a velocity.");
  float yVel = 0;
  
  for (int i = 0; i < yList.length-1; i++) {
    yVel+=(yList[i]-yList[i+1])/(millisPrev.get(i+1)-millisPrev.get(i));
  }
  
  return yVel;
}

float getYVel(float[] yList, long[] millisPrev) { // timestamp is for one iteration of the loop.
  if (yList.length == 0 || yList.length == 1) throw new IllegalArgumentException("Must have at least 2 points for a velocity.");
  float yVel = 0;
  
  for (int i = 0; i < yList.length-1; i++) {
    yVel+=(yList[i]-yList[i+1])/(millisPrev[i+1]-millisPrev[i]);
  }
  
  return yVel;
}
float getZVel(float[] zList, int timestamp) { // timestamp is for one iteration of the loop.
  if (zList.length == 0 || zList.length == 1) throw new IllegalArgumentException("Must have at least 2 points for a velocity.");
  float zVel = 0;
  
  for (int i = 0; i < zList.length-1; i++) {
    zVel+=(zList[i]-zList[i+1])/timestamp;
  }
  
  return zVel;
}

float getZVel(float[] zList, ArrayList<Long> millisPrev) { // timestamp is for one iteration of the loop.
  if (zList.length == 0 || zList.length == 1) throw new IllegalArgumentException("Must have at least 2 points for a velocity.");
  float zVel = 0;
  
  for (int i = 0; i < zList.length-1; i++) {
    zVel+=(zList[i]-zList[i+1])/(millisPrev.get(i+1)-millisPrev.get(i));
  }
  
  return zVel;
}

float getZVel(float[] zList, long[] millisPrev) { // timestamp is for one iteration of the loop.
  if (zList.length == 0 || zList.length == 1) throw new IllegalArgumentException("Must have at least 2 points for a velocity.");
  float zVel = 0;
  
  for (int i = 0; i < zList.length-1; i++) {
    zVel+=(zList[i]-zList[i+1])/(millisPrev[i+1]-millisPrev[i]);
  }
  
  return zVel;
}
