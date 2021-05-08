/**
 *    This class represents an object that randomly moves around onscreen.
 *    It only moves every 30 frames, using a counter in the act() method
 *    to keep track of the current frame number and only acting when
 *    appropriate.
 *    The object also draws itself using an image.
 */
class RandomRelocator extends GameObject {

  //A variable to track number of frames, used to only act every 30 frames 
  private int frameCounter; 

  //Keeps track of the size of the image (drawing it as a square, so
  //this will be both width and height)
  private int size;

  //A PImage variable to store the image used when drawing this thing
  private PImage img;

  public RandomRelocator() {
    super(); 
    frameCounter = 0;
    size = 50;
    img = loadImage("LancerBorderless.png");
  }


  /**
   *    We have to override the act method because it is
   *    abstract in our superclass.
   */
  public void act() {
    //count every frame
    frameCounter++;

    //every 30 frames, re-set the x and y values to random numbers
    if (frameCounter % 30 == 0) {
      setX( (int)random(size/2, width - size/2) );
      setY( (int)random(size/2, height - size/2) );
    }
  }


  /**
   *    We have to override the draw method because it is
   *    abstract in our superclass.
   */
  public void draw() {
    //sets mode so that x and y are center of image
    //and uses the version of image that accepts
    //the desired width and height as extra parameters
    //which effectively resizes the image
    imageMode(CENTER);
    image(img, getX(), getY(), size, size);
  }
}
