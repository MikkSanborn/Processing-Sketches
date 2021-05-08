/*
Trevor: story
Gavin: basic ideas 3:00
Alec: towers 2:30
Adam: enemies and pathing 2:00-1:30
Mikk: different waves 1:30-1:00
Trevor: wires
*/


//Global class declarations here

///////////////////////
//Global variables here
int gameState;
final int running = 0; // plug
final int settingUp = 1;
final int titleScreen = 2;
final int gameOver = 3;
Gameboard gb;
Title title;
Player p1;

ArrayList<Level> levels = new ArrayList<Level>();
public int curr_level = 1;
ArrayList<Projectile> proj;
ArrayList<Enemy> e;
ArrayList<Plug> plugs;
ArrayList<Wire> wires;
ArrayList<Tower> towers;
HashMap<String, Plug> plugs_by_id = new HashMap<String, Plug>();


///////////////////////
void setup() {
  size(1280, 720);
  gb = new Gameboard();
  title = new Title();
  imageMode(CORNER);
  switchToTitleScreen();
  plugs = new ArrayList<Plug>();
  wires = new ArrayList<Wire>();
  towers = new ArrayList<Tower>();
  e = new ArrayList<Enemy>();
  proj = new ArrayList<Projectile>();
  fillPlugsArray();
  fillWiresArray();
  fillEnemiesArray();

  levels.add(new Level());  

  p1 = new Player();
  colorMode(HSB);
}

void draw() {
  // println(frameRate);
  /*if(keyPressed){
    switchToGameOver();
  }*/
  if (gameState == running) {    
    gb.drawBoard(); //Trevor
    gb.updateEnemies();
    gb.showTowers();
    gb.controlTowers();
    gb.powerProjectiles();
    gb.runLevel();
  } else if (gameState == settingUp) {
    gb.drawBoard();
    p1.drawShop();//Gavin
    p1.shopLogic();//Gavin
    gb.showTowers();
  } else if (gameState == titleScreen) {
    title.display();
    title.click();
  } else if(gameState == gameOver){
     PImage wood = loadImage("wood.jpg");
    colorMode(RGB);
    background(0);
    
  //  pushMatrix();
    //rotate(PI/2);
    imageMode(CENTER);
    image(wood, width/2, height/2, width, height);
   // popMatrix();
    fill(0,0,0, 30);
    rectMode(CENTER);
    rect(width/2,height/2 + 100, 400, 100);
    textSize(30);
    fill(0);
    textSize(40);
    text("Game Over", width/2-textWidth("Game Over")/2,height/2 - 100);
    textSize(60);
    fill(0);
    stroke(0);
    text("Play Again?", width/2-textWidth("Play Again?")/2,height/2 +125);
  }
}

void switchToRunning() {

  gameState = running;
}
void switchToSettingUp() {

  gameState = settingUp;
}
void switchToTitleScreen() {

  gameState = titleScreen;
}
void switchToGameOver() {

  gameState = gameOver;
}

// ex: Plug p = getPlugByID(“c”);
Plug getPlugByID(String id) {
  return plugs_by_id.get(id);
}

