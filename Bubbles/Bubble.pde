class Bubble {

  ///////////////
  // VARIABLES //
  ///////////////
  private float x, y, px, py;
  private float xspeed, yspeed;
  private int frames;
  private color col, fcol;
  private int radius;
  private boolean popped;
  private int pf;
  float a1;
  float a2;
  float a3;
  float a4;
  float d1;
  float d2;
  float d3;
  float d4;
  float l1;
  float l2;
  float l3;
  float l4;
  float accel;
  int mRad;
  float lifeTime;
  boolean natPop;

  /////////////////
  // CONSTRUCTOR //
  /////////////////
  public Bubble(float tx, float ty, int rad, float lt, boolean p) {
    float rx = random(-2,2);
    while(rx == 0){
      rx = random(-2,2);
    }
    float ry = random(-2,2);
    while(ry==0){
      ry = random(-2,2);
    }
    //rx=0;
    //ry=0;
    px = x;
    py = y;
    x=tx+rx;
    y=ty+ry;
    xspeed=0;
    yspeed=0;
    frames=0;
    int c1 = (int)random(255);
    int c2 = (int)random(100, 255);
    int c3 = 255;// (int)random(255);
    fcol = color(c1, c2, c3, 80);
    col = color(c1, c2, c3);
    radius = rad;
    popped = false;
    pf=0;
    a1 = (int)random(0, 2*PI);
    a2 = (int)random(0, 2*PI);
    a3 = (int)random(0, 2*PI);
    a4 = (int)random(0, 2*PI);
    l1 = (int)random(15, 45);
    l2 = (int)random(15, 45);
    l3 = (int)random(15, 45);
    l4 = (int)random(15, 45);
    d1 = (int)random(10, 30);
    d2 = (int)random(10, 30);
    d3 = (int)random(10, 30);
    d4 = (int)random(10, 30);
    accel = 3;
    mRad = 200;
    lifeTime = lt;
    natPop = p;
  }


  //////////////
  // GRAPHICS //
  //////////////

  void move() {
    if (x+radius>=width || y+radius>=height || y-radius<=0 || x-radius<=0) {
      this.pop();
    }else if(frames > lifeTime*frameRate && natPop){
      this.pop();
    }else {
      // noStroke();
      // fill(255, 0, 0, 255);
      // ellipse(px, py, 2*radius+2, 2*radius+2);
      fill(fcol);
      strokeWeight(2);
      stroke(fcol);
      ellipse(x, y, 2*radius, 2*radius);
      x+=xspeed;
      y+=yspeed;
      if (mousePressed) {
        if (dist(x, y, mouseX, mouseY)<mRad && x!=mouseX && y!=mouseY) {
          if (x>mouseX && y<mouseY) {
            xspeed+=accel*cos(atan((y-mouseY)/(x-mouseX)));
          } else if (x>mouseX) {
            xspeed+=accel*cos(atan((y-mouseY)/(x-mouseX)));
          } else  if (x<mouseX && y>=mouseY) {
            xspeed-=accel*cos(atan((y-mouseY)/(x-mouseX)));
          } else {
            xspeed-=accel*cos(atan((y-mouseY)/(x-mouseX)));
          }
          if (y>mouseY && x<=mouseX) {
            yspeed-=accel*sin(atan((y-mouseY)/(x-mouseX)));
          } else if (y>mouseY ) {
            yspeed+=accel*sin(atan((y-mouseY)/(x-mouseX)));
          } else if (y<mouseY && x>mouseX) {
            yspeed+=accel*sin(atan((y-mouseY)/(x-mouseX)));
          } else {
            yspeed-=accel*sin(atan((y-mouseY)/(x-mouseX)));
          }
        } else {
          if (xspeed<0) {
            xspeed+=1;
          } else if (xspeed>0) {
            xspeed-=1;
          }
          if (yspeed<0) {
            yspeed+=1;
          } else if (yspeed>0) {
            yspeed-=1;
          }
        }
      } else {
        if (xspeed<0) {
          xspeed+=1;
        } else if (xspeed>0) {
          xspeed-=1;
        }
        if (yspeed<0) {
          yspeed+=1;
        } else if (yspeed>0) {
          yspeed-=1;
        }
      }
      frames++;
    }
  }

  void pop() {
    if (pf<1) {
      noStroke();
      fill(0, 20);
      ellipse(x, y, 2*radius+5, 2*radius+5);
      
      strokeWeight(5);
      stroke(col);
      line(x+cos(a1)*d1, y+sin(a1)*d1, x+cos(a1)*d1+cos(a1)*l1, y+sin(a1)*d1+sin(a1)*l1);
      line(x+cos(a2)*d2, y+sin(a2)*d2, x+cos(a2)*d2+cos(a2)*l2, y+sin(a2)*d2+sin(a2)*l2);
      line(x+cos(a3)*d3, y+sin(a3)*d3, x+cos(a3)*d3+cos(a3)*l3, y+sin(a3)*d3+sin(a3)*l3);
      line(x+cos(a4)*d4, y+sin(a4)*d4, x+cos(a4)*d1+cos(a4)*l4, y+sin(a4)*d4+sin(a4)*l4);
      pf++;
      //ellipse(x, y, 5, 5);
    } else
      popped = true;
  }

  boolean popped() {
    return popped;
  }
  
  float dista(float x, float y){
    return dist(this.x,this.y,x,y);
  }

  ///////////////
}
