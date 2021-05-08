CCPH C; //<>//

void setup() {
  size(500, 500);

  C = new CCPH(new float[] {95, 405, 395, 105, width/2}, new float[] {105, 95, 405, 395, height/2}, color(240));
}

void draw() {
  background(80, 120, 240);

  C.display();
}

public class CCPH {
  private float[] x, y, m, b;
  private color c;
  private CVPH CV;
  private CCPH[] CC;

  public CCPH(float[] x, float[] y, color c) {
    if (x.length != y.length || x.length < 3 || y.length < 3) // make sure the list length is even, and has at least 3 points listed
      throw new IllegalArgumentException("\"No\"");

    // set variables
    this.x = x;
    this.y = y;
    this.c = c;

    this.m = new float[this.x.length];
    this.b = new float[this.x.length];

    construct();
  } // EOF

  public CCPH (color c, float... coords) {
    if (coords.length%2 != 0) // make sure it has an even amount of numbers
      throw new IllegalArgumentException("\"No\""); 

    // convert coords[] to {x[], y[]}
    float[] x = new float[coords.length/2];
    float[] y = new float[coords.length/2];

    for (int i = 0; i < x.length; i++) {
      x[i] = coords[i*2];
      y[i] = coords[i*2+1];
    }

    // set variables
    this.x = x;
    this.y = y;
    this.c = c;

    this.m = new float[this.x.length];
    this.b = new float[this.x.length];

    construct();
  } // EOF

  private void construct() {
    println("Beggining construction!");

    // find the slope and the y-intercept of each set of points
    for (int i = 0; i < this.x.length; i++) {
      this.m[i] = (this.y[(i+1 < this.x.length ? i+1:0)]-this.y[i])/(this.x[(i+1 < this.x.length ? i+1:0)]-this.x[i]);
      this.b[i] = this.y[i]-m[i]*this.x[i];
    }

    if (checkLinesIntersecting(m, b)) // check to see if lines intersect
      throw new IllegalArgumentException("\"Also no\"");

    // start checking for concavities
    boolean[] isConcave = new boolean[this.x.length];

    for (int i = 0; i < this.x.length; i++) { // for each line
      int nA = 0; // count number of points above the line
      for (int j = 0; j < this.x.length; j++) { // look at each point
        if (i == j || j == (i+1 < this.x.length ? i+1:0)) continue; // except for point[i]
        if (this.y[j] > this.m[i]*this.x[j]+this.b[i]) nA++; // check if above
        else if (this.y[i] > this.m[i]*this.x[j]+this.b[i]) nA--; // check if below
        else { // FLAG - maybe check to see if y[i] > y[j] and reverse. if ==, throw exception. Check logic?
          println("vertical lines hurt");
        }
      }
      isConcave[i] = nA == 0; // line[i] is concave iff
    }

    // check to see if points reside on a "concave" and/or "convex" part of a shape
    boolean[] onShape1 = new boolean[this.x.length];
    boolean[] onShape2 = new boolean[this.x.length];

    // list all points attached to concave lines
    for (int i = 0; i < this.x.length; i++) {
      if (isConcave[i]) {
        onShape1[i] = true;
        onShape1[(i+1 < this.x.length ? i+1:0)] = true;
      } else {
        onShape2[i] = true;
        onShape2[(i+1 < this.x.length ? i+1:0)] = true;
      }
    }

    // CVPH
    int numOnShape2 = 0;

    for (boolean b : onShape2)
      if (b) numOnShape2++;

    float[] xShape2 = new float[numOnShape2];
    float[] yShape2 = new float[numOnShape2];

    int numAdded = 0;

    for (int i = 0; i < this.x.length; i++) { // for each point
      if (onShape2[i]) { // check if it is on "shape 2"
        xShape2[numAdded] = this.x[i]; // if so, add it to the list
        yShape2[numAdded] = this.y[i]; // "                       "
        numAdded++;
      }
    }

    this.CV = new CVPH(xShape2, yShape2, color(0, 0, 200)); // create the CVPH

    int shape1Count = 0; // the count of concave polygons

    for (int i = 0; i < this.x.length; i++)
      if (isConcave[i] && !isConcave[(i-1 >= 0 ? i-1:this.x.length-1)]) shape1Count++;

    this.CC = new CCPH[shape1Count];
    println(shape1Count + " CCPH's found?");

    boolean[][] onShapeI = new boolean[shape1Count][this.x.length];

    int countElapsed = 0;

    for (int i = 0; i < shape1Count; i++) {
      int countSidesI = 0;

      for (;; countElapsed++) { // change to a while loop.
        if (!isConcave[countElapsed])
          break;

        countSidesI++;
        onShapeI[i][countElapsed] = true; 
        onShapeI[i][(countElapsed+1 < this.x.length ? countElapsed+1:0)] = true;
      }

      float[] xI = new float[countSidesI];
      float[] yI = new float[countSidesI];

      int spotsFilled = 0;

      for (int j = 0; j < this.x.length; j++) 
        if (onShapeI[i][j]) {
          xI[spotsFilled] = this.x[j];
          yI[spotsFilled] = this.y[j];
          spotsFilled++;
        }

      if (xI.length != 0 && yI.length != 0 )
        this.CC[i] = new CCPH(xI, yI, color (120));
      else println("error constructing CCPH #" + i);
    }

    println("Construction complete!");
    println("Count CCPH: " + shape1Count + ".");
  }

  public void display() {
    stroke(0);
    strokeWeight(3);
    fill(c);

    beginShape();
    println("Start");

    for (int i = 0; i < this.x.length; i++) {
      vertex(this.x[i], this.y[i]);
      println(this.x[i] + "  " + this.y[i]);
    }

    println("End");
    endShape();

    for (int i = 1; i < CC.length; i++) {
      try {
        println(i);
        CC[i].display();
        println("Drew: CC[" + i + ".");
      }
      catch (Exception E) {
      }
    }


    try {
      CV.display();
    } 
    catch (Exception E) {
      // println(E);
    }
  }
} // EOC


public boolean checkLinesIntersecting(float[] m, float[] b) {
  return false; // also later
}


public class CVPH { // extends CCPH, but that will waste a lot of time/cpu usage/memory to construct. build an alternate protected constructor dedicated to CVPH(?)
  private float[] x, y, m, b;
  private color c;

  public CVPH(float[] x, float[] y, color c) {
    if (x.length != y.length || x.length < 3 || y.length < 3) throw new IllegalArgumentException("No thanks.");
    this.x = x;
    this.y = y;
    this.c = c;

    this.m = new float[this.x.length];
    this.b = new float[this.x.length];

    for (int i = 0; i < this.x.length; i++) {
      this.m[i] = (this.y[(i+1 < this.x.length ? i+1:0)]-this.y[i])/(this.x[(i+1 < this.x.length ? i+1:0)]-this.x[i]);
      this.b[i] = this.y[i]-m[i]*this.x[i];
    }
  }
  // later?

  public void display() {
    stroke(0);
    strokeWeight(3);
    fill(c);

    beginShape();
    println("Start");

    for (int i = 0; i < this.x.length; i++) {
      vertex(this.x[i], this.y[i]);
      println(this.x[i] + "  " + this.y[i]);
    }

    println("End");
    endShape();
  }
}