void fillPlugsArray() {
  final float plug_r = 27;
  plugs.add(new Plug(new Position(107, 124, plug_r), "A"));
  plugs.add(new Plug(new Position(107, 194, plug_r), "a"));
  plugs.add(new Plug(new Position(205, 124, plug_r), "B"));
  plugs.add(new Plug(new Position(205, 194, plug_r), "b"));
  plugs.add(new Plug(new Position(307, 124, plug_r), "C"));
  plugs.add(new Plug(new Position(307, 194, plug_r), "c"));
  plugs.add(new Plug(new Position(417, 124, plug_r), "D"));
  plugs.add(new Plug(new Position(417, 194, plug_r), "d"));
  plugs.add(new Plug(new Position(515, 124, plug_r), "E"));
  plugs.add(new Plug(new Position(515, 194, plug_r), "e"));
  plugs.add(new Plug(new Position(584, 124, plug_r), "F"));
  plugs.add(new Plug(new Position(584, 194, plug_r), "f"));
  plugs.add(new Plug(new Position(680, 124, plug_r), "G"));
  plugs.add(new Plug(new Position(680, 194, plug_r), "g"));
  plugs.add(new Plug(new Position(779, 124, plug_r), "H"));
  plugs.add(new Plug(new Position(779, 194, plug_r), "h"));
  plugs.add(new Plug(new Position(878, 124, plug_r), "I"));
  plugs.add(new Plug(new Position(878, 194, plug_r), "i"));
  plugs.add(new Plug(new Position(968, 124, plug_r), "J"));
  plugs.add(new Plug(new Position(968, 194, plug_r), "j"));
  plugs.add(new Plug(new Position(156, 264, plug_r), "K"));
  plugs.add(new Plug(new Position(156, 328, plug_r), "k"));
  plugs.add(new Plug(new Position(259, 264, plug_r), "L"));
  plugs.add(new Plug(new Position(259, 328, plug_r), "l"));
  plugs.add(new Plug(new Position(364, 264, plug_r), "M"));
  plugs.add(new Plug(new Position(364, 328, plug_r), "m"));
  plugs.add(new Plug(new Position(467, 264, plug_r), "N"));
  plugs.add(new Plug(new Position(467, 328, plug_r), "n"));
  plugs.add(new Plug(new Position(633, 264, plug_r), "O"));
  plugs.add(new Plug(new Position(633, 328, plug_r), "o"));
  plugs.add(new Plug(new Position(729, 264, plug_r), "P"));
  plugs.add(new Plug(new Position(729, 328, plug_r), "p"));
  plugs.add(new Plug(new Position(829, 264, plug_r), "Q"));
  plugs.add(new Plug(new Position(829, 328, plug_r), "q"));
  plugs.add(new Plug(new Position(924, 264, plug_r), "R"));
  plugs.add(new Plug(new Position(924, 328, plug_r), "r"));
  plugs.add(new Plug(new Position(107, 397, plug_r), "S"));
  plugs.add(new Plug(new Position(107, 472, plug_r), "s"));
  plugs.add(new Plug(new Position(205, 397, plug_r), "T"));
  plugs.add(new Plug(new Position(205, 472, plug_r), "t"));
  plugs.add(new Plug(new Position(307, 397, plug_r), "U"));
  plugs.add(new Plug(new Position(307, 472, plug_r), "u"));
  plugs.add(new Plug(new Position(417, 397, plug_r), "V"));
  plugs.add(new Plug(new Position(417, 472, plug_r), "v"));
  plugs.add(new Plug(new Position(681, 397, plug_r), "W"));
  plugs.add(new Plug(new Position(681, 472, plug_r), "w"));
  plugs.add(new Plug(new Position(779, 397, plug_r), "X"));
  plugs.add(new Plug(new Position(779, 472, plug_r), "x"));
  plugs.add(new Plug(new Position(878, 397, plug_r), "Y"));
  plugs.add(new Plug(new Position(878, 472, plug_r), "y"));
  plugs.add(new Plug(new Position(967, 397, plug_r), "Z"));
  plugs.add(new Plug(new Position(967, 472, plug_r), "z"));

  for (Plug p : plugs) {
    plugs_by_id.put(p.getID(), p);
  }
}

void fillWiresArray() {
  wires.add(new Wire(getPlugByID("A"), getPlugByID("b"), 0, false));
  wires.add(new Wire(getPlugByID("b"), getPlugByID("L"), 0, true));
  wires.add(new Wire(getPlugByID("L"), getPlugByID("T"), 1, false));
  wires.add(new Wire(getPlugByID("T"), getPlugByID("t"), 0, true));
  wires.add(new Wire(getPlugByID("t"), getPlugByID("u"), 2, false));
  wires.add(new Wire(getPlugByID("u"), getPlugByID("v"), 0, true));
  wires.add(new Wire(getPlugByID("v"), getPlugByID("N"), 3, false));
  wires.add(new Wire(getPlugByID("N"), getPlugByID("E"), 0, true));
  wires.add(new Wire(getPlugByID("E"), getPlugByID("O"), 4, false));
  wires.add(new Wire(getPlugByID("O"), getPlugByID("g"), 0, true));
  wires.add(new Wire(getPlugByID("g"), getPlugByID("I"), 5, false));
  wires.add(new Wire(getPlugByID("I"), getPlugByID("J"), 0, true));
  wires.add(new Wire(getPlugByID("J"), getPlugByID("q"), 6, false));
  wires.add(new Wire(getPlugByID("q"), getPlugByID("X"), 0, true));
  wires.add(new Wire(getPlugByID("X"), getPlugByID("z"), 7, false));
}

void fillEnemiesArray() {
}
