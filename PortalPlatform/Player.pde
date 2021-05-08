public final class Player implements HasSize, IsLocatable, PastIsLocatable, IsDisplayable {
  private PlayerInfo info;
  
  public Player() {
    this.info = new PlayerInfo();
  }
  
  public Player(PlayerInfo p) {
    this.info = p;
  }
  
  public float getX() {
    return info.getX();
  }
  
  public float getY() {
    return info.getY();
  }
  
  public float getPX() {
    return info.getPX();
  }
  
  public float getPY() {
    return info.getPY();
  }
  
  public float getW() {
    return info.getW();
  }
  
  public float getH() {
    return getH();
  }
  
  
  
  public void display() {
    //
  }
  
}

public class PlayerInfo implements HasSize, IsLocatable, PastIsLocatable {
  public float x, y;
  public float px, py;
  public final float w; // does not change.
  public final float h; // does not change.
  public static final float defaultW = 30; // Choice for actual width not determined.
  public static final float defaultH = 110; // Choice for actual height not determined
  
  public PlayerInfo() {
    x = 0;
    y = 0;
    w = defaultW;
    h = defaultH;
  }
  
  public PlayerInfo(float w, float h) {
    this.w = w;
    this.h = h;
  }
  
  public float getX() {
    return x;
  }
  
  public float getY() {
    return y;
  }
  
  public float getPX() {
    return px;
  }
  
  public float getPY() {
    return py;
  }
  
  public float getW() {
    return w;
  }
  
  public float getH() {
    return h;
  }
}
