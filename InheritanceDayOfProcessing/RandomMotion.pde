/**
 *    This class represents an object that randomly moves around onscreen.
 *    Every frame, modify the x and y values of the object by some small random
 *    amount (this amount could be positive or negative). 
 *    
 *    When you draw this object, you can use an image, a rectangle, or an ellipse.
 *
 *    Feel free to add any other features to the class below (like more variables
 *    or new constructors/methods).
 */
class RandomMotion extends GameObject {
  private int range;
  private int size;
  private float t;
  private PImage img;

  public RandomMotion() {
    super();
    range = 10;

    img = loadImage("icon2.png");
    size = 50;
    t = 0;
  }

  /**
   *    Write this act method so that the object modifies its x- and y-coordinates
   *    every time this method is called. Add some small random amount to both.
   *    Be sure that you are getting a random number that can also be negative.
   */
  public void act() {
    setX(getX() + (int) (random(-range, range)));
    setY(getY() + (int) (random(-range, range)));

    if (getX()+size/2 > width || getX()-size/2 < 0) {
      setX((getX()+size/2 > width/2 ? width-size:size));
    }

    if (getY()+size/2 > height || getY()-size/2 < 0) {
      setY((getY()+size/2 > width/2 ? width-size:size));
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
