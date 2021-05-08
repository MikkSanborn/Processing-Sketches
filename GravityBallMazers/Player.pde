public class Player {
  protected float x, y;
  protected float xs, ys;
  protected final color c;
  public final String name;
  public final char controlKey;
  protected boolean isUp; // ?? wut's this
  public final float m = 1; // just for the sake of the energy equation. This has no bearing on anything.
  public static final float r = 20;
  public static final float jumpHeight = 2;
  
  public static final float g = .1; // gavity constant
  
  public Player(String name, char controlKey, color c) {
    this.name = name;
    this.controlKey = controlKey;
    this.c = c;
  }
  
  boolean setControl(char kc, char k, boolean b) {
    if (kc == controlKey || k == controlKey) {
      return isUp = b;
    } 
    return b;
  }
  
  void setLocation(float x, float y) {
    this.x = x;
    this.y = y;
  }
  
  void setSpeed(float xs, float ys) {
    this.xs = xs;
    this.ys = ys;
  }
  
  void setAttributes(float x, float y, float xs, float ys) {
    this.x = x;
    this.y = y;
    this.xs = xs;
    this.ys = ys;
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
  
  void move() {
    ys+=m*g;
    
    x+=xs;
    y+=ys;
  }
  
  void jump() {
    y-= jumpHeight; // 
  }
  
}
