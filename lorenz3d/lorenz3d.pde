/*
https://introcs.cs.princeton.edu/java/94diffeq/Lorenz.java.html
 */

import java.awt.Color;

Lorenz lorenz1 = new Lorenz(0.0, 20.00, 25.0, Color.BLUE);
Lorenz lorenz2 = new Lorenz(0.0, 20.01, 25.0, Color.MAGENTA);

double sigma = 10;
double beta = 8/3.0;
double rho = 28;

float a1 = 180;
float a2 = 8;

float d = 4; // dist/scale

int iterperframe = 1;
int iterdiff = 10;

boolean active = true;

void setup() {
  frameRate(60);
  size(500, 500, P3D);
  background(212);
}

// public static void main(String[] args) {
void draw() {
  println(iterperframe + "\t" + frameRate);
  // if (i >= 50000) stop();
  if (active) iterperframe+=iterdiff;
  lorenz1 = new Lorenz(0.0, 20.00, 25.0, Color.BLUE);
  lorenz2 = new Lorenz(0.0, 20.01, 25.0, Color.MAGENTA);
  // StdDraw.clear(StdDraw.LIGHT_GRAY);
  pushMatrix();
  translate(width/2, height/2);
  rotateY(TWO_PI*mouseX/width);
  rotateX(TWO_PI*mouseY/height);
  background(200);
  // StdDraw.setXscale(-25, 25);
  // StdDraw.setYscale(  0, 50);
  // StdDraw.enableDoubleBuffering();
  
  strokeWeight(3);
  stroke(255, 0, 0);
  line(0, 0, 0, 25, 0, 0);
  stroke(0, 255, 0);
  line(0, 0, 0, 0, 25, 0);
  stroke(0, 0, 255);
  line(0, 0, 0, 0, 0, 25);

  // Use Euler's method to numerically solve ODE
  double dt = 0.001;
  for (int j = 0; j < iterperframe; j++) {
    lorenz1.update(dt);
    lorenz2.update(dt);
    //  
    strokeWeight(2);
    lorenz1.display();
    lorenz2.display();
    strokeWeight(1);
    float dist = dist((float) lorenz1.getX()*d, (float) lorenz1.getZ()*d, (float) lorenz1.getY()*d, (float) lorenz2.getX()*d, (float) lorenz2.getZ()*d, (float) lorenz2.getY()*d);
    // stroke(255, 0, 0, a2*sq(1-(dist/500)));
    stroke(255, 0, 0, a2);
    if (a2 == 0) noStroke();
    line((float) lorenz1.getX()*d, (float) lorenz1.getZ()*d, (float) lorenz1.getY()*d, (float) lorenz2.getX()*d, (float) lorenz2.getZ()*d, (float) lorenz2.getY()*d);
    // StdDraw.show(); // auto-displays
    // StdDraw.pause(10); // processing takes care of fr
    // i++; // added to simulate loop
  }
  popMatrix();
}


void keyReleased() {
  if (key == ' ') active=!active;
  else if (key == 'i') iterperframe = 0;
}

public class Lorenz { 
  private double x, y, z;
  private Color col;

  public Lorenz(double x, double y, double z, Color col) {
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
    if (a1 == 0) noStroke();
    // StdDraw.point(x, z);
    point((float) (x*d), (float) (z*d), (float) (y*d));
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

  public /*static*/ double dx(double x, double y, double z) {
    return -sigma*(x - y);
  }

  public /*static*/ double dy(double x, double y, double z) {
    return -x*z + rho*x - y;
  }

  public /*static*/ double dz(double x, double y, double z) {
    return x*y - beta*z;
  }
}
