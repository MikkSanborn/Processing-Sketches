/*
https://introcs.cs.princeton.edu/java/94diffeq/Lorenz.java.html
 */

import java.awt.Color;

Lorenz[] attractors = new Lorenz[3];

double sigma = 10; // 10
double beta = 8/3.0; // 8/3.0
double rho = 28; // 28

/*

-- d = default
/
d
d
r = 20
/

*/

float a1 = 1; // residual points
float a2 = 10; // lines between points
float a3 = 200; // temp lines between points
float a4 = 0; // temp points at end of each attractor
float a5 = 0; // background dissipation

float r = .02; // rand

Color rgb1 = Color.BLACK;

float h1 = 0;

final int iterperframe = 25;

boolean active = true;

void setup() {
  frameRate(60);
  size(800, 800);
  
  for (int j = 0; j < attractors.length; j++) {
    attractors[j] = new Lorenz(0.0, 20.00+(j/101.0), 25.0, new Color(0, (int) (j*(255.0/attractors.length)), 255));
  }
  
  background(212);
  fill(212, a5);
  loadPixels();
}

void draw() {
  h1+=1;
  // h1%=360;
  // rgb1 = Color.getHSBColor(h1/360.0, 1, 1);
  // println(frameRate);
  // background(212);
  updatePixels(); // puts current pixels[] on screen
  if (active) rect(-2, -2, width+2, height+2);
  pushMatrix();
  translate(width/2, height/4);

  // Use Euler's method to numerically solve ODE
  double dt = 0.001;
  for (int j = 0; j < iterperframe && active; j++) {
    for (int k = 0; k < attractors.length; k++) {
    attractors[k].update(dt);
    strokeWeight(2);
    attractors[k].display();
    strokeWeight(1);
    float hf = (h1+360.0/((float) k/(attractors.length-1)))%360;
    stroke(Color.getHSBColor(hf/360.0, 1, 1).getRGB(), a2);
    // if (k < attractors.length-1)
    line((float) attractors[k].getX()*10, (float) attractors[k].getZ()*10, (float) attractors[(k+1 >= attractors.length ? 0:k+1)].getX()*10, (float) attractors[(k+1 >= attractors.length ? 0:k+1)].getZ()*10);
    }
  }
  loadPixels(); // pushes current screen to pixels[]
  if (!active) {
      double max_x = Double.MIN_VALUE;
    for (int k = 0; k < attractors.length; k++) {
      max_x = (attractors[k].getX() > max_x ? attractors[k].getX():max_x);
      attractors[k].hover();
      strokeWeight(2);
      stroke(255, 0, 0, a3);
      // if (k < attractors.length-1)
      line((float) attractors[k].getX()*10, (float) attractors[k].getZ()*10, (float) attractors[(k+1 >= attractors.length ? 0:k+1)].getX()*10, (float) attractors[(k+1 >= attractors.length ? 0:k+1)].getZ()*10);
      stroke(attractors[k].getC().getRGB(), a4);
      point((float) attractors[k].getX()*10, (float) attractors[k].getZ()*10);
    }
  }
  popMatrix();
}

void keyReleased() {
  if (key == ' ') active=!active;
  else if (key == 'r') {
    background(212);
    loadPixels();
    for (int j = 0; j < attractors.length; j++) {
      attractors[j] = new Lorenz(0.0, 20.00+(random(-r, r)), 25.0, new Color(0, (int) (j*(255.0/attractors.length)), 255));
      println("a[" + j + "]: " + attractors[j]);
    }
  } else if (key == 's') {
    int n = (int) (System.currentTimeMillis()%10000);
    save("lorenz3-" + n + ".png");
    println("saved to \"lorenz2-" + n + ".png");
  } else if (key == 'R') {
    background(212);
    loadPixels();
    h1=0;
    for (int j = 0; j < attractors.length; j++) {
      attractors[j] = new Lorenz(0.0, 20.00+(j/101.0), 25.0, new Color(0, (int) (j*(255.0/attractors.length)), 255));
    }
  }
}

public class Lorenz {
  private final double x0, y0, z0;
  private double x, y, z;
  private Color col;

  public Lorenz(double x, double y, double z, Color col) {
    this.x0 = x;
    this.y0 = y;
    this.z0 = z;
    this.x = x;
    this.y = y;
    this.z = z;
    this.col = col;
  }

  public void update(double dt) {
    double xnew = x + dx(x, y, z) * dt;
    double ynew = y + dy(x, y, z) * dt;
    double znew = z + dz(x, y, z) * dt;
    x = xnew;
    y = ynew;
    z = znew;
  }

  public void display() {
    //StdDraw.setPenColor(col);
    stroke(col.getRed(), col.getGreen(), col.getBlue(), a1);
    // StdDraw.point(x, z);
    point((float) (x*10), (float) (z*10));
  }

  public void hover() {
    if (false && !active) {
      if (dist((float) x, (float) z, mouseX, mouseY) < 10) {
        // print("Hovering over: (" + x0 + ", " + y0 + " ," + z0 + ")");
      }
    }
  }
  
  public double getX() {
    return x;
  }

  public double getY() {
    return y;
  }

  public double getZ() {
    return z;
  }
  
  public Color getC() {
    return col;
  }

  public /*static*/ double dx(double x, double y, double z) {
    return -sigma*(x - y);
  }

  public /*static*/ double dy(double x, double y, double z) {
    return -x*z + rho*x - y;
  }

  public /*static*/ double dz(double x, double y, double z) {
    return x*y - beta*z;
  }
  
  public String toString() {
    return "(" + x0 + ", " + y0 + ", " + z0 + ", " + col + ")";
  }
  
}
