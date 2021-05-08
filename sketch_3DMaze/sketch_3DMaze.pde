public PFont georgia;
public PFont georgiaItalic;

public Player P;
public Level[] levels;

void setup() {
  size(800, 500);

  georgia = loadFont("Georgia-Bold-48.vlw");
  georgiaItalic = loadFont("Georgia-BoldItalic-48.vlw");

  textFont(georgia);

  Environment.level = -1;

  P = new Player();

  levels = new Level[1];
  levelInit();
}

void draw() {
  display();
  // displayDebugOverlay();
}

/*
TO-DO: (add as found)
 Display correct level based on Env.lvl
 Create levels
 Create main screen
 
 
 */
