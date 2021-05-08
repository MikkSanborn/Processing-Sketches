abstract class CollidableObject {
  protected final float[] x, y;
  protected color c;
  
  public CollidableObject(float[] x, float[] y, color c) {
    this.x = x;
    this.y = y;
    this.c = c;
  }
  
  public CollidableObject(color c, float... coords) {
    if (coords.length%2 != 0) throw new IllegalArgumentException("Must have same number of X and Y coordinates in CollidableObject constructor.");
    this.c = c;
    this.x = new float[coords.length/2];
    this.y = new float[coords.length/2];
    
    for (int i = 0; i < x.length; i++) {
      this.x[i] = coords[i*2];
      this.y[i] = coords[i*2+1];
    }
  }
  
  public void display() {
    noStroke();
    fill(c);
    beginShape();
    for (int i = 0; i < x.length; i++) {
      vertex(x[i], y[i]);
    }
    endShape();
  }
  
  public abstract boolean collide(Player p);
  // public abstract void whenCollided(Player p);
}

abstract class CollidableRect extends CollidableObject {
  
  protected float w, h;
  
  public CollidableRect(float x, float y, float w, float h, color c) {
    super(c, x, y, x+w, y, x+w, y+h, x, y+h);
    this.w = w;
    this.h = h;
  }
  
  public void display() {
    noStroke();
    fill(c);
    rect(x[0], y[0], w, h);
  }
  
  public boolean collide(Player p) {
    return p.x+Player.r >= this.x[0] && p.y+Player.r >= y[0] && p.x-Player.r <= x[2] && p.y-Player.r <= y[2];
  }
}

class CollidableTriangle extends CollidableObject {
  
  protected final float cx, cy;
  protected final float[] m, b, t; // m[0] : (x[0], y[0])&(x[1], y[1]),, , t[0] = (x[0], y[0]) off of y = cy from x = cx?
  
  public CollidableTriangle(float x1, float y1, float x2, float y2, float x3, float y3, color c) {
    super(c, x1, y1, x2, y2, x3, y3);
    
    /*
    this.x[0] = x1;
    this.y[0] = y1;
    this.x[1] = x2;
    this.y[1] = y2;
    this.x[2] = x3;
    this.y[2] = y3;
    */
    
    this.cx = (this.x[0]+this.x[1]+this.x[2])/3;
    this.cy = (this.y[0]+this.y[1]+this.y[2])/3;
    
    this.m = new float[3];
    this.b = new float[3];
    this.t = new float[3];
    
    for (int i = 0; i < 3; i++) {
      this.m[i] = (this.y[i]-this.y[(i+1)%3])/(this.x[i]-this.x[(i+1)%3]);
      this.b[i] = this.y[i]-(this.m[i]*this.x[i]); // do logic later.
    }
  }
  
  public boolean collide(Player p) { // rip. use radians, bc processing.
    
    /*
      /|
    O/ |
    /  |
    ****
    
    slope of triangle, m
    take perp of m, create eq with (y=m(perp)x+b)
    solve system with eq of triangle and ^^, store to xf, yf
    if dist(xf, yf, p.x, p.y) <= r return true
    
    */
    
    return false;
  }
  
  public void whenCollided(Player p) {
    /*
      1. Find side
      2. Find current E
      3. Elastically bounce object off of the correct side based on 
    */
  }
}
