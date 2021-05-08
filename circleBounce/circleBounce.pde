circleThing[] c = new circleThing[25];

// float w = 20;

circleThing c1;
circleThing c2;

int[][] collisionCount = new int[c.length][c.length];

void setup() {
  size(800, 800);

  c1 = new circleThing(170, width/2, 2, PI, 20, 1, -1);
  c2 = new circleThing(400, 200, -2, 2.8765, 20, 1, -2);

  for (int i = 0; i < c.length; i++) {
    c[i] = new circleThing(random(20, width-20), random(20, height-20), random(random(-8, 0), random(0, 8)), random(random(-8, 0), random(0, 8)), random(20, 40), 2, i);
  }
  
  for (int i = 0; i < collisionCount.length; i++) {
    for (int j = 0; j < collisionCount[0].length; j++) {
      collisionCount[i][j] = 0;
    }
  }
}

void draw() {
  fill(0, 0, 0, 10);
  rect(-2, -2, width+4, width+4);
  background(0);

  c1.drawLines(c2.x, c2.y);

  for (int i = 0; i < c.length; i++) {
    c[i].display();
    c[i].move();

    for (int j = 0; j < c.length; j++) {
      if (i != j) {
        // c[i].drawLines(c[j].x, c[j].y);
        c[i].collideWith(c[j]);
        c[i].checkCollisions(c[j]);
      }
    }
  }
}

void mouseClicked() {
  for (int i = 0; i < c.length; i++) {
    c[i] = new circleThing(random(20, width-20), random(20, height-20), random(random(-8, 0), random(0, 8)), random(random(-8, 0), random(0, 8)), random(20, 40), 2, i);
  }
}

void mouseWheel() {
  noLoop();
}

class circleThing {
  float x, y, xs, ys;
  float r;
  float d;
  float m1 = 0, b1 = 0, m2 = 0, b2 = 0;
  final int ID;

  circleThing(float xt, float yt, float xst, float yst, float r, float d, int id) {
    x = xt;
    y = yt;
    xs = xst;
    ys= yst;
    this.r = r;
    this.d = d;
    this.ID = id; // to count time in contact between ID(1) and ID(2)
  }

  void display() {
    fill(255);
    noStroke();
    ellipse(x, y, r, r);
    // rect(x+r/2, y+r/2, r, r);


    strokeWeight(4);
    stroke(0);
    // point(x, y);
  }

  void move() {
    x += xs;
    y += ys;

    xs*=((x>=width-r/2 || x <= 0+r/2) ? -1:1);
    ys*=((y>=height-r/2 || y <= 0+r/2) ? -1:1);
  }

  void drawLines(float xc, float yc) { // x-check, y-check
    if (dist(x, y, xc, yc) <= r) {
      strokeWeight(2);
      // line(xc, yc, x, y);

      // if (dist(xc, yc, x, y) <= w*2) {
      m1 = (yc-y)/(xc-x);
      b1 = y - m1*x;

      m2 = -1/m1;
      b2 = (yc+y)/2 - m2*(xc+x)/2;
      // }

      stroke(255, 0, 0);
      line(0, m1*0+b1, width*height, m1*width*height+b1);
      stroke(0, 255, 0);
      line(0, m2*0+b2, width*height, m2*width*height+b2);
      strokeWeight(8);
      stroke(0, 0, 255);
      // point((xc+x)/2, (yc+y)/2);
    }
  }
  
  void collideWith(circleThing that) {
    if (dist(this.x, this.y, that.x, that.y) < this.r/2 + that.r/2) {
      // momentum transfer "stuffs"
      // P = m*v, where m = r*d. (mass = radius*"density")
      float v1xi = this.xs; // velocity 1 in X direction initial (#1 because 2 objects total)
      float v1yi = this.ys; // velocity 1 in Y direction initial (#1 because 2 objects total)
      float v2xi = that.xs; // velocity 2 in X direction initial (#2 because 2 objects total)
      float v2yi = that.ys; // velocity 2 in Y direction initial (#2 because 2 objects total)
      
      float m1 = this.r*this.d; // mass = radius*density
      float m2 = that.r*that.d;
      
      // float Px = v1xi*m1 + v2xi*m2;
      // float Py = v1yi*m1 + v2yi*m2;
      
      this.xs = ((m1-m2)/(m1+m2))*v1xi+(2*m2/(m1+m2))*v2xi; // v1xf
      this.ys = ((m1-m2)/(m1+m2))*v1yi+(2*m2/(m1+m2))*v2yi; // v1yf
      that.xs = (2*m1/(m1+m2))*v1xi+((m2-m1)/(m1+m2))*v2xi; // v2xf
      that.xs = (2*m1/(m1+m2))*v1yi+((m2-m1)/(m1+m2))*v2yi; // v2yf
      
      /*
      // to avoid "blobbing" (which didn't work) [implemented "checkCollisions" to override this]
      this.x+=2*this.xs;
      this.y+=2*this.ys;
      that.x+=2*that.xs;
      that.x+=2*that.ys;
      */
    }
  }
  
  void checkCollisions(circleThing that) { //                    - + 2 for leniency -
    if (dist(this.x, this.y, that.x, that.y) < this.r/2 + that.r/2 + 2) {
      collisionCount[this.ID][that.ID]++; // add 1 to the times collided in succession
    } else {
      collisionCount[this.ID][that.ID] = 0; // reset the times collided in succession
    }
    
    if (collisionCount[this.ID][that.ID] >= 5) {
      this.x+=this.xs;
      this.y+=this.ys;
      that.x+=that.xs;
      that.y+=that.ys;
    }
  }
  
  void printOnMouseHover() {
    if(dist(this.x, this.y, mouseX, mouseY) <= r/2) {
      println(x + "   " + y); // try to print collisions array if possible
    }
  }
}
