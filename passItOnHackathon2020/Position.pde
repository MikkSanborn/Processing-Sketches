class Position {
  public float x, y, r;
  Position(float x, float y, float r) {
    this.x = x;
    this.y = y;
    this.r = r;
  }
  Position(float x, float y) {
    this.x = x;
    this.y = y;
    this.r = 0;
  }
  boolean isContacting(Position p) {
    return distance(p)<=0;
  }
  float distance(Position p){
    float d = dist(this.x, this.y, p.x, p.y) - this.r - p.r;
    return d;
  }
  Position clone() {
    return new Position(x,y,r);
  }
}
