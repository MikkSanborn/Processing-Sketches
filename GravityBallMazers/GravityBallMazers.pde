ArrayList<Player> players = new ArrayList<Player>(); // represents all of the players. Starts at one, more can be added.
// ArrayList<Screen> Screens = new ArrayList<Screen>(); // represents all screens, i.e. main, plyr ctrl, general crtl's, and play
ArrayList<Level> levels = new ArrayList<Level>();

/*Screen TitleScreen; // title/main menu
Screen PlayerControlScreen; // control anything to do with players
Screen ControlScreen; // modify controls??
Screen GameScreen; // The border with a pause button, and 
Screen ErrorScreen;*/

Screen_Types current_screen = Screen_Types.Title; // represents the current screen being shown
Screen_Types next_screen = null; // Set to null until a screen change is requested. Once this is done, count <screen_fade> to 0, then set current_screen to next_screen, then next_screen to null. Reset screen_fade.
final int screen_fade_max = 30;
int screen_fade = screen_fade_max;

int curr_level = 0;

void setup() {
  size(1200, 800);
  
  players.add(new Player("p_one", ' ', color(40, 240, 173)));
  
  /*
  // 0 -- main menu/title
  TitleScreen = new Screen(); // add visual elements later 
  // 1 -- add plyrs
  PlayerControlScreen = new Screen();
  // 2 -- ctrls
  ControlScreen = new Screen();
  // 3 -- levels
  GameScreen = new Screen(); // this will take a Level object to be drawn within it.
  // 4 -- error
  ErrorScreen = new Screen();
  */
}

void draw() {
  background(0);
  
  displayScreen();
}

void keyPressed() {
  for (int i = 0; i < players.size(); i++) {
    players.get(i).setControl((char)keyCode, key, true);
  }
}

void keyReleased() {
  for (int i = 0; i < players.size(); i++) {
    players.get(i).setControl((char)keyCode, key, false);
  }
}
