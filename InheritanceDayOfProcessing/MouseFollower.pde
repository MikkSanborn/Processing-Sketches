/**
 *    This class represents an object that moves towards the mouse. It should
 *    take small steps towards the mouse during each frame of the game (each
 *    time the act method is called).
 *    
 *    When you draw this object, you can use an image, a rectangle, or an ellipse.
 *
 *    Feel free to add any other features to the class below (like more variables
 *    or new constructors/methods).
 */
class MouseFollower extends GameObject {
  private int size;
  private PImage img;

  public MouseFollower() {
    super();
    size = 35;
    img = loadImage("MouseFollower.png");
  }

  /**
   *    Write this act method so that the object moves towards the mouse.
   *    Do not have the object teleport to the mouse's location...have it
   *    gradually move towards the mouse (perhaps have a maximum amount
   *    that it can move each time the act method is called). 
   */
  public void act() {
    setX(getX() + (getX() > mouseX ? -2:2));
    setY(getY() + (getY() > mouseY ? -2:2));
  }

  /**
   *    You get to decide what to draw here...
   */
  public void draw() {
    pushMatrix();
    translate(getX()-size/20, getY()-size/10);
    rotate(.18);
    imageMode(CORNER);
    image(img, 0, 0, size*5/8, size);
    popMatrix();
  }
}
