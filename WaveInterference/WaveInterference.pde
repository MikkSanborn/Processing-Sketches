float theta = 0;

void setup() {
  size(500, 500);
  
  strokeWeight(3);
}

void draw() {
  background(0);
  
  strokeWeight(1);
  stroke(180);
  line(0, height/2, width, height/2);
  strokeWeight(3);
  
  for (int x = 0; x < width; x++) {
    if (x%20 == 0) {
      strokeWeight(1);
      stroke(180);
      line(x, 0, x, height);
      strokeWeight(3);
    }
    float amplitude = 50;
    float velocity = -4;
    float wavelength = 40;
    
    // f = v/l;
    
    float y1 = 100*sin((theta)+x/20.0); // pre-tranlsated
    float y2 = 100*sin((theta*-1)+x/20.0); // pre-translated
    // float y2 = amplitude*sin((theta*velocity)+x/wavelength);
    // float y2 = (abs((theta*-20+x)%200) > 100 ? 1:-1)*80;
    float yT = y1+y2;
    
    stroke(120, 255, 60);
    point(x, y1+height/2);
    stroke(60, 120, 255);
    point(x, y2+height/2);
    stroke(255);
    point(x, yT+height/2);
    
    if (x == 250) {
      strokeWeight(1);
      stroke(255, 80, 80);
      line(0, yT+height/2, width, yT+height/2);
      line(x, 0, x, height);
      strokeWeight(3);
    }
  }
  theta+=0.05;
}
