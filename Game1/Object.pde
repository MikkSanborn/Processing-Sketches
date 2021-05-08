class Object {
  ObjectType type;
  float x;
  float y;
  float w;
  float h;

  Object(ObjectType type, float x, float y, float w, float h) {
    this.type = type;
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }

  void display() {
    noStroke();

    switch(type) {
    case Surface:
      fill(255);
      break;

    case Ghost:
      fill(70, 240, 130, 50);
      break;

    case Kill:
      fill(235, 127, 62.75, 200);
      break;

    default:
      noFill();
      break;
    }

    rect(x, y, w, h);
  }
  
  void special(){
    // sort-of abstract
  } // added to support [movingObject, kill]
  
  float getXS() {
    return 0;
  }
  
  float getYS() {
    return 0;
  }
}

// class movingObject extends Object
class movingObject extends Object {
  float xBoundL, xBoundR;
  float yBoundT, yBoundB;
  float xs;
  float ys;

  movingObject(ObjectType type, float x, float y, float w, float h, float xBoundL, float xBoundR, float yBoundT, float yBoundB, float xs, float ys) {
    super(type, x, y, w, h);
    
    this.xBoundL = xBoundL;
    this.xBoundR = xBoundR;
    this.yBoundT = yBoundT;
    this.yBoundB = yBoundB;
    this.xs = xs;
    this.ys = ys;
  }
  
  // inherits display
  
  void special() {
    super.special();
    x+=xs;
    y+=ys;
    
    if (x+w > xBoundR || x < xBoundL) {
      xs*=-1;
    }
    if (y+h > yBoundB || y < yBoundT) {
      ys*=-1;
    }
  }
  
  float getXS() {
    return xs;
  }
  
  float getYS() {
    return ys;
  }
}

enum ObjectType { // Surface = platform
  Surface, Ghost, Kill
}
