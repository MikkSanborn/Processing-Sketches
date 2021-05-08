float scalar = 2;

void setup() {
  size(500, 500);
  
  // scalar = 1.0*height/factorial(width);
  
  stroke(255);
  strokeWeight(3);
}

void draw() {
  background(0);

  for (int i = 0; i < width; i++) {
    point(i, factorial((int) (i/scalar)));
  }
}

int factorial(int n) {
  if (n == 0)
    return 1;
  else
    return(n * factorial(n-1));
}
