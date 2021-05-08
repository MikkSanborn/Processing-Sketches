EpicycloidShape e1;
EpicycloidShape e2;
EpicycloidShape e3;
EpicycloidShape e4;

EpicycloidShape[] e = new EpicycloidShape[2];

int index = 0;

float cX, cY, pX, pY;

float pFX, pFY;

DrawType style = DrawType.Construction;

void setup() {
  size(1000, 1000);

  e1 = new EpicycloidEllipse(width/2, height/2, 100, 150, 0, 0.02, 1, new EpicycloidEllipse(0, 0, 100, 60, 0, 0.03, 0, null));
  e2 = new EpicycloidEllipse(width/2, height/2, 100, 150, 0, 0.02, 0, null);
  e3 = new EpicycloidEllipse(width/2, height/2, 100, 150, 0, 0.02, 1, new EpicycloidRectangle(0, 0, 100, 60, 0, 0.03, 0, null));
  e3 = new EpicycloidEllipse(210, height/2, 80, 125, 0, 0.02, 2, new EpicycloidRectangle(0, 0, 80, 80, 0, 0.1, 1, new EpicycloidEllipse(0, 0, 50, 50, 0, -0.2, 0, null)));
  e3 = new EpicycloidRectangle(210, height/2, 80, 125, 0, 0.031, 2, new EpicycloidEllipse(0, 0, 80, 80, 0, 0.1, 1, new EpicycloidEllipse(0, 0, 50, 50, 0, -0.2, 0, null)));
  e4 = new EpicycloidRectangle(width/2, 210, 100, 150, 0, 0.02, 1, new EpicycloidEllipse(0, 0, 100, 60, 0, 0.03, 0, null));
}

void draw() {
  pushMatrix();
  // scale((random(0, 1) > 0.66 ? 0.9:(random(0, 1) > 0.5 ? 1:1.1)));
  if (style == DrawType.Construction) {
    background(0);
    drawConstruction();
  } else if (style == DrawType.Trail) {
    drawTrail();
  } else {
    // < ... >
  }

  // e1.updateTheta(true);
  // e2.updateTheta(true);
  //e3.updateTheta(true);
  e4.updateTheta(true);
  popMatrix();
}

void mouseClicked() {
  if (style == DrawType.Construction) {
    style = DrawType.Trail;
  } else if (style == DrawType.Trail) {
    style = DrawType.Construction;
  }

  draw();
  background(0);
}

void drawConstruction() {
  /*
  e1.display(true);
   e1.displayLine(true); 
   */
  /*
  e2.display(true);
   e2.displayLine(true);
   */
  // e3.display(true);
  // e3.displayLine(true);
  e4.display(true);
  e4.displayLine(true);
}

void drawTrail() {
  // e1.displayEndPoint(true, false);
  // e2.displayEndPoint(true, false);
  // e3.displayEndPoint(true, true, false);
  e4.displayEndPoint(true, true, false);
}

void drawTrail2() {
  point(e4.getBottomFinalX(), e3.getBottomFinalY());
  line(e4.getBottomFinalX(), e3.getBottomFinalY(), pFX, pFY);
  pFX = e4.getBottomFinalX();
  pFY = e3.getBottomFinalY();
}

public abstract class EpicycloidShape {
  protected float x, y;
  // size may be w, h or R
  protected float theta;
  protected float thetaInc;

  protected float minR, maxR, rMult;
  protected float minSp, maxSp, spMult;

  protected int level;

  /*protected*/  public EpicycloidShape sub;

  public EpicycloidShape(float x, float y, float theta, float thetaInc, float minR, float maxR, float rMult, float minSp, float maxSp, float spMult, int level, EpicycloidShape sub) {
    this.x = x;
    this.y = y;
    this.theta = theta;
    this.thetaInc = thetaInc;
    this.minR = minR;
    this.maxR = maxR;
    this.rMult = rMult;
    this.minSp = minSp;
    this.maxSp = maxSp;
    this.spMult = spMult;
    this.level = level;

    if (this.level > 0) {
      this.sub = sub;
    } else {
      this.sub = null;
    }
  }

  abstract public void display(boolean cascades);

