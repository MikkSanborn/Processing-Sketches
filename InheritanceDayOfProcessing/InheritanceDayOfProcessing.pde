GameObject[] objects;
int numObjects = 20;

void setup() {
  size(800, 600);
  
  //Recall: this creates SPACE to store GameObjects but doesn't 
  //actually create any GameObject objects
  objects = new GameObject[numObjects];

  //Now loop over the positions, assigning new objects to each position
  for (int pos = 0; pos < objects.length; pos++) {
    objects[pos] = createRandomGameObject();
  }
}


void draw() {
  background(120, 110, 236);

  //Tell all of the objects to act and draw 
  for (GameObject x : objects) {
    x.act();
    x.draw();
  }
}





/**
 *    This private method is a helper method, designed for internal use
 *    only. It gets a random number between 1 and 4 and then sends back
 *    a different, newly constructed object based on the random number.
 */
private GameObject createRandomGameObject() {
  //Use Processing's random() function to get an integer between 1 and 4
  int whichType = (int)(random(4)) + 1;

  //now use that int to create one of the subclasses
  if (whichType == 1) {
    return new RandomRelocator();
  } else if (whichType == 2) {
    return new RandomMotion();
  } else if (whichType == 3) {
    return new HorizontalMover();
  } else {  //note: since 4 is the only other option, just using else here
    return new MouseFollower();
  }
}
