float x = 0, y = 0;
float theta = 0;
float td = 0; // theta in degrees
float r = 50;

void setup() {
  size(500, 500);

  stroke(255);
  strokeWeight(3);
  noFill();
}

void draw() {
  background(0);

  stroke(255);
  strokeWeight(3);
  rect(width/2-r, height/2-r, r*2, r*2);

  if (td > 45 && td < 135) { // on top
    float theta2 = theta-PI/4;
    x = width/2+r-((r*sqrt(2)*sin(theta2))/sin((3*PI/4)-theta2));
    y = height/2+r;
  } else if (td >= 135 && td < 225) {
    float theta2 = theta-(3*PI/4);
    x = width/2-r;
    y = height/2+r-((r*sqrt(2)*sin(theta2))/sin((3*PI/4)-theta2));
  } else if (td >= 225 && td < 315) {
    float theta2 = theta-(5*PI/4);
    x = height/2-r+((r*sqrt(2)*sin(theta2))/sin((3*PI/4)-theta2));
    y = width/2-r;
  } else {
    float theta2 = theta-(7*PI/4);
    x = width/2+r;
    y = height/2-r+((r*sqrt(2)*sin(theta2))/sin((3*PI/4)-theta2));
  }
  
  stroke(0, 180, 255);
  strokeWeight(12);
  point(x, y);
  
  theta+=0.01;
  td = degrees(theta);
  if (theta > TWO_PI) {
    theta-=TWO_PI;
  }
}
