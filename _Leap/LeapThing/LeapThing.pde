import de.voidplus.leapmotion.*;

LeapMotion leap;

void setup() {
  size(800, 600);
  leap = new LeapMotion(this);

  background(0);
  stroke(255);
}

void draw() {
  background(0);
  try {
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
      }
      
      for (int k = 0; k < x.length; k++) {
        for (int l = 0; l < x.length; l++) {
          strokeWeight(1);
          line(x[k], y[k], x[l], y[l]);
        }
      }
    }
  } 
  catch (Exception e) {
    println("-");
  }
}
