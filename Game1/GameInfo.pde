class GameInfo {
  int level;
  boolean playerControl;
  int money;
  int timesDied;
  float g; // gravity
  
  
  GameInfo(int l, boolean pC) {
    level = l;
    playerControl = pC;
    money = 10;
    timesDied = 0;
    g = .1;
  }
  
  
}
