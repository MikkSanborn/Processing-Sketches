float[] x = new float[3];
float[] y = new float[3];

void setup() {
  size(500, 500);

  x[0] = width/2;
  y[0] = 100;

  x[1] = width/3;
  y[1] = height/2;

  x[2] = mouseX;
  y[2] = mouseY;

  fill(255);
  strokeWeight(3);
  stroke(255);

  textSize(12);
}

void draw() {
  background(0);

  x[2] = mouseX;
  y[2] = mouseY;

  stroke(255, 0, 0);
  line(x[0], y[0], x[1], y[1]);
  stroke(0, 255, 0);
  line(x[1], y[1], x[2], y[2]);
  stroke(0, 0, 255);
  line(x[2], y[2], x[0], y[0]);

  // a = inQ, b = either other
  // sinA = sinB
  //  a   =  b

  // sinA = a*sinB/b
  // A = asin(a*sin(B)/b)

  // a^2=b^2+c^2-2*b*c*cos(A)
  // a^2 = b^2+c^2-2bcCos(A)
  // 2bcCos(A) = b^2+c^2-a^2
  // cos(A) = (b^2+c^2-a^2)/(2*b*c)

  float a = sqrt(sq(x[2]-x[0])+sq(y[2]-y[0]));// a is opposite side to angle A (from mouse points to top of screen) (BLUE)
  float b = sqrt(sq(x[1]-x[0]) + sq(y[1]-y[0])); // b is from top to center (RED)
  float c = sqrt(sq(x[2]-x[1]) + sq(y[2]-y[1])); // center to mouse (GREEN)

  float A = acos((sq(b)+sq(c)-sq(a))/(2*b*c));
  float B = acos((sq(a)+sq(c)-sq(b))/(2*a*c));
  float C = acos((sq(b)+sq(a)-sq(c))/(2*a*b));

  A*=180/PI;
  B*=180/PI;
  C*=180/PI;

  text("A[1]", x[1], y[1]);
  text("B[2]", x[2], y[2]);
  text("C[0]", x[0], y[0]);

  // 360 (deg) = 2PI (rad)

  /*
  if (mouseX < width/2) {
   A = 180 + (180-A);
   }
   
   stroke(255);
   arc(width/2, height/2, 25, 25, -HALF_PI, radians(A)-HALF_PI);
   */

  println("a = " + a + "\tA = " + A);
  println("b = " + b + "\tB = " + B);
  println("c = " + c + "\tC = " + C);
  println();
}

void keyPressed() {
  if (key == 'r') {
    for (int i = 0; i < x.length; i++) {
      x[i] = (int) random(0, 255);
      y[i] = (int) random(0, 255);
    }
  }
}