  public void displayLine(boolean cascades) {
    noFill();
    stroke(255);
    line(getX(), getY(), getFinalX(), getFinalY());
    if (level > 0 && !sub.equals(null) && cascades)
      sub.displayLine(true);
  }

  public void displayEndPoint(boolean cascades, boolean drawsLine, boolean drawsAll) {
    noFill();
    stroke(255);
    if (drawsAll || level == 0) {
      point(getFinalX(), getFinalY());
      if (drawsLine) {
        pX = cX;
        pY = cY;
        cX = getFinalX();
        cY = getFinalY();
        line(cX, cY, pX, pY);
      }
    }
    if (level > 0 && !sub.equals(null) && cascades)
      sub.displayEndPoint(true, drawsLine, drawsAll);
  }

  protected void updateX(float newX) {
    x = newX;
  }

  protected void updateY(float newY) {
    y = newY;
  }

  public void updateTheta(boolean cascades) {
    theta+=thetaInc;
    if (cascades && level > 0 && !sub.equals(null)) {
      sub.updateTheta(true);
      reconstructSub();
    }
  }

  public float getX() {
    return x;
  }

  public float getY() {
    return y;
  }

  public float getTheta() {
    return theta;
  }

  public float getThetaInc() {
    return thetaInc;
  }

  public float getMinR() {
    return minR;
  }

  public float getMaxR() {
    return maxR;
  }

  public float getRMult() {
    return rMult;
  }

  public float getMinSp() {
    return minSp;
  }

  public float getMaxSp() {
    return maxSp;
  }

  public float getSpMult() {
    return spMult;
  }

  public int getLevel() {
    return level;
  }

  abstract public float getFinalX(); // TO BE OVERRIDDEN
  abstract public float getFinalY(); // TO BE OVERRIDDEN
  
  public float getBottomFinalX() {
    if (level > 0)
      return sub.getBottomFinalX(); // if not bottom, call lower. if bottom return finalX;
    return getFinalX();
  }

  public float getBottomFinalY() {
    if (level > 0)
      return sub.getBottomFinalY(); // if not bottom, call lower. if bottom return finalX;
    return getFinalY();
  }

  void randomize(boolean trueRandom, boolean cascade) { // trueRandom represents if the statement is truly random, or if it is within "constraints". To be overridden, but called in the overriding
    if (minR != 0 && maxR != 0 && rMult != 0 && minSp != 0 && maxSp != 0 && spMult != 0) {
      if (trueRandom) {
        theta = random(0, TWO_PI);
        thetaInc = ((int) random(minSp, maxSp))*spMult;

        // OVERRIDE w, h or R
      } else {
        theta = random(0, TWO_PI);
        thetaInc = ((int) random(minSp, maxSp))*spMult;

        // OVERRIDE w, h or R
        this.randomizeSize();
      }
      
      if (cascade && level > 0) {
        sub.randomize(trueRandom, cascade);
      }
    }
  }

  abstract void randomizeSize();

  // abstract public void reconstructSub();
  public void reconstructSub() {
    sub.updateX(this.getFinalX());
    sub.updateY(this.getFinalY());
  }

  void printVals() { // TO BE OVERRIDDEN TO ADD w, h or R, with a call to super (this)
    println("// x = " + x + "; y = " + y + "; theta = " + theta + "; thetaInc = " + thetaInc + "; minR = " + minR + "; maxR = " + maxR + "; rMult = " + rMult + "; minSp = " + minSp + "; maxSp = " + maxSp + "; spMult = " + spMult + "; /*level = " + level + "*/");
  }
}

public class EpicycloidEllipse extends EpicycloidShape {
  private float w, h;

  public EpicycloidEllipse(float x, float y, float w, float h, float theta, float thetaInc, float minR, float maxR, float rMult, float minSp, float maxSp, float spMult, int level, EpicycloidShape sub) {
    super(x, y, theta, thetaInc, minR, maxR, rMult, minSp, maxSp, spMult, level, sub);
    this.w = w;
    this.h = h;
  }

  public EpicycloidEllipse(float x, float y, float w, float h, float theta, float thetaInc, int level, EpicycloidShape sub) {
    super(x, y, theta, thetaInc, 0, 0, 0, 0, 0, 0, level, sub);
    this.w = w;
    this.h = h;
  }

