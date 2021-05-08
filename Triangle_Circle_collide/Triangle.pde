class Triangle {
  float cx, cy;
  float[] x, y;
  
  Triangle(float x1, float y1, float x2, float y2, float x3, float y3) {
    float[] _x = {x1, x2, x3};
    x = _x;
    float[] _y = {y1, y2, y3};
    y = _y;
    
    cx = (x1+x2+x3)/3.0;
    cy = (y1+y2+y3)/3.0;
  }
  
  void display(color c) {
    fill(c);
    triangle(x[0], y[0], x[1], y[1], x[2], y[2]);
  }
}
