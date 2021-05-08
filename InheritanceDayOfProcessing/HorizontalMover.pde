/**
 *    This class represents an object that moves left and right across the screen,
 *    changing directions when it reaches a left or right border. 
 *    
 *    When you draw this object, you can use an image, a rectangle, or an ellipse.
 *
 *    Feel free to add any other features to the class below (like more variables
 *    or new constructors/methods). HINT: You will need some variable that keeps 
 *    track of which direction you are currently moving in.
 */
class HorizontalMover extends GameObject {
  private boolean direction; // true = right...
  private int size;
  private float t;
  private PImage img;

  public HorizontalMover() {
    super();
    direction = random(0, 1) >= 0.5;

    img = loadImage("icon.png");
    size = 50;
    t = 0;
  }

  /**
   *    Write this act method so that the object modifies its x-coordinate
   *    every time this method is called. The object should move either to
   *    the left or to the right. The object should only switch directions
   *    when it hits a side wall.
   */
  public void act() {
    setX(getX() + 2*(direction ? 1:-1));

    if (getX() + size/2 >= width || getX() - size/2 <= 0) {
      direction = !direction;
    }
  }

  /**
   *    You get to decide what to draw here...
   */
  public void draw() {
    pushMatrix();
    translate(getX(), getY());
    rotate(t);
    imageMode(CENTER);
    image(img, 0, 0, size, size);
    t+=0.02;
    popMatrix();
  }
}
