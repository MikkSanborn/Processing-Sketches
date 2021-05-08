// https://introcs.cs.princeton.edu/java/32class/Mandelbrot.java.html

/******************************************************************************
 *  Compilation:  javac Mandelbrot.java
 *  Execution:    java Mandelbrot xc yc size
 *  Dependencies: StdDraw.java
 *
 *  Plots the size-by-size region of the Mandelbrot set, centered on (xc, yc)
 *
 *  % java Mandelbrot -0.5 0 2
 *
 ******************************************************************************/

import java.awt.Color;

Mandelbrot m = new Mandelbrot();
// Color gray = Color.GRAY;
String[] args = {"0", "0", "1"};

public void setup() {
  size(500, 500);
  frameRate(12000);
}

public void draw() {
  background(212);
  double xc   = Double.parseDouble(args[0]);
  double yc   = Double.parseDouble(args[1]);
  double size = Double.parseDouble(args[2]);

  int n   = 512;   // create n-by-n image
  int max = 255;   // maximum number of iterations

  // Picture picture = new Picture(n, n);
  for (int i = 0; i < n; i++) {
      for (int j = 0; j < n; j++) {
          double x0 = xc - size/2 + size*i/n;
          double y0 = yc - size/2 + size*j/n;
          Complex z0 = new Complex(x0, y0);
          int gray = max - m.mand(z0, max);
          Color colorr = new Color(gray, gray, gray);
          // picture.set(i, n-1-j, colorr);
          stroke(colorr.getRGB());
          point(i, n-1-j);
      }
  }
  fill(255, 0, 0);
  rect(0, 0, 10, 10);
  println(frameCount);
  // picture.show();
  // stop();
}

public class Mandelbrot {

    // return number of iterations to check if c = a + ib is in Mandelbrot set
    public int mand(Complex z0, int max) {
        Complex z = z0;
        for (int t = 0; t < max; t++) {
            if (z.abs() > 2.0) return t;
            z = z.times(z).plus(z0);
        }
        return max;
    }

}
