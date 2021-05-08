class Circle {
  float x, y, xs, ys, r;
  
  Circle() {
  }
  
  void display(color c) {
    fill(c);
    ellipse(x, y, r*2, r*2);
  }
  
  void move() {
    x+=xs;
    y+=ys;
    ys+=.001;
  }
  
  boolean collide(Triangle t) {
    // check each wall, "closest" first.
    // make useful vars first
    float m01, b01, m12, b12, m20, b20;
    m01 = (t.y[1]-t.y[0])/(t.x[1]-t.x[0]);
    b01 = t.y[0] - m01*t.x[0];
    m12 = (t.y[2]-t.y[1])/(t.x[2]-t.x[1]);
    b12 = t.y[1] - m12*t.x[1];
    m20 = (t.y[0]-t.y[2])/(t.x[0]-t.x[2]);
    b20 = t.y[2] - m20*t.x[2];
    
    float _m01, _b01, _m12, _b12, _m20, _b20; // _ denotes "prime," in this case, the perpendicular line that passes through the circle.
    _m01 = -1/m01;
    _b01 = this.y-_m01*this.x;
    _m12 = -1/m12;
    _b12 = this.y-_m12*this.x;
    _m20 = -1/m20;
    _b20 = this.y-_m20*this.x;
    
    stroke(100);
    
    line(0, b01, width, width*m01+b01);
    line(0, b12, width, width*m12+b12);
    line(0, b20, width, width*m20+b20);
    
    line(0, _b01, width, width*_m01+_b01);
    line(0, _b12, width, width*_m12+_b12);
    line(0, _b20, width, width*_m20+_b20);
    
    
    
    return false;
  }
}