  void display(boolean cascades) {
    noFill();
    stroke(255);
    ellipse(x, y, w*2, h*2);
    if (level > 0 && !sub.equals(null) && cascades)
      sub.display(true);
  }

  /*
  public float getX() {
   return super.getX();
   }
   
   public float getY() {
   return super.getY();
   }
   */

  public float getW() {
    return w;
  }

  public float getH() {
    return h;
  }

  public float getFinalX() {
    float fX = getX();
    fX += w*cos(theta);
    return fX;
  }

  public float getFinalY() {
    float fY = getY();
    fY += h*sin(theta);
    return fY;
  }

  public void randomizeSize() {
    w = ((int) random(minR, maxR))*rMult;
    h = ((int) random(minR, maxR))*rMult;
  }
}

public class EpicycloidRectangle extends EpicycloidShape {
  float w, h;

  public EpicycloidRectangle (float x, float y, float w, float h, float theta, float thetaInc, float minR, float maxR, float rMult, float minSp, float maxSp, float spMult, int level, EpicycloidEllipse sub) {
    super(x, y, theta, thetaInc, minR, maxR, rMult, minSp, maxSp, spMult, level, sub);
    this.w = w;
    this.h = h;
  }

  public EpicycloidRectangle(float x, float y, float w, float h, float theta, float thetaInc, int level, EpicycloidShape sub) {
    super(x, y, theta, thetaInc, 0, 0, 0, 0, 0, 0, level, sub);
    this.w = w;
    this.h = h;
  }

  public void display(boolean cascades) {
    noFill();
    stroke(255);
    rect(x-w, y-h, w*2, h*2);
    if (level > 0 && !sub.equals(null) && cascades)
      sub.display(true);
  }

  public float getFinalX() {
    float theta = this.theta%TWO_PI;
    if (theta < 0) {
      theta+=TWO_PI;
    }
    float fX = 0;

    if (theta > (PI/4) && theta < (3*PI/4)) { // on top
      float theta2 = theta-PI/4;
      fX = w-((w*sqrt(2)*sin(theta2))/sin((3*PI/4)-theta2))+getX();
    } else if (theta >= (3*PI/4) && theta < (5*PI/4)) {
      // float theta2 = theta-(3*PI/4);
      fX = -w+getX();
    } else if (theta >= (5*PI/4) && theta < (7*PI/4)) {
      float theta2 = theta-(5*PI/4);
      fX = -w+((w*sqrt(2)*sin(theta2))/sin((3*PI/4)-theta2))+getX();
    } else if ((theta >= (5*PI/4) && theta < TWO_PI) || (theta >= 0 && theta <= (PI/4))) {
      // float theta2 = theta-(7*PI/4);
      fX = w+getX();
    }

    return fX;
  }

  public float getFinalY() {
    float theta = this.theta%TWO_PI;
    if (theta < 0) {
      theta+=TWO_PI;
    }
    float fY = 0;

    if (theta > (PI/4) && theta < (3*PI/4)) { // on top
      // float theta2 = theta-PI/4;
      fY = h+getY();
    } else if (theta >= (3*PI/4) && theta < (5*PI/4)) {
      float theta2 = theta-(3*PI/4);
      fY = h-((h*sqrt(2)*sin(theta2))/sin((3*PI/4)-theta2))+getY();
    } else if (theta >= (5*PI/4) && theta < (7*PI/4)) {
      // float theta2 = theta-(5*PI/4);
      fY = -h+getY();
    } else if ((theta >= (5*PI/4) && theta < TWO_PI) || (theta >= 0 && theta <= (PI/4))) {
      float theta2 = theta-(7*PI/4);
      fY = -h+((h*sqrt(2)*sin(theta2))/sin((3*PI/4)-theta2))+getY();
    }

    return fY;
  }

  public void randomizeSize() {
    w = ((int) random(minR, maxR))*rMult;
    h = ((int) random(minR, maxR))*rMult;
  }
}

// rect
// square (extends rect)

// circles (extends ellipse)

/* 
 TO-DO:
 
 Constructor
 
 display
 getFinalX
 getFinalY
 randomizeSize
 */

enum DrawType {
  Construction, Trail, Combine
} // combine not implemented
