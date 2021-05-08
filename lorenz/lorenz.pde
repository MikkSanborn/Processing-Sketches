/*
https://introcs.cs.princeton.edu/java/94diffeq/Lorenz.java.html
 */

import java.awt.Color;

Lorenz lorenz1 = new Lorenz(0.0, 20.00, 25.0, Color.BLUE);
Lorenz lorenz2 = new Lorenz(0.0, 20.01, 25.0, Color.MAGENTA);

double sigma = 10;
double beta = 8/3.0;
double rho = 28;

float a1 = 100;
float a2 = 0;

int i = 0;
final int iterperframe = 25;

boolean active = true;

void setup() {
  size(500, 500);
  background(212);
}

// public static void main(String[] args) {
void draw() {
  println(i + "\t" + frameRate);
  if (i >= 50000) stop();
  if (active) {
    // StdDraw.clear(StdDraw.LIGHT_GRAY);
    pushMatrix();
    translate(width/2, 0);
    // background(200);
    // StdDraw.setXscale(-25, 25);
    // StdDraw.setYscale(  0, 50);
    // StdDraw.enableDoubleBuffering();

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
      stroke(255, 0, 0, a2);
      line((float) lorenz1.getX()*10, (float) lorenz1.getZ()*10, (float) lorenz2.getX()*10, (float) lorenz2.getZ()*10);
      // StdDraw.show(); // auto-displays
      // StdDraw.pause(10); // processing takes care of fr
      i++; // added to simulate loop
    }
    popMatrix();
  }
}

void keyReleased() {
  if (key == ' ') active=!active;
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
    // StdDraw.point(x, z);
    point((float) (x*10), (float) (z*10));
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
