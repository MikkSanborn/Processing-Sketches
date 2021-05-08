// static : level
public static class Environment {
  public static int level = 0;
  public static final float playerW = 25, playerH = 25;
  public static final float playerAccel = 2; // ['W', 'A', 'S', 'D'] or click to move?
  public static final float frictionDragDeccel = 0.2; // always applied in opposing direction of player movement.
  public static final color standardBGCol = -11472716; // change


  public Environment() {
  }
}

void keyReleased() {
  try {
    P.moveVert(levels[Environment.level].minZ, levels[Environment.level].maxZ); // do a thing with environment
  } 
  catch (ArrayIndexOutOfBoundsException e) {
    // Do nothing
  }
}

public void levelInit() {
  Object[] l0 = {new Object(0, 0, 0, 100, 400, 0, color(100, 200, 240))};
  levels[0] = new Level(l0);
  // Object[] l1 = {};
  // levels[1] = new Level(l1);
}

/*
Level ID's:
 -1 = Main
 -2 = Level Select
 
 Levels - 
 0 = Intro
 1 = More complex
 2
 3 = Full Screen
 4 = Small screen, 2/3 layers
 
 */
