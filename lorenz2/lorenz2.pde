/*
https://introcs.cs.princeton.edu/java/94diffeq/Lorenz.java.html
 */

import java.awt.Color;

Lorenz lorenz1 = new Lorenz(0.0, 20.00, 25.0, Color.BLUE);
Lorenz lorenz2 = new Lorenz(0.0, 20.01, 25.0, Color.MAGENTA);
Lorenz lorenz3 = new Lorenz(0.0, 20.02, 25.0, Color.CYAN);

double sigma = 10; // 10
double beta = 8/3.0; // 8/3.0
double rho = 28; // 28

float a1 = 255;
float a2 = 10;

float r = 5; // rand range

// int i = 0;
final int iterperframe = 25;

boolean active = true;

void setup() {
  size(500, 500);
  background(212);
  loadPixels();
}

// public static void main(String[] args) {
void draw() {
  // println(i + "\t" + frameRate);
  // if (i >= 50000) stop();
  // StdDraw.clear(StdDraw.LIGHT_GRAY);
  background(212);
  updatePixels(); // puts current pixels[] on screen
  pushMatrix();
  translate(width/2, 0);
  // background(200);
  // StdDraw.setXscale(-25, 25);
  // StdDraw.setYscale(  0, 50);
  // StdDraw.enableDoubleBuffering();

  // Use Euler's method to numerically solve ODE
  double dt = 0.001;
  for (int j = 0; j < iterperframe && active; j++) {
    lorenz1.update(dt);
    lorenz2.update(dt);
    lorenz3.update(dt);
    // i++; // added to simulate loop
    strokeWeight(2);
    lorenz1.display();
    lorenz2.display();
    lorenz3.display();
    strokeWeight(1);
    // stroke(40, a2);
    stroke(255, 0, 0, a2);
    line((float) lorenz1.getX()*10, (float) lorenz1.getZ()*10, (float) lorenz2.getX()*10, (float) lorenz2.getZ()*10);
    stroke(255, 255, 0, a2);
    line((float) lorenz2.getX()*10, (float) lorenz2.getZ()*10, (float) lorenz3.getX()*10, (float) lorenz3.getZ()*10);
    stroke(80, 150, 0, a2);
    line((float) lorenz3.getX()*10, (float) lorenz3.getZ()*10, (float) lorenz1.getX()*10, (float) lorenz1.getZ()*10);
    //  
    // StdDraw.show(); // auto-displays
    // StdDraw.pause(10); // processing takes care of fr
  }
  loadPixels(); // pushes current screen to pixels[]
  if (false && !active) {
    strokeWeight(4);
    stroke(255, 0, 0, 200);
    line((float) lorenz1.getX()*10, (float) lorenz1.getZ()*10, (float) lorenz2.getX()*10, (float) lorenz2.getZ()*10);
    stroke(255, 255, 0, 200);
    line((float) lorenz2.getX()*10, (float) lorenz2.getZ()*10, (float) lorenz3.getX()*10, (float) lorenz3.getZ()*10);
    stroke(255, 122.5, 0, 200);
    line((float) lorenz3.getX()*10, (float) lorenz3.getZ()*10, (float) lorenz1.getX()*10, (float) lorenz1.getZ()*10);
    stroke(0);
    point((float) lorenz1.getX()*10, (float) lorenz1.getZ()*10);
    point((float) lorenz2.getX()*10, (float) lorenz2.getZ()*10);
    point((float) lorenz3.getX()*10, (float) lorenz3.getZ()*10);
  }
  popMatrix();
}

void keyReleased() {
  if (key == ' ') active=!active;
  else if (key == 's') {
    int n = (int) (System.currentTimeMillis()%10000);
    save("lorenz2-" + n + ".png");
    println("saved to \"lorenz2-" + n + ".png");
  } else if (key == 'm') { // "mark" to file
    int n = (int) (System.currentTimeMillis()%10000);
    PrintWriter output = createWriter("lorenz2." + n + ".txt\""); 

    output.println("l1: " + lorenz1);
    output.println("l2: " + lorenz2);
    output.println("l3: " + lorenz3);

    output.flush(); // Writes the remaining data to the file
    output.close(); // Finishes the file
    println("saved to \"lorenz2-" + n + ".txt\"");
  } else if (key == 'r') {
    background(212);
    loadPixels();
    lorenz1 = new Lorenz(0.0, 20.00+(random(-r, r)), 25.0, Color.BLUE);
    lorenz2 = new Lorenz(0.0, 20.00+(random(-r, r)), 25.0, Color.MAGENTA);
    lorenz3 = new Lorenz(0.0, 20.00+(random(-r, r)), 25.0, Color.CYAN);
    println("l1: " + lorenz1);
    println("l2: " + lorenz2);
    println("l3: " + lorenz3);
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
    stroke(20, 20);
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

  public String toString() {
    return "(" + x0 + ", " + y0 + ", " + z0 + ", " + col + ")";
  }
}
