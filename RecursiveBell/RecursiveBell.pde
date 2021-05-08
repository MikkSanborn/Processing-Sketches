SwingingObject O;
float theta = 0;
float s = 0.6; // scale
float offset = -5; // -10 is default

float[][] drawn = new float[1000][2];
int index = 0;

void setup() {
  size(1000, 1000);

  O = new SwingingObject(width/2, height/2, 180, 10);
}

void draw() {
  background(0);

  new SwingingObject(width/2, height/2, theta, 10).draw();

  theta+=1;
  
  for (int i = 0; i < index; i++) {
    strokeWeight(1);
    stroke(255);
    point(drawn[i][0], drawn[i][1]);
  }
}

class SwingingObject {
  int level;
  float x, y;
  float theta;

  SwingingObject(float x, float y, float theta, int level) {
    this.x = x;
    this.y = y;
    this.level = level;
    this.theta = theta;
  }

  void draw() {
    pushMatrix();
    translate(x, y);
    rotate(HALF_PI*cos(radians(theta)));
    fill(255);
    rect(-level*5*s, 0, level*10*s, level*15*s);
    noFill();
    strokeWeight(1);
    stroke(0, 200, 200);
    // ellipse(0, 0, level*30*s, level*30*s);
    noStroke();
    // drawChild();
    popMatrix();
    drawChild();
    
    if (level == 0 && index < drawn.length) {
      drawn[index][0] = x-level*-15*s*cos(HALF_PI*cos(radians(theta))+HALF_PI);
      drawn[index][1] = level*15*s*cos(HALF_PI*cos(radians(theta)))+y;
      index++;
    }
  }

  void drawChild() {
    if (level > 0) //                                                                                                                 offset
      new SwingingObject(x-level*-15*s*cos(HALF_PI*cos(radians(theta))+HALF_PI), level*15*s*cos(HALF_PI*cos(radians(theta)))+y, theta+offset, level-1).draw();
  }
}

/*

 background(0);
 fill(255);
 rect(-40, 0, 80, 150);
 triangle(-40, 1, 0, -30, 40, 1);
 fill(0);
 triangle(-10, 25, 0, 0, 10, 25);
 */
