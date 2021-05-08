// blobs walk aimlessly from the edge towards food. Has viewrange, keeps some memory of movement direction (to avoid jittering), 

void setup() {
  
}

void draw() {
  
}

float distToNearestFood(float x, float y) {
    return 0;
}

class Blob {
  float x, y;
  float xs, ys;
  float energy;
  float viewRange, speed, size; // traits
  
  Blob(float viewRange, float speed, float size) {
    this.viewRange = viewRange;
    this.speed = speed;
    this.size = size;
  }
  
  void display() {
    // display
  }
  
  void move() {
    if (abs(distToNearestFood(x, y)) < viewRange) {
      
    } else {
    xs += xs*.05+random(-speed, speed);
    }
  }
  
  float getEnergy() {
    return energy;
  }
  
  void setX(float x) {
    this.x = x;
  }
  
  void setY(float y) {
    this.y = y;
  }
  
  void addXS(float xs) {
    this.xs+=xs;
  }
  
  void addYS(float ys) {
    this.xs+=ys;
  }
  
  void resetSpeed() {
    xs = 0;
    ys = 0;
  }
  
  float getX() {
    return x;
  }
  
  float getY() {
    return y;
  }
  
  float getXS() {
    return xs;
  }
  
  float getYS() {
    return ys;
  }
}

class Food {
  float x, y;
  float xs, ys;
  
  float getX() {
    return x;
  }
  
  float getY() {
    return y;
  }
  
  float getXS() {
    return xs;
  }
  
  float getYS() {
    return ys;
  }
}
