abstract class GameObject {

  /**  Subclasses can decide if this is the top-left (x,y) or
   *    if it is the center of the object...but I'd urge you to
   *    pick a model and be consistent with it (don't mix and match)
   */
  private int x, y;


  /**
   *    This constructor just randomizes the object's starting coordinates.
   */
  public GameObject() {
    x = (int)random(100, width - 100);
    y = (int)random(100, height - 100);
  }

  /**
   *    A simple method to retrieve the x-coordinate
   */
  public int getX() {
    return x;
  }

  /**
   *    A simple method to retrieve the y-coordinate
   */
  public int getY() {
    return y;
  }

  /**
   *    This method changes the x but only if the parameter is onscreen
   */
  public void setX(int x) {
    this.x = x;
  }

  /**
   *    This method changes the y but only if the parameter is onscreen
   */
  public void setY(int y) {
    this.y = y;
  }


  /**
   *    Subclasses must decide how they act...no default behavior  
   */
  public abstract void act();


  /**
   *    Subclasses must decide how they will be drawn...no defaults here
   */
  public abstract void draw();
}
